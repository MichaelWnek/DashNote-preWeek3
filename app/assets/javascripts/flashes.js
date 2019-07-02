function clearFlashes (){
  setTimeout(function (){
    $('.flash').slideUp(function(){
      $('.flash').remove();
    });
  }, 3000);
}

$('document').ready(function(){
  clearFlashes();
});
