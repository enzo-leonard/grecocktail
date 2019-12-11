const initView = () => {
    
    const expandBtn = document.querySelectorAll('.side-icon')
    
    if (document.querySelector('.side-icon')){
        const sideBar = document.querySelector('.side')
        expandBtn.forEach(btn => btn.addEventListener('click', () => sideBar.classList.toggle('active')))
      
    }

}

export default initView