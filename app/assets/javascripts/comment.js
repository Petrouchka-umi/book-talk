$(function(){
  function buildHTML(comment){
    let html = `<ul>
                  <li class="comment_user">
                    <strong>
                      <a class="comment_user" href=${comment.user_id}>${comment.user_nickname}</a>
                    </strong>
                  </li>
                  <li class="comment_message"> * 
                    ${comment.text}
                  </li>
                </ul>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data); 
      console.log(html)
      $('.comments').append(html);
      $('.comment_text').val('');
      $('.submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})