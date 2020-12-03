const initNextSlide = () => {
  // const carousel = document.querySelector(".carousel");
  const buttons = document.querySelectorAll("#simple-form");
  if (buttons) {
    buttons.forEach (b => {
      b.addEventListener("click", () => {
      $('.carousel').carousel('next')
    });
  });
 };
};

export { initNextSlide };