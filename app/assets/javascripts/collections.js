
$(function() {

    const newLocal = "select#location";
    if ($(newLocal).val() == "") {
     $("select#family option").remove();
     var row = `<option value="">Family</option>`;
     $(row).appendTo("select#family");
    }
    $("select#location").change(function() {
        console.log("Rami");
     var id_value_string = $(this).val();
     if (id_value_string == "") {
      $("select#family option").remove();
      var row = `<option value="">Family</option>`;
      $(row).appendTo("select#family");
     } else {
      // Send the request and update course dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: `/get_family_by_location/${id_value_string}`,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        alert("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
        // Clear all options from course select
        $("select#family option").remove();
        //put in a empty default line
        var row = `<option value="">Family</option>`;
        $(row).appendTo("select#family");
        // Fill course select
        $.each(data, function(i, j) {
         row = `<option value="${j.id}">${j.title}</option>`;
         $(row).appendTo("select#family");
        });
       }
      });
     }
    });
 
   });