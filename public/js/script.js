"use strict";

/* ==== Jquery Functions ==== */
(function($) {
	
	$('.mian_slider').slick({
		infinite: true,
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
  		autoplaySpeed: 2000,
		arrows:false,
		dots: true,
	});

	$('.company_profile').slick({
		infinite: true,
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
  		autoplaySpeed: 2000,
		dots: false,
		arrows: true,
        prevArrow: '<i class="fa fa-chevron-left" aria-hidden="true"></i>',
        nextArrow: '<i class="fa fa-chevron-right" aria-hidden="true"></i>',
	});

	$('.companies').slick({
		infinite: true,
		slidesToShow: 6,
		slidesToScroll: 1,
		dots: false,
		arrows: true,
        prevArrow: '<i class="fa fa-chevron-left" aria-hidden="true"></i>',
        nextArrow: '<i class="fa fa-chevron-right" aria-hidden="true"></i>',
		centerPadding: '60px',
		autoplay: true,
  		autoplaySpeed: 2000,
		responsive: [
			{
				breakpoint: 968,
				settings: {
				  arrows: false,
				  centerMode: true,
				  centerPadding: '40px',
				  slidesToShow: 3
				}
			  },
			{
			  breakpoint: 768,
			  settings: {
				arrows: false,
				centerMode: true,
				centerPadding: '40px',
				slidesToShow: 2
			  }
			},
			{
			  breakpoint: 480,
			  settings: {
				arrows: false,
				centerMode: true,
				centerPadding: '40px',
				slidesToShow: 1
			  }
			}
		  ]
	});

	$('.school_slider').slick({
		infinite: true,
		slidesToShow: 6,
		slidesToScroll: 1,
		dots: false,
		arrows: true,
        prevArrow: '<i class="fa fa-chevron-left" aria-hidden="true"></i>',
        nextArrow: '<i class="fa fa-chevron-right" aria-hidden="true"></i>',
		centerPadding: '60px',
		autoplay: true,
  		autoplaySpeed: 2000,
		responsive: [
			{
				breakpoint: 968,
				settings: {
				  arrows: false,
				  centerMode: true,
				  centerPadding: '40px',
				  slidesToShow: 3
				}
			  },
			{
			  breakpoint: 768,
			  settings: {
				arrows: false,
				centerMode: true,
				centerPadding: '40px',
				slidesToShow: 2
			  }
			},
			{
			  breakpoint: 480,
			  settings: {
				arrows: false,
				centerMode: true,
				centerPadding: '40px',
				slidesToShow: 1
			  }
			}
		  ]
	});

	$('.college_slider').slick({
		infinite: true,
		slidesToShow: 6,
		slidesToScroll: 1,
		dots: false,
		arrows: true,
        prevArrow: '<i class="fa fa-chevron-left" aria-hidden="true"></i>',
        nextArrow: '<i class="fa fa-chevron-right" aria-hidden="true"></i>',
		centerPadding: '60px',
		autoplay: true,
  		autoplaySpeed: 2000,
		responsive: [
			{
				breakpoint: 968,
				settings: {
				  arrows: false,
				  centerMode: true,
				  centerPadding: '40px',
				  slidesToShow: 3
				}
			  },
			{
			  breakpoint: 768,
			  settings: {
				arrows: false,
				centerMode: true,
				centerPadding: '40px',
				slidesToShow: 2
			  }
			},
			{
			  breakpoint: 480,
			  settings: {
				arrows: false,
				centerMode: true,
				centerPadding: '40px',
				slidesToShow: 1
			  }
			}
		  ]
	});
	
	
	
	/* ==== Revolution Slider ==== */
	if($('.tp-banner').length > 0){
		$('.tp-banner').show().revolution({
			delay:6000,
	        startheight:550,
	        startwidth: 1140,
	        hideThumbs: 1000,
	        navigationType: 'none',
	        touchenabled: 'on',
	        onHoverStop: 'on',
	        navOffsetHorizontal: 0,
	        navOffsetVertical: 0,
	        dottedOverlay: 'none',
	        fullWidth: 'on'
		});
	}
	
	
	//Top search bar open/close
    if (!$('.srchbox').hasClass("searchStayOpen")) {
        $("#jbsearch").click(function() {
            $(".srchbox").addClass("openSearch");
            $(".additional_fields").slideDown();
        });


        $(".srchbox").click(function(e) {
            e.stopPropagation();
        });
    }
	
})(jQuery);

const toggleButtons = document.querySelectorAll("li.nav-item");
const menu = document.querySelector("#menu-icon");
const navbar = document.querySelector("#nav-main");

menu.onclick = () => {
  menu.classList.toggle("active");
  navbar.classList.toggle("right-open");
};

(() => {
  toggleButtons.forEach((toggleButton) => {
    toggleButton.addEventListener("click", () => {
      toggleButton.firstElementChild.lastElementChild.classList.toggle("up");
      toggleButton.lastElementChild.classList.toggle("open");
    });
  });
})();