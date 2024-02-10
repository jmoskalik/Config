function currentTimeDate() {
    let currDate = new Date(); 
    let cDate = currDate.getDate();
    var dayName = getDayName(currDate.getDay());
    var monthName = getMonthName(currDate.getMonth());

    let hh = currDate.getHours();
    let mm = currDate.getMinutes();
  
     hh = (hh < 10) ? "0" + hh : hh;
     mm = (mm < 10) ? "0" + mm : mm;
      
      let time = hh + ":" + mm
      let date = dayName + ',  ' + cDate + ' ' + monthName;
      
    document.getElementById("clock").innerText = time; 
    document.getElementById("date").innerText = date; 

    let t = setTimeout(function(){ currentTimeDate() }, 1000); 
  
}

function getMonthName(month) {
    var ar = new Array("Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień");
    return ar[month];
}

function getDayName(day) {
    var ar1 = new Array("Niedziela", "Poniedziałek", "Wtorek", "Środa", "Czwartek", "Piątek", "Sobota");
    return ar1[day];
}


  
currentTimeDate();