// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('turbolinks:load', function() {
  if (!($(".page-content.volunteer_opportunities").length > 0)) {
    return;
  }

  tinymce.init({
    selector: 'textarea:not(#volunteer_opportunity_title)'
  });
})
