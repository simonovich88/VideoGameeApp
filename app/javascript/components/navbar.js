const navbarTransparent = () => {
  let target = document.querySelector(".navbar")


  window.addEventListener('scroll', event => {
    let height = (window.scrollY/window.innerHeight)*100;
    if (height > 10 ){
      // target.style.backgroundColor = 'rgba(26, 29, 41, 0.7)';
      target.classList.add("scrolled");
      target.firstElementChild.innerText = "VG"
      target.style.textShadow = "1px 0px 10px lightgrey"
    } else {
      // target.style.backgroundColor = 'rgba(26, 29, 41, 1)';
      target.firstElementChild.innerText = "VideoGames"
      target.classList.remove("scrolled");
      target.style.textShadow = ""
    }
  })
}

export { navbarTransparent }
