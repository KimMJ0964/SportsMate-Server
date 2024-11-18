/**
 * 
 */

const daysContainer = document.getElementById('days');
const currentDateElement = document.getElementById('current-date');
const prevButton = document.getElementById('prev-button');
const nextButton = document.getElementById('next-button');

let currentDate = new Date();

function renderCalendar() {
    const year = currentDate.getFullYear();
    const month = currentDate.getMonth();
    currentDateElement.innerText = currentDate.toLocaleString('default', { month: 'long', year: 'numeric' });

    daysContainer.innerHTML = '';

    const firstDayOfMonth = new Date(year, month, 1).getDay();
    const lastDateOfMonth = new Date(year, month + 1, 0).getDate();

    for (let i = 0; i < firstDayOfMonth; i++) {
        const li = document.createElement('li');
        li.classList.add('inactive');
        daysContainer.appendChild(li);
    }

    for (let date = 1; date <= lastDateOfMonth; date++) {
        const li = document.createElement('li'); 
        li.innerText = date;
        daysContainer.appendChild(li);
    }
}

prevButton.addEventListener('click', () => {
    currentDate.setMonth(currentDate.getMonth() - 1);
    renderCalendar();
});

nextButton.addEventListener('click', () => {
    currentDate.setMonth(currentDate.getMonth() + 1);
    renderCalendar();
});

renderCalendar();