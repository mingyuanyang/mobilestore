var show_answer1 = function (e) {
    e.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function (data) {
        $("#answer2").fadeOut();
        $("#answer3").fadeOut();
        $("#answer4").fadeOut();
        $("#answer5").fadeOut();

        $("#answer1").hide().html(data).fadeIn('slow');

    });
}
var show_answer2 = function (e) {
    e.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function (data) {
        $("#answer1").fadeOut();
        $("#answer3").fadeOut();
        $("#answer4").fadeOut();
        $("#answer5").fadeOut();
        $("#answer2").hide().html(data).fadeIn('slow');

    });
}
var show_answer3 = function (e) {
    e.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function (data) {
        $("#answer1").fadeOut();
        $("#answer2").fadeOut();
        $("#answer4").fadeOut();
        $("#answer5").fadeOut();
        $("#answer3").hide().html(data).fadeIn('slow');

    });
}
var show_answer4 = function (e) {
    e.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function (data) {
        $("#answer1").fadeOut();
        $("#answer2").fadeOut();
        $("#answer3").fadeOut();
        $("#answer5").fadeOut();
        $("#answer4").hide().html(data).fadeIn('slow');

    });
}
var show_answer5 = function (e) {
    e.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function (data) {
        $("#answer1").fadeOut();
        $("#answer2").fadeOut();
        $("#answer3").fadeOut();
        $("#answer4").fadeOut();
        $("#answer5").hide().html(data).fadeIn('slow');

    });
}


$("#question1").on("click", show_answer1);
$("#question2").on("click", show_answer2);
$("#question3").on("click", show_answer3);
$("#question4").on("click", show_answer4);
$("#question5").on("click", show_answer5);