const initSubmit = () => {
  // Find the button that i want to toggle
  const button = document.getElementById("toggle");
  const circle = document.querySelector('.circle-loader');
  const checkmark = document.querySelector('.checkmark');
  // Safety
  if (button) {
      console.log("Test")
      button.addEventListener("click", () => {
        circle.classList.toggle('load-complete');
        $('.checkmark').toggle();
    });
  };
};

export { initSubmit };

// $('#toggle').click(function() {
//   $('.circle-loader').toggleClass('load-complete');
//   $('.checkmark').toggle();
// });