function makePostsWYSIWIG() {
  $('textarea[name="post[description]"]').wysihtml5({
    toolbar: {
      "image": false, //Button to insert an image. Default true,
      "color": true, //Button to change color of font
    }
  });
}
$(document).ready(makePostsWYSIWIG);
$(document).on('page:load', makePostsWYSIWIG);
