const initView = () => {
    
    const expandBtn = document.querySelector('.side-btn')
    
    if (expandBtn){
        const sideBar = document.querySelector('.side')
        expandBtn.addEventListener('click', () => {
            sideBar.classList.toggle('active')
            console.log('hey there')
        })
    }

}

export default initView