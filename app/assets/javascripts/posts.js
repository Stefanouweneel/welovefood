function makePostsWYSIWIG() {
  $('textarea[name="post[description]"]').wysihtml5({
    toolbar: {
      "image": false, //Button to insert an image. Default true,
      "color": true, //Button to change color of font
    }
  });
}

function like(post_id) {

  $.ajax({
    type: "POST",
    url: "posts/"+ post_id+ "/likes",
    data: JSON.stringify({
        post_id: post_id
    }),
    contentType: "application/json",
    dataType: "json"
  });

  var count = parseInt($('#likes-count-'+ post_id).text());
  
  if ($('#like-'+ post_id).hasClass('btn-default')) {
    $('#like-'+ post_id).removeClass('btn-default');
    $('#like-'+ post_id).addClass('btn-danger');
    count = count + 1;

  } else {
    $('#like-'+ post_id).removeClass('btn-danger');
    $('#like-'+ post_id).addClass('btn-default');
    count = count - 1;
  }
  $('#likes-count-'+ post_id).text(count);
}

$(document).ready(makePostsWYSIWIG);
$(document).on('page:load', makePostsWYSIWIG);
