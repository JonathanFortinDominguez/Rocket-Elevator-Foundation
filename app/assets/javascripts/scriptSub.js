// document.getElementById("residential").style.display = "none";
// document.getElementById("commercial").style.display = "none";
// document.getElementById("corporate").style.display = "none";
// document.getElementById("hybrid").style.display = "none";


// function on_change() {

//     var sel = document.getElementById("buildingType").value;
//     console.log(sel);

//     if (sel != 0) {
//         if (sel == 1) {
//             document.getElementById("residential").style.display = "block";
//             document.getElementById("commercial").style.display = "none";
//             document.getElementById("corporate").style.display = "none";
//             document.getElementById("hybrid").style.display = "none";
//         }
//         if (sel == 2) {
//             document.getElementById("commercial").style.display = "block";
//             document.getElementById("residential").style.display = "none";
//             document.getElementById("corporate").style.display = "none";
//             document.getElementById("hybrid").style.display = "none";

//         }
//         if (sel == 3) {
//             document.getElementById("corporate").style.display = "block";
//             document.getElementById("residential").style.display = "none";
//             document.getElementById("commercial").style.display = "none";
//             document.getElementById("hybrid").style.display = "none";

//         }
//         if (sel == 4) {
//             document.getElementById("hybrid").style.display = "block";
//             document.getElementById("residential").style.display = "none";
//             document.getElementById("commercial").style.display = "none";
//             document.getElementById("corporate").style.display = "none";

//         }

//     }
//     else {
//         document.getElementById("residential").style.display = "none";
//         document.getElementById("commercial").style.display = "none";
//         document.getElementById("corporate").style.display = "none";
//         document.getElementById("hybrid").style.display = "none";
//     }
// }


// //Residential

// var num_App;
// var num_Floors_Res;
// var num_Basement;
// var average_App;
// var num_Elevator_Cage_Res;
// var num_Col_Res;
// var cagePrice_Res;

// function calcResidential() {

//     //verifier change on key up
//     $('input[type=radio][name=quality]').change(function () {
//         calcResidential();
//     })

//     //Prender la valeur des inputs pour num_App et num_Floors
//     num_App = parseInt(document.getElementById("numAppartement").value)
//     num_Floors_Res = parseInt(document.getElementById("numFloorsRes").value)

//     //moyenne de logements par Ã©tages
//     average_App = Math.ceil(num_App / num_Floors_Res);

//     //cage d'ascenseur tout les 6 etages
//     num_Elevator_Cage_Res = Math.ceil(average_App / 6);

//     //+1 ascenceur chaque 20 etage
//     num_Col_Res = Math.ceil(num_Floors_Res / 20);
//     num_Elevator_Cage_Res = num_Elevator_Cage_Res * num_Col_Res;
//     document.getElementById("numElevatorTotal").value = num_Elevator_Cage_Res;

//     //cage price by ql
//     var cagePrices = cagePrice();
//     var price_install = num_Elevator_Cage_Res * cagePrices;
//     var totalPrice = installPrice(price_install);

//     //ne pas afficher Nan
//     if (isNaN(totalPrice)) {
//         totalPrice = 0;
//     }

//     //affichet les calcul dans la page
//     document.getElementById("totalPrice").innerHTML = totalPrice.toFixed(2);
//     document.getElementById("numElevatorTotal").innerHTML = num_Elevator_Cage_Res;
//     document.getElementById("installPrice").innerHTML = price_install.toFixed(2);

//     if (isNaN(price_install)) {
//         document.getElementById('installPrice').innerText = (0).toFixed(2);
//     }

//     if (isNaN(document.getElementById('numElevatorTotal').value)) {
//         document.getElementById('numElevatorTotal').innerText = 0;
//     }

// }

// //Commercial

// var num_cage_Com;
// var cagePrice_Com;

// function calcCommercial() {

//     //verifier change on key up
//     $('input[type=radio][name=quality]').change(function () {
//         calcCommercial();
//     })

//     //get valeur numCage 
//     num_cage_Com = parseInt(document.getElementById("num_LiftCage_Com").value)
//     console.log(num_cage_Com);

//     //calculer prix cage
//     cagePrice_Com = cagePrice();
//     var price_install = num_cage_Com * cagePrice_Com;
//     var totalPrice = Math.ceil(installPrice(price_install));

//     document.getElementById("totalPrice").innerHTML = totalPrice.toFixed(2);
//     document.getElementById("numElevatorTotal").innerHTML = num_cage_Com;
//     document.getElementById("installPrice").innerHTML = price_install.toFixed(2);

//     if (isNaN(num_cage_Com)) {
//         document.getElementById("totalPrice").innerHTML = (0).toFixed(2);;
//         document.getElementById("numElevatorTotal").innerHTML = "0";
//         document.getElementById("installPrice").innerHTML = (0).toFixed(2);
//     }


// }

// //Corporate

// var num_Occ_Corp_;
// var num_Floor_Corp_;
// var num_Basement_Corp_;
// var num_Occ_Total_Corp_;
// var num_Elevator_Corp_;
// var num_Col_Corp_;
// var total_Elevator_Corp_;
// var num_Cage_Corp_;
// var Cage_Price_Corp_;

// function calcCorp() {
//     //verifier change on key up
//     $('input[type=radio][name=quality]').change(function () {
//         calcCorp();
//     })

