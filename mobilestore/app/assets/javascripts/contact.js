var leave_a_question = function (e) {
    e.preventDefault();
    $("#message").empty();
    var url = $(this).attr("href");
    $.get(url, function (data) {
        $("#question_area").html(data);
        $("#question_area form").on("submit", monitor_form);
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

    $("#question_area").empty();
    message = "Thank you for your question, we'll ring you soon";
    $("#message").text(message);
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
            $.get(url, leave_a_question);
        }
    });
}
$("#site_contact a").on("click", leave_a_question);