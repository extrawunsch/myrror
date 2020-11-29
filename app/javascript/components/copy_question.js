var firstDivContent = document.getElementById('mydiv1');
const initCopyQuestion = () => {
    const copyhere = document.getElementById('copyhere');
    const pastehere = document.getElementById('question_question_content');
    const button = document.querySelector('button')

    button.addEventListener('click', () => {
        pastehere.innerHTML = copyhere.innerHTML;
      });
  }
  
  export { initCopyQuestion };