
var didScroll;
var lastScrollTop = 0;
var delta = 3;
var navbarHeight = $('.navbar').outerHeight();

$(window).scroll(function(e) {
	hasScrolled();
});

function hasScrolled() {
  var st = $(this).scrollTop();

  if(Math.abs(lastScrollTop - st) <= delta)
    return;
  
  if (st > lastScrollTop && st > navbarHeight) {
    $('nav').removeClass('navbar-transparent').removeClass('navbar').addClass('navbar-up');
  } else if (st === 0) {
    $('nav').removeClass('navbar').removeClass('navbar-up').addClass('navbar-transparent');;
  } else {
    if(st + $(window).height() < $(document).height()) {
      $('nav').removeClass('navbar-transparent').removeClass('navbar-up').addClass('navbar');
    }
  }
  
  lastScrollTop = st;
}

$(function() {

  $('#nav li a').click(function() {
    $('#nav li').removeClass();
    $($(this).attr('href')).addClass('active');
  });

/*  $('a').fluidbox({
    viewportFill: 1.8,
    closeTrigger: [
      {
        selector: 'window',
        //event: 'scroll'
      }
    ]
  });*/

  $('.show-comment').on('click', function() {   
    var disqus_shortname = 'devahoy';
    $.ajax({
      type: "GET",
      url: "http://" + disqus_shortname + ".disqus.com/embed.js",
      dataType: "script",
      cache: true
    });

    $(this).fadeOut();
  });

});
