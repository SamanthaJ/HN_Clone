//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

$( document ).ready( function () {
  $(".page-content").fadeIn('slow');
  createLinkListener();

  function createLinkListener() {
    $(".create-link").click(function() {
      $(".hidden-form-container").fadeIn("slow")
      $(".create-link").hide()
    });
  }

  $(document).on('page:fetch', function() {
    $(".page-content").fadeOut();
  });

  $(document).on('page:load', function() {
    $(".page-content").fadeIn('slow');
    createLinkListener()
  });
});
