(function($) {
   "use strict";
   $('#nbtn').click(function() {
      $('#postsCarousel').carousel('next');
      return false;
   });
   $('#pbtn').click(function() {
      $('#postsCarousel').carousel('prev');
      return false;
   });
})(jQuery);