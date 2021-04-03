$.ajaxSetup({
  dataType: 'json'
})

var iosDragDropShim = { holdToDrag: 100 }
window.addEventListener( 'touchmove', function() {})


document.addEventListener('turbolinks:load', function() {
  componentHandler.upgradeDom();

  // Material ripple button for form submit buttons
  $('form .actions input').addClass('mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored')
  $('.mdl-card__actions').children('a').addClass('mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect')

  convertNoticeToToast()
});

function convertNoticeToToast(){
  var notice = $('#notice')
  notice.hide()
  showToast(notice.text())
}

function showToast(text){
  if (typeof text === "string" && text !== ""){
    var snackbarContainer = document.querySelector('#toast');
    snackbarContainer.MaterialSnackbar.showSnackbar({message: text, timeout: 5000});
  }
}

// src=http://stefan.magnuson.co/articles/rails/simpler-handling-of-ajax-form-errors-in-rails-4/
$.fn.render_form_errors = function(model_name, errors) {
  var form;
  form = this;
  this.clear_form_errors();
  return $.each(errors, function(field, messages) {
    var input;
    input = form.find('input, select, textarea').filter(function() {
      var name;
      name = $(this).attr('name');
      if (name) {
        return name.match(new RegExp(model_name + '\\[' + field + '\\(?'));
      }
    });
    input.closest('.field').addClass('is-invalid');
  });
};
$.fn.clear_form_errors = function() {
  this.find('.field').removeClass('is-invalid');
};
$.fn.clear_form_fields = function() {
  return this.find(':input', '#myform').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
};
