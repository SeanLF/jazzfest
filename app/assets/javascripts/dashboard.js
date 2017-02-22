document.addEventListener('turbolinks:load', function() {
  if (!($(".dashboard.show").length > 0)) {
    return;
  }
  Stepper = setupStepper()
  setupMaterialForm()
  setupProfileStep(Stepper)
});

function setupStepper(){
  // Select your stepper element.
  var stepperElement = document.querySelector('ul.mdl-stepper');
  var Stepper;

  // Check if MDL Component Handler is loaded.
  if (typeof componentHandler !== 'undefined') {
    // Get the MaterialStepper instance of element to control it.
    Stepper = stepperElement.MaterialStepper;
    stepperElement.addEventListener('onstepnext', function (event) {
      form = $(Stepper.getActive().querySelector('form'))
      if (form[0].checkValidity()){
        form.submit()
      } else {
        form.reportValidity()
        Stepper.error()
      }
    });
    stepperElement.addEventListener('onstepback', function (event) {Stepper.back();});
    stepperElement.addEventListener('onsteppercomplete', function (event) {location.href=successPath})
  }

  return Stepper
}

function setupMaterialForm(){
  // upgrade inputs
  inputs = $('.field input:not(:radio):not(:checkbox):not(:hidden)')
  inputs.parent().addClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label")
  inputs.addClass("mdl-textfield__input")
  inputs.siblings('label').addClass("mdl-textfield__label")

  // upgrade textfields
  textareas = $('.field textarea')
  textareas.parent().addClass("mdl-textfield mdl-js-textfield")
  textareas.addClass("mdl-textfield__input")
  textareas.siblings('label').addClass("mdl-textfield__label")
  componentHandler.upgradeAllRegistered();
}

function setupProfileStep(Stepper){
  $("form.edit_profile").on("ajax:success", function(e, data, status, xhr) {
    $("form.edit_profile").clear_form_errors()
    Stepper.next()
    setupAvailabilityStep(Stepper)
    showToast('Your profile was successfully updated')
    location.hash = 'stepper-step-availability'
  }).on("ajax:error", function(e, data, status, xhr) {
    Stepper.error()
    showToast('Your profile could not be saved')
    location.hash = 'stepper-step-profile'
    return $("form.edit_profile").render_form_errors('profile', data.responseJSON);
  });
}

function setupAvailabilityStep(Stepper){
  // add dates from input
  datesFromInput = $('#opportunity_application_availability').val().split(',')

  $('#opportunity_application_availability').datepicker({
    firstDay: 1,
    minDate: window.festival_start_date,
    maxDate: window.festival_end_date,
    selectedDates: datesFromInput
  })

  $("#stepper-step-availability form.edit_opportunity_application").on("ajax:success", function(e, data, status, xhr) {
    $("#stepper-step-availability form.edit_opportunity_application").clear_form_errors()
    Stepper.next()
    setupRankChoicesStep(Stepper)
    showToast('Your availability has been successfully recorded')
    location.hash = 'stepper-step-rank-choices'
  }).on("ajax:error", function(e, data, status, xhr) {
    Stepper.error()
    showToast('You have not selected enough dates')
    location.hash = 'stepper-step-availability'
    return $("#stepper-step-availability form.edit_opportunity_application").render_form_errors('opportunity_application', data.responseJSON);
  });
}

function setupRankChoicesStep(Stepper){
  sortable('.choices', {
    item: 'li',
    forcePlaceholderSize: true,
    hoverClass: 'is-hovered',
  })[0].addEventListener('sortupdate', function(e) {updateChoiceIndices();updateChoicesInputFieldFromDOM()})
  $('.source tr input').on('change', function(e){
    // find volunteer opportunity title
    row = $(this).closest('tr')
    selectChoice(row) // add chip for new choice
  })
  if ($('.choices').children().length === 0){
    updateDOMfromChoicesInputField() // load from last save
  }

  $("#stepper-step-rank-choices form.edit_opportunity_application").on("ajax:success", function(e, data, status, xhr) {
    $("#stepper-step-rank-choices form.edit_opportunity_application").clear_form_errors()
    Stepper.next()
    showToast('Your ranked choices have been recorded')
  }).on("ajax:error", function(e, data, status, xhr) {
    Stepper.error()
    showToast('Please select at least one opportunity')
    location.hash = 'stepper-step-rank-choices'
    return $("#stepper-step-rank-choices form.edit_opportunity_application").render_form_errors('opportunity_application', data.responseJSON);
  });
}

function getChoiceCount(){
  return $('.choices').children().length
}

function limitChoices(index){
  if (getChoiceCount() >= 4){
    sortable('.choices', 'disable')
    $('.source .mdl-js-checkbox').each(function(){this.MaterialCheckbox.disable()})
    $('.source').hide()
  } else {
    sortable('.choices', 'enable')
    $('.source .mdl-js-checkbox').each(function(){this.MaterialCheckbox.enable()})
    $('.source').show()
  }
  updateChoicesInputFieldFromDOM()
}

function selectChoice(row){
  index = getChoiceCount() + 1
  volunteer_opportunity_id = row[0].dataset.volunteerOpportunityId
  title = row[0].dataset.volunteerOpportunityTitle
  row.hide()
  $('.choices').append(createChip(index, volunteer_opportunity_id, title,
    (function() {
      return function() {
        row.show().removeClass('is-selected')
        row.find('.mdl-js-checkbox')[0].MaterialCheckbox.uncheck()
        $(this).closest('.choice').remove()
        updateChoiceIndices()
        limitChoices(getChoiceCount())
      };
    })(row, this)
  )[0])
  limitChoices(index)
  sortable('.choices'); // update sortable to allow sorting of new item
}

function createChip(index, volunteer_opportunity_id, title, callback){
  return $('<div>', { class: 'choice', 'data-volunteer-opportunity-id': volunteer_opportunity_id }).append(
    $('<div>', { class: 'mdl-chip mdl-chip--contact' }).append(
    $('<span>', { class: 'mdl-chip__contact mdl-color--teal mdl-color-text--white', text: index }),
    $('<span>', { class: 'mdl-chip__text', text: title }),
    $('<a>', { class: 'mdl-chip__action' }).append(
      $('<i>', { class: 'material-icons', text: 'cancel' })
    ).bind('click', callback)))
}

function updateChoiceIndices(){
  $('.choice span:first-child').each(function(i){
    $(this).text(i+1)
  })
}

function updateDOMfromChoicesInputField(){
  textFromField = $('#opportunity_application_choices').val()

  // return if empty
  if (textFromField === ""){
    return
  }


  JSON.parse(textFromField).forEach(function(id){
    selectChoice($('.source tr[data-volunteer-opportunity-id='+id+']'))
  })
}

function updateChoicesInputFieldFromDOM(){
  choices = $.map($('.choices .choice'), function(e, i){return e.dataset.volunteerOpportunityId})
  $('#opportunity_application_choices').text(JSON.stringify(choices))
  $('#opportunity_application_choices').val(JSON.stringify(choices))
}