//     //get value nombre occupant max par floor
//     num_Occ_Corp_ = parseInt(document.getElementById("num_Occ_Floor-Corp").value);
//     //get value nombre floor max
//     num_Floor_Corp_ = parseInt(document.getElementById("num_Floors_Corp").value);
//     //get value nombre basement
//     num_Basement_Corp_ = parseInt(document.getElementById("num_Basement_Corp").value);

//     //multiplier occupant par nombre de floor et basement -> total occupant
//     num_Occ_Total_Corp_ = num_Occ_Corp_ * (num_Floor_Corp_ + num_Basement_Corp_);
//     num_Elevator_Corp_ = Math.ceil(num_Occ_Total_Corp_ / 1000);

//     //calculer nombre de collunm
//     num_Col_Corp_ = Math.ceil((num_Floor_Corp_ + num_Basement_Corp_) / 20);

//     //calcuer nombre cage
//     num_Cage_Corp_ = Math.ceil(num_Elevator_Corp_ * num_Col_Corp_);

//     //calculer nombre total elevators
//     total_Elevator_Corp_ = Math.ceil(num_Cage_Corp_ / num_Col_Corp_);

//     //calculer les prix
//     Cage_Price_Corp_ = cagePrice();
//     var price_install = total_Elevator_Corp_ * Cage_Price_Corp_;
//     var totalPrice = Math.ceil(installPrice(price_install));

//     //ne pas afficher Nan
//     if (isNaN(totalPrice)) {
//         totalPrice = 0;
//     }



//     //afficher les prix dans page
//     document.getElementById("totalPrice").innerHTML = totalPrice.toFixed(2);
//     document.getElementById("numElevatorTotal").innerHTML = total_Elevator_Corp_;
//     document.getElementById("installPrice").innerHTML = price_install.toFixed(2);

//     if (isNaN(price_install)) {
//         document.getElementById('installPrice').innerText = (0).toFixed(2);
//     }


//     if (isNaN(total_Elevator_Corp_)) {
//         document.getElementById('numElevatorTotal').innerText = "0";
//     }

// }

// //Hybride

// var num_Occ_Hyb_;
// var num_Floor_Hyb_;
// var num_Basement_Hyb_;
// var num_Occ_Total_Hyb_;
// var num_Elevator_Hyb_;
// var num_Col_Hyb_;
// var total_Elevator_Hyb_;
// var num_Cage_Hyb_;
// var Cage_Price_Hyb_;

// function calcHyb() {

//     //verifier change on key up
//     $('input[type=radio][name=quality]').change(function () {
//         calcHyb();
//     })

//     //get value nombre occupant max par floor
//     num_Occ_Hyb_ = parseInt(document.getElementById("num_Occ_Floor_Hyb").value);
//     //get value nombre floor max
//     num_Floor_Hyb_ = parseInt(document.getElementById("num_Floor_Hyb").value);
//     //get value nombre basement
//     num_Basement_Hyb_ = parseInt(document.getElementById("num_Basement_Hyb").value);

//     //multiplier occupant par nombre de floor et basement -> total occupant
//     num_Occ_Total_Hyb_ = num_Occ_Hyb_ * (num_Floor_Hyb_ + num_Basement_Hyb_);
//     num_Elevator_Hyb_ = Math.ceil(num_Occ_Total_Hyb_ / 1000);

//     //calculer nombre de collunm
//     num_Col_Hyb_ = Math.ceil((num_Floor_Hyb_ + num_Basement_Hyb_) / 20);

//     //calcuer nombre cage
//     num_Cage_Hyb_ = Math.ceil(num_Elevator_Hyb_ * num_Col_Hyb_);

//     //calculer nombre total elevators
//     total_Elevator_Hyb_ = Math.ceil(num_Cage_Hyb_ / num_Col_Hyb_);

//     //calculer les prix
//     Cage_Price_Hyb_ = cagePrice();
//     var price_install = total_Elevator_Hyb_ * Cage_Price_Hyb_;
//     var totalPrice = Math.ceil(installPrice(price_install));

//     //ne pas afficher Nan
//     if (isNaN(totalPrice)) {
//         totalPrice = 0;
//     }


//     //afficher les prix dans page
//     document.getElementById("totalPrice").innerHTML = totalPrice.toFixed(2);
//     document.getElementById("numElevatorTotal").innerHTML = total_Elevator_Hyb_;
//     document.getElementById("installPrice").innerHTML = price_install.toFixed(2);

//     if (isNaN(price_install)) {
//         document.getElementById('installPrice').innerText = (0).toFixed(2);
//     }

//     if (isNaN(total_Elevator_Hyb_)) {
//         document.getElementById('numElevatorTotal').innerText = "0";
//     }

// }


// //calcuer prix selon la qliter
// function cagePrice() {
//     ql = document.querySelector('input[name="quality"]:checked').value;

//     if (ql == "standard") {
//         return 7565;
//     } else if (ql == "premium") {
//         return 12345;
//     } else if (ql == "excelium") {
//         return 15400
//     }

// };

// //claculer prix installation selon wqualiter
// function installPrice(price_install) {
//     ql = document.querySelector('input[name="quality"]:checked').value;
//     if (ql == "standard") {
//         return price_install * 1.10;
//     } else if (ql == "premium") {
//         return price_install * 1.13;
//     } else if (ql == "excelium") {
//         return price_install * 1.16;

//     }
// }



