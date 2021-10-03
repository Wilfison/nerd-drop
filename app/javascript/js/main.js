
function addImageErrorCallback(){
  const imgTags = document.querySelectorAll('.cover')
  
  imgTags.forEach(img => {
    img.addEventListener('error', ({target}) => {
      target.setAttribute('src', '/blank.png');
    });

    img.setAttribute('src', img.getAttribute('data-src'));
  });
}

window.addEventListener('load', function(){
  addImageErrorCallback();
});
