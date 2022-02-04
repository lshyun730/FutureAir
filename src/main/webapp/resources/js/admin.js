
// 로그인 폼 체크
function loginFormCheck() {
    const admin_id = document.querySelector('#admin_id');
    const admin_pw = document.querySelector('#admin_pw');
    const error_msg = document.querySelector('.error_msg');
                
    if (admin_id.value < 1) {
        error_msg.innerHTML = '아이디를 입력해 주세요';
        return false;
    }

    if (admin_pw.value < 1) {
        error_msg.innerHTML = '비밀번호를 입력해 주세요';
        return false;
    }
}


const incomeChart = document.getElementById('incomeChart').getContext('2d');
const reservationChart = document.getElementById('reservationChart').getContext('2d');
const flightChart = document.getElementById('flightChart').getContext('2d');

new Chart(incomeChart, {
    type: 'line', 
    data: { 
        labels: [
            '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
        ],
        datasets: [
            { //데이터
                label: '기간 매출 그래프', 
                fill: false, 
                data: [
                    10000000, 10000000, 20000000, 30000000, 20000000, 40000000, 50000000, 50000000, 70000000, 60000000, 80000000, 90000000
                ],
                backgroundColor: [
                    //색상
                    'rgba(216, 0, 39, .3)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(216, 0, 39, 1)'
                ],
                borderWidth: 2 //경계선 굵기
            }
        ]
    },
    options: {
        // responsive: false,
        maintainAspectRatio: false,
        layout : {
            padding : {
                top: 20
            }
        },
        legend : {
            display: false
        },
        scales: {
            xAxes: [
                {
                    gridLines: {
                        drawBorder: false,
                        display:false,
                    }
                }
            ],
            yAxes: [
                {
                    gridLines: {
                        drawBorder: false,
                        lineWidth: 1,
                        zeroLineColor: 'rgba(0,0,0,0)'                        
                    },
                    ticks: {
                        padding : 30,
                        beginAtZero: true,
                        callback: function(value, index, values) {
                        // if(values[0].toString().length > 9 && value != 0) return (Math.floor(value / 100000000)).toLocaleString("ko-KR") + "억";
                        // else if(values[0].toString().length = 9 && value != 0) return (value / 100000000).toFixed(1) + "억";
                        if(values[0].toString().length >= 8 && value != 0) return (Math.floor(value / 10000000)).toLocaleString("ko-KR") + "천";
                        // else if(values[0].toString().length = 8 && value != 0) return (value / 10000000).toFixed(1) + "천";
                        else if(values[0].toString().length > 6 && value != 0) return (Math.floor(value / 1000000)).toLocaleString("ko-KR") + "백";
                        // else if(values[0].toString().length = 6 && value != 0) return (value / 1000000).toFixed(1) + "백";
                        else return value.toLocaleString("ko-KR");
                        }
                    }
                }
            ]
        }
    }
});

new Chart(reservationChart, {
    type: 'line', 
    data: { 
        labels: [
            '2.21', '2.22', '2.23', '2.24', '2.25'
        ],
        datasets: [
            { //데이터
                label: '기간 매출 그래프', 
                fill: false, 
                data: [
                    150, 50, 200, 100, 250
                ],
                backgroundColor: [
                    //색상
                    'rgba(101, 177, 45, .3)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(101, 177, 45, 1)'
                ],
                borderWidth: 2 //경계선 굵기
            }
        ]
    },
    options: {
        // responsive: false,
        maintainAspectRatio: false,
        layout : {
            padding : {
                top: 20
            }
        },
        legend : {
            display: false
        },
        scales: {
            xAxes: [
                {
                    gridLines: {
                        drawBorder: false,
                        display:false,
                    }
                }
            ],
            yAxes: [
                {
                    gridLines: {
                        drawBorder: false,
                        lineWidth: 1,
                        zeroLineColor: 'rgba(0,0,0,0)'                        
                    },
                    ticks: {
                        beginAtZero: true,
                        padding: 30,
                    }
                } 
            ]
        }
    },
});

new Chart(flightChart, {
    type: 'doughnut', 
    data: { 
        labels: [
            '취소', '대기', '비행', '도착'
        ],
        datasets: [
            { //데이터
                label: '기간 매출 그래프', 
                fill: false, 
                data: [
                    150, 50, 200, 100
                ],
                backgroundColor: [
                    //색상
                    'rgba(216, 0, 39, .8)',
                    'rgba(125, 53, 168, .8)',
                    'rgba(0, 99, 212, .8)',
                    'rgba(101, 177, 45, .8)'
                ],
                borderColor: [
                    'rgba(216, 0, 39, 1)',
                    'rgba(125, 53, 168, 1)',
                    'rgba(0, 99, 212, 1)',
                    'rgba(101, 177, 45, 1)'
                ]
            }
        ]
    },
    options: {
        maintainAspectRatio: false,
        legend : {
            display: true,
            labels: {
                boxWidth : 10,
                fontSize: 10,
                padding: 10,
            },
            position: 'bottom',
        },
        layout : {
            padding : {
                top: 0,
                left : 15,
                right : 15,
            }
        },
    },
});

