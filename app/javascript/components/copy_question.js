const initCopyQuestion = () => {
  // element to copy
  const copyhere = document.querySelectorAll('#copyhere');
  // element where to paste
  const pastehere = document.getElementById('question_question_content');
  const pastehereedit = document.getElementById('question_content');
  // Get an array of buttons from the page
  const buttons = document.querySelectorAll("button");
  // Loop through the resulting array
  for(let i = 0; i < buttons.length; i++){
    buttons[i].addEventListener("click", function() {
      // with i you can find the right element to copy
      const elementtocopy = copyhere[i];
      // paste it into other element
      pastehere.innerHTML = elementtocopy.innerHTML;
      pastehereedit.innerHTML = elementtocopy.innerHTML;
    });
  }

}
  
export { initCopyQuestion };