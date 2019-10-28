$( document ).ready(function() {

document.getElementById("residential").style.display = "none";
document.getElementById("commercial").style.display = "none";
document.getElementById("corporate").style.display = "none";
document.getElementById("hybrid").style.display = "none";
});
const url = 'http://rocketelevatorsapi-env.ctzdz5unaz.ca-central-1.elasticbeanstalk.com/api/courses';


function on_change() {

    var sel = document.getElementById("buildingType").value;
    console.log(sel);

    if (sel != "none") {
        if (sel == "Residential") {
            document.getElementById("residential").style.display = "block";
            document.getElementById("commercial").style.display = "none";
            document.getElementById("corporate").style.display = "none";
            document.getElementById("hybrid").style.display = "none";
        }
        if (sel == "Commercial") {
            document.getElementById("commercial").style.display = "block";
            document.getElementById("residential").style.display = "none";
            document.getElementById("corporate").style.display = "none";
            document.getElementById("hybrid").style.display = "none";

        }
        if (sel == "Corporate") {
            document.getElementById("corporate").style.display = "block";
            document.getElementById("residential").style.display = "none";
            document.getElementById("commercial").style.display = "none";
            document.getElementById("hybrid").style.display = "none";

        }
        if (sel == "Hybrid") {
            document.getElementById("hybrid").style.display = "block";
            document.getElementById("residential").style.display = "none";
            document.getElementById("commercial").style.display = "none";
            document.getElementById("corporate").style.display = "none";

        }

    }
    else {
        document.getElementById("residential").style.display = "none";
        document.getElementById("commercial").style.display = "none";
        document.getElementById("corporate").style.display = "none";
        document.getElementById("hybrid").style.display = "none";
    }
}



function calcCorp_() {

}

function calcRes_() {

}

function calcCom_() {

}

function calcHyb_() {

}

 $('input[type=radio][name=quality]').change(function () {

    ql = document.querySelector('input[name="quality"]:checked').value;

    var sel = document.getElementById("buildingType").value;

    console.log(sel)

    if(sel == "Residential" ) {
        calcResidential()
    } else if(sel == "Commercial") {
        calcCommercial()
    } else if( sel == "Corporate") {
        calcCorporate()
    } else if (sel == "Hybrid") {
        calcHybrid()
    }

        });

    function calcResidential() {


        //Residential

        var num_floor_res = $("#numFloorsRes").val();
        var num_app_res = $("#numAppartement").val();

        $.ajax({
            type: 'POST',
            data: JSON.stringify({
                "num_floor_res": num_floor_res,
                "num_app_res": num_app_res,
                "ql": ql,
                "calcRes": calcRes_()
            }),
            contentType: 'application/json',
            url: url,
            success: function (data) {
                console.log('success');
                $('#numElevatorTotal').html(data.totalRes.num_Elevator_Cage_Res);
                $('#installPrice').html((data.totalRes.price_install_res));
                $('#totalPrice').html((data.totalRes.totalPrice));
                $('#aa').val(data.totalRes.price_install_res);
                $('#bb').val((data.totalRes.totalPrice));
                $('#cc').val(data.totalRes.num_Elevator_Cage_Res);

            }
        })
    };

    function calcCommercial() {

        //Commercial

        var num_cage_com = $("#num_LiftCage_Com").val();

        $.ajax({
            type: 'POST',
            data: JSON.stringify({
                "num_cage_com": num_cage_com,
                "ql": ql,
                "calcRes": calcCom_()
            }),
            contentType: 'application/json',
            url: url,
            success: function (data) {
                console.log('success');
                $('#numElevatorTotal').html(data.totalCom.num_cage);
                $('#installPrice').html((data.totalCom.price_install));
                $('#totalPrice').html((data.totalCom.totalPrice));
                $('#aa').val(data.totalCom.price_install);
                $('#bb').val((data.totalCom.totalPrice));
                $('#cc').val(data.totalCom.num_cage);
                
            }
        })
    };

    function calcCorporate() {

        //Corporate

        // var num_cage = DocumentTimeline;
        var num_floor_cr = $("#num_Floors_Corp").val();
        var num_base_cr = $("#num_Basement_Corp").val();
        var num_occ_cr = $("#num_Occ_Floor_Corp").val();
        console.log(num_occ_cr)

        $.ajax({
            type: 'POST',
            data: JSON.stringify({
                "num_occ_cr": num_floor_cr,
                "num_base_cr": num_base_cr,
                "num_floor_cr": num_occ_cr,
                "ql": ql,
                "calcCorp": calcCorp_()
            }),
            contentType: 'application/json',
            url: url,
            success: function (data) {
                console.log('success');
                $('#numElevatorTotal').html(data.totalCorp.TotalElevator);
                $('#installPrice').html((data.totalCorp.price_install));
                $('#totalPrice').html((data.totalCorp.totalPrice));
                $('#aa').val(data.totalCorp.price_install);
                $('#bb').val((data.totalCorp.totalPrice));
                $('#cc').val(data.totalCorp.TotalElevator);

            }
        })
    };

    function calcHybrid() {

        //Corporate

        // var num_cage = DocumentTimeline;
        var num_floor_hyb = $("#num_Floor_Hyb").val();
        var num_base_hyb = $("#num_Basement_Hyb").val();
        var num_occ_hyb = $("#num_Occ_Floor_Hyb").val();

        $.ajax({
            type: 'POST',
            data: JSON.stringify({
                "num_occ_hyb": num_floor_hyb,
                "num_base_hyb": num_base_hyb,
                "num_floor_hyb": num_occ_hyb,
                "ql": ql,
                "calcCorp": calcHyb_()
            }),
            contentType: 'application/json',
            url: url,
            success: function (data) {
                console.log('success');
                $('#numElevatorTotal').html(data.totalHyb.TotalElevator);
                $('#installPrice').html((data.totalHyb.price_install));
                $('#totalPrice').html((data.totalHyb.totalPrice));
                $('#aa').val(data.totalHyb.price_install);
                $('#bb').val((data.totalHyb.totalPrice));
                $('#cc').val(data.totalHyb.TotalElevator);

            }
        })

    };
    