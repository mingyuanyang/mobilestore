var show_store = function(e){
    e.preventDefault();

   $.get('/store.txt', function(data) {
        alert(data);
   }, "text");
}
var show_storeowner = function(e){
    e.preventDefault();

    $.get('/storeowner.txt', function(data) {
        alert(data);
    }, "text");
}
var show_storemanager = function(e){
    e.preventDefault();

    $.get('/storemanager.txt', function(data) {
        alert(data);
    }, "text");
}
var show_storestaff1 = function(e){
    e.preventDefault();

    $.get('/storestaff1.txt', function(data) {
        alert(data);
    }, "text");
}
var show_storestaff2 = function(e){
    e.preventDefault();

    $.get('/storestaff2.txt', function(data) {
        alert(data);
    }, "text");
}
var show_storestaff3 = function(e){
    e.preventDefault();

    $.get('/storestaff3.txt', function(data) {
        alert(data);
    }, "text");
}







$("#store").on("click", show_store);
$("#storeowner").on("click", show_storeowner);
$("#storemanager").on("click", show_storemanager);
$("#storestaff1").on("click", show_storestaff1);
$("#storestaff2").on("click", show_storestaff2);
$("#storestaff3").on("click", show_storestaff3);