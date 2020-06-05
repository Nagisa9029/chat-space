$(function(){
  function buildHTML(message){
    if ( message.image ) {
      let html = `<div class="ChatField">
                    <div class="ChatField__Info">
                      <div class="ChatField__Info__Name">
                        ${message.user_name}
                      </div>
                      <div class="ChatField__Info__CreatedAt">
                        ${message.created_at}
                      </div>
                    </div>
                    <div class="ChatField__Message">
                      <p class="ChatField__Message__comment">
                        ${message.comment}
                      </p>
                      <img class="ChatField__Message__Image" src="${message.image}">
                    </div>
                  </div>`
      return html;
    } else {
      let html = `<div class="ChatField">
                    <div class="ChatField__Info">
                      <div class="ChatField__Info__Name">
                        ${message.user_name}
                      </div>
                      <div class="ChatField__Info__CreatedAt">
                        ${message.created_at}
                      </div>
                    </div>
                    <div class="ChatField__Message">
                      <p class="ChatField__Message__comment">
                        ${message.comment}
                      </p>
                    </div>
                  </div>`
      return html;
    };
  }

  $('.Form').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      console.log(html);
    })
  })
});