
// 메인 비쥬얼 슬라이더
var swiper = new Swiper(".main_slider", {
    autoplay: {
        delay: 5000,
        disableOnInteraction: false,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    pagination: {
        el: ".swiper-pagination",
        type: "fraction",
    },
});


// 인기 항공권 슬라이더
var swiper = new Swiper(".popular_slider", {
    autoplay: {
        delay: 5000,
        disableOnInteraction: false,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    pagination: {
        el: ".swiper-pagination",
        type: "fraction",
    },
    slidesPerView: 4,
        spaceBetween: 30,
});
