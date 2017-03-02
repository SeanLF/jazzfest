// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('turbolinks:load', function() {
  if (!($(".opportunity_applications.review").length > 0)) {
    return;
  }

  opportunity_application_availability = $('#opportunity_application_availability').val().split(',').filter(function(date) {return date !== ""}).sort()
  selected_dates_grouped_by_month = JSON.parse($('#selected_dates_grouped_by_month').text())
  opportunity_application_choices = JSON.parse($('#opportunity_application_choices').val())
  volunteer_opportunities = JSON.parse($('#volunteer_opportunities').text())
  opportunity_application_statuses = JSON.parse($('#opportunity_application_statuses').text())
  opportunity_application_status_id = parseInt($('#opportunity_application_opportunity_application_status_id').val())
  selected_accepted_volunteer_opportunity_id = $('#opportunity_application_accepted_volunteer_opportunity_id').val()


  $('.availability').append(
    [].concat.apply(
      [],
      Object.keys(selected_dates_grouped_by_month).map(function(monthName) {
        return [].concat.apply([$('<b>', {text: monthName})],
          selected_dates_grouped_by_month[monthName].map(function(day) {
            return createDateChip(day)
  }))})))

  $('.choices').append(
    opportunity_application_choices.map(function(volunteer_opportunity_id, index) {
      return createChoiceChip(index + 1, volunteer_opportunity_id, volunteer_opportunities[parseInt(volunteer_opportunity_id)])
  }))

  $('#select_accepted_volunteer_opportunity_id').append(
    opportunity_application_choices.map(function(volunteer_opportunity_id, index) {
      option = $('<option>', { 'data-volunteer-opportunity-id': volunteer_opportunity_id, value: volunteer_opportunity_id, text: volunteer_opportunities[parseInt(volunteer_opportunity_id)]})
      if (selected_accepted_volunteer_opportunity_id === volunteer_opportunity_id) $(option).attr('selected', 'selected')
      return option
  }))

  $('.review_status .mdl-card__actions').append(
    Object.keys(opportunity_application_statuses).map(function(status_id){
      status_id = parseInt(status_id)
      opportunity_application_status = opportunity_application_statuses[status_id]
      disabled = status_id === opportunity_application_status_id
      custom_class = disabled ? '' : ' mdl-color-text--' + opportunity_application_status.action_color
      return createActionLink(custom_class, status_id, opportunity_application_status.name, opportunity_application_status.action_name, disabled)
    })
  )

  $('form.edit_opportunity_application').on("ajax:success", function(e, data, status, xhr) {
    showToast('Application is now ' + data.opportunity_application_status.name.toLowerCase())
    location = '/opportunity_applications'
  }).on("ajax:error", function(e, data, status, xhr) {
    showToast('Something went wrong. Ask the admin to check the logs.')
  })

  function createChoiceChip(index, volunteer_opportunity_id, title){
    return $('<div>', { class: 'choice', 'data-volunteer-opportunity-id': volunteer_opportunity_id }).append(
      $('<div>', { class: 'mdl-chip mdl-chip--contact' }).append(
        $('<span>', { class: 'mdl-chip__contact mdl-color--teal mdl-color-text--white', text: index }),
        $('<span>', { class: 'mdl-chip__text', text: title })
  ))}

  function createDateChip(date){
    return $('<div>', { class: 'date', 'data-date': date }).append(
      $('<div>', { class: 'mdl-chip' }).append(
        $('<span>', { class: 'mdl-chip__text', text: date })
  ))}

  function createActionLink(custom_class, status_id, status_name, action_name, disabled){
    return $('<a>', {
      class: 'mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect' + custom_class,
      'data-status-id': status_id,
      'data-status-name': status_name,
      id: action_name,
      href: '#' + action_name,
      text: action_name,
      disabled: disabled
    }).bind('click', function(e) {
      e.preventDefault()
      target = e.target.closest('a')
      data = target.dataset
      if (target.attributes.disabled !== undefined && target.attributes.disabled.value === 'disabled') return null
      $('#opportunity_application_opportunity_application_status_id').val(data.statusId)
      $('#opportunity_application_accepted_volunteer_opportunity_id').val((target.dataset.statusName === "Accepted") ? $('form option:selected')[0].dataset.volunteerOpportunityId : null)
      $('.edit_opportunity_application').submit()
    })
  }
})
