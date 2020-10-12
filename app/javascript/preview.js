if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {

document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  // const ImageList = document.getElementsByClassName('img-upload')[0];

  document.getElementById('item-image').addEventListener('change', function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    const imageElement = document.createElement('div');
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
    console.log("file")

  });

});
}
