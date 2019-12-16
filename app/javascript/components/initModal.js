const initModal = () => {

    const cards =  document.querySelectorAll('.cocktail-card')
    const frigoBtn =  document.querySelector('.frigo-btn')
    console.log(cards.length)

    cards.forEach((card) => {
        let id = card.id.split('_')[1]
        card.addEventListener('click', () => {
            modalAppear(id)
        })
    })

    frigoBtn.addEventListener('click', () => modalAppear('frigo'))

    const modalAppear = (id) => {
        id = "#modal_"+id
        let modal = document.querySelector(id)
        const dismiss = modal.querySelector('.close.w-button') 
        console.log(dismiss)
        modal.classList.toggle('appear')
        dismiss.addEventListener('click', () => modal.classList.toggle('appear') )
    }

}



export default initModal