window.addEventListener("scroll", function () {
    var header = document.getElementsByTagName('header')[0];
    header.classList.toggle('sticky', this.window.scrollY > 0);
})
setInterval(() => {
    const time = new Date();

    let day = time.getDate();
    let hours = time.getHours();
    let minutes = time.getMinutes();
    let seconds = time.getSeconds();
    if (day < 10) {
        day = "0" + day;
    }
    if (hours < 10) {
        hours = "0" + hours;
    }
    if (minutes < 10) {
        minutes = "0" + minutes;
    }
    if (seconds < 10) {
        seconds = "0" + seconds;
    }
    document.getElementsByClassName("time-item-child-number")[0].innerHTML = day;
    document.getElementsByClassName("time-item-child-number")[1].innerHTML = hours;
    document.getElementsByClassName("time-item-child-number")[2].innerHTML = minutes;
    document.getElementsByClassName("time-item-child-number")[3].innerHTML = seconds;
})
  
