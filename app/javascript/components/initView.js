const initView = () => {
    console.log("here am i")
    const expandBtn = document.querySelector('.side-btn')
    const sideBar = document.querySelector('.side')
    expandBtn.addEventListener('click', () => {
        sideBar.classList.toggle('active')
        console.log('hey there')
    })

}

export default initView