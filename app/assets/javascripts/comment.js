$(document).on('turbolinks:load', function () {
  
  $(function () {
    function buildHTML(data) {
      let html = `<div class="comment__list__wrapper">
      <div class="user__name">
                     ${data.user}
                     </div>
                  <div class="comment__content">
                     ${data.comment}
                     </div>
               </div>`
               return html;
  }
  $("#new_comment").on("submit", function (e) {
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr("action");
    
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
      .done(function (data) {
        let html = buildHTML(data);
        $(".comment__list").append(html);
        $(".comment__form").val("");
        $(".comment-button").prop("disabled", false);
      })
      .fail(function () {
        $(".comment-button").prop("disabled", false);
      })
    })
  });
});