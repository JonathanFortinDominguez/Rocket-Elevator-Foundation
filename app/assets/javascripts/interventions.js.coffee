# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
    buildings = $('#intervention_building_id').html()
    $('#intervention_customer_id').change ->
        $("#battery_select").hide()
        $("#column_select").hide()
        $("#elevator_select").hide()
        customer = $('#intervention_customer_id :selected').text()
        options_customer = $(buildings).filter("optgroup[label='#{customer}']").prepend('<option value="">Select Building</option>').html()
        console.log(options_customer)
        if options_customer
            $('#intervention_building_id').html(options_customer)
            $("#building_select").show()
        else 
            customer_id = ""
            $("#building_select").hide()

jQuery ->
    batteries = $('#intervention_battery_id').html()
    $('#intervention_building_id').change ->
        $("#column_select").hide()
        $("#elevator_select").hide()
        building = $('#intervention_building_id :selected').text()
        options_building = $(batteries).filter("optgroup[label='#{building}']").prepend('<option value="">None chosen</option>').html()
        console.log(options_building)
        if options_building
            $('#intervention_battery_id').html(options_building)
            $("#battery_select").show()
        else 
            building_id = ""
            $("#battery_select").hide()

jQuery ->
    columns = $('#intervention_column_id').html()
    $('#intervention_battery_id').change ->
        $("#elevator_select").hide()
        battery = $('#intervention_battery_id :selected').text()
        options_battery = $(columns).filter("optgroup[label='#{battery}']").prepend('<option value="">None chosen</option>').html()
        if options_battery
            $('#intervention_column_id').html(options_battery)
            $("#column_select").show()
        else 
            battery_id = ""
            $("#column_select").hide()

jQuery ->
    elevators = $('#intervention_elevator_id').html()
    $('#intervention_column_id').change ->
        column = $('#intervention_column_id :selected').text()
        options_column = $(elevators).filter("optgroup[label='#{column}']").prepend('<option value="">None chosen</option>').html()       
        if options_column
            $('#intervention_elevator_id').html(options_column)
            $("#elevator_select").show()
        else
            column_id = ""
            $("#elevator_select").hide()


        





