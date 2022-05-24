// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"

Rails.start()
ActiveStorage.start()


import "../stylesheets/application"

document.addEventListener('turbo:load', () => {
  //lesson_work_form
  // document.querySelectorAll(".lesson_work_form").forEach((form) => {
  //   console.log(form);
  //   form.querySelectorAll("input, textarea, select").forEach((item) => {
  //     item.addEventListener("change",()=>{
  //       form.requestSubmit()
  //     })
  //   });
  // });

  //modal
  const newsModal = document.getElementById('newsModal')
  if(!newsModal) return
  newsModal.addEventListener('show.bs.modal', function(event) {
    //trigger
    const card = event.relatedTarget
    //parms
    const title = card.getAttribute('data-bs-modalTitle')
    const desc = card.getAttribute('data-bs-modalDesc')
    //elements
    const modalTitle = newsModal.querySelector('.modal__title')
    const modalBodyText = newsModal.querySelector('.modal__text')

    modalTitle.textContent = title
    modalBodyText.textContent = desc
  })
});
