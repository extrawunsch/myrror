import "jquery-bar-rating";

const initStarRating = () => {
  $('#answer_answer_content').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };