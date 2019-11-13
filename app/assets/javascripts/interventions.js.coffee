# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    buildings = $('#intervention_building_id').html()
    console.log(buildings)
    
    $('#intervention_customer_id').change ->
        console.log 'CHANGE'
        customer = $('#intervention_customer_id :selected').text()
        options = $(buildings).filter("optgroup[label='#{customer}']").html()
        console.log(buildings)
        console.log(customer)
        console.log(options)
        if options
            $('#intervention_building_id').html(options)
        else
            $('#intervention_building_id').empty()
