const initLearn = () => {
    console.log('here i am')

    const btnYes = document.querySelectorAll('.btn-yes')
    if (document.querySelector('.btn-yes')) {
        console.log('valide')

    const btnNo = document.querySelectorAll('.btn-no')
    const btnShow = document.querySelectorAll('.btn-show')
    const dosages = document.querySelectorAll('.dosages')
    const progress = document.querySelector('.progress-bar')
    const questionContainer = document.querySelectorAll('.column-1')
    const answerContainer = document.querySelectorAll('.column-2')


    let right = 0
    let wrong = 0
    let i = 0

    const next = () => {
        console.log(i)
        show(i)
        if (i<6) {
            i++
            show(i)
        }
    }

    const show = (i) => {
        questionContainer[i].classList.toggle('hidden')
        answerContainer[i].classList.toggle('hidden')
    }

    const reveal = (i) => {
        btnNo[i].classList.toggle('hidden')
        btnYes[i].classList.toggle('hidden')
        btnShow[i].classList.toggle('hidden')
        questionContainer[i].querySelectorAll('.ig-list').forEach((dose) => dose.classList.toggle('hidden'))
    }

    const progressUpdate = () => progress.style.width = `${((right / 7) * 100).toFixed(1)}%`


    show(i)


    btnShow.forEach(btn => btn.addEventListener('click', () => reveal(i)))
    btnYes.forEach((btn) => { btn.addEventListener('click', () => {
        next(i);
        right++;
        progressUpdate();
    })})

    btnNo.forEach((btn) => { btn.addEventListener('click', () => {
        next(i);
        wrong++;
    })})

}
}

export default initLearn