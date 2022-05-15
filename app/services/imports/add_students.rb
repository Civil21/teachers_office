module Imports
  class AddStudents < ApplicationService
    attr_reader :file
    attr_accessor :row

    def initialize(file)
      @file = file
    end

    def call
      add_students
    end

    private

    def open_file
      @open_file ||= open_spreadsheet(File.extname(file.original_filename), file.path)
    end

    def first_sheet
      open_file.sheets.first
    end

    def sheet
      @shhet ||= open_file.sheet(first_sheet)
    end

    def add_students
      (first_row..last_row).each do |i|
        @row = Hash[[header, sheet.row(i)].transpose]
        add_student
      end
    end

    def header
      @headers ||= sheet.row(1)
    end

    def first_row
      2
    end

    def last_row
      @last_row ||= sheet.last_row
    end

    def add_student
      group = Group.find_or_create_by(
        faculty: row['Факультет'],
        specialty: row['Спеціальність'],
        cource: row['Курс'],
        group: row['Група'],
        sub_group: row['Підгрупа']
      )
      group.update(name: [group.faculty,group.specialty,group.cource,group.group,group.sub_group].join("_"))
      student = Student.find_or_create_by(name: row['ПІБ'], group: group)
    end

    def open_spreadsheet(extname, path)
      case extname
      when '.csv' then Roo::Csv.new(path)
      when '.xls' then Roo::Excel.new(path)
      when '.xlsx' then Roo::Excelx.new(path)
      else raise "Unknown file type: #{extname}"
      end
    end
  end
end
