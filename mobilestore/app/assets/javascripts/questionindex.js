
var show_a_question = function (e) {
    e.preventDefault();
    $("#textmessage").empty();
    $("#question_index").empty();
    var url = $(this).attr("href");
    $.get(url, function (data) {
        $("#show_edit_area").hide().html(data).fadeIn('slow');
    });
}

var edit_a_question = function (e) {
    e.preventDefault();
    $("#textmessage").empty();
    $("#question_index").empty();
    var url = $(this).attr("href");
    $.get(url, function (data) {
        $("#show_edit_area").hide().html(data).fadeIn('slow');
            $("#show_edit_area form").on("submit", monitor_form);
    });
}

var monitor_form = function (e) {
    e.preventDefault();

    var submitOK = true
    var yourname = $("#question_name").val();
    var yourmobile = $("#question_mobile").val();
    var yourquestion = $("#question_your_question").val();
    if (yourname.length === 0) {
        alert("Your name can not be empty.")
        submitOK = "false"
    }
    if (yourmobile.length === 0) {
        alert("Your mobile can not be empty.")
        submitOK = "false"
    }
    if (yourquestion.length === 0) {
        alert("Your question can not be empty.")
        submitOK = "false"
    }
    if (submitOK == "false") {
        return false
      //  leave_a_question();
    }

    $("#show_edit_area").empty();
    message = "This question was updated successfully!";
    $("#textmessage").text(message);
    var data = {};
    $(this).find("input, textarea").each(function () {
        var name = $(this).attr("name");
        var value = $(this).val();
        data[name] = value;
    });
    var url = $(this).attr("action");
    $.ajax({
        url: url,
        method: $(this).attr("method"),
        data: data,
        complete: function () {
            $.get(url, edit_a_question);
        }
    });

  setTimeout( function (){ $.get("/myindex", function (data) {
        $("#question_index").hide().html(data).fadeIn('slow');
    }); },500)
}







$(".show_question").on("click", show_a_question);
$(".edit_question").on("click", edit_a_question);
