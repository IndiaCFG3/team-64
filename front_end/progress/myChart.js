function renderChart(data, labels,str) {
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: str,
                data: data,
                backgroundColor: '#ADD8E6'
            }]
        },
    });
}
$("#render_weekly").click(
    function () {

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            data=(this.responseText).split(",");
            labels = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"];
            renderChart(data, labels,'Weekly');
          }
        };
        xhttp.open("GET", "week.txt", true);
        xhttp.send();
    }
);
$("#render_monthly").click(
    function () {

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            data=(this.responseText).split(",");
            labels = [1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19,
              20,
              21,
              22,
              23,
              24,
              25,
              26,
              27,
              28,
              29,
              30]
            renderChart(data, labels,"Monthly");
          }
        };
        xhttp.open("GET", "month.txt", true);
        xhttp.send();
    }
);