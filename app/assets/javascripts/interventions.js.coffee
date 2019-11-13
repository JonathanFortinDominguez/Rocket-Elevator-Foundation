# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    buildings =$('#intervention_building_id').html()
    console.log(buildings)
    $('#intervention_customer_id').change ->
        customer =$('#intervention_customer_id :selected').text()
        options_building =$(buildings).filter("optgroup[label='#{customer}']").html()
        console.log(options_building)
        console.log(customer)
        if options_building
            $('#intervention_building_id').parent().show()
        else
            $('#intervention_building_id').empty()


