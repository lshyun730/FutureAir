
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


/* graphIncome */

$.ajax({
	url : 'graphIncome',
		type : 'get',
		success : function(data) {
			let monthList = [];
			let paymentList = []
			for(let i = 0; i < data.length; i++) {
				let str = data[i].RESERVATION_DATE;
				if(str.charAt(str.length-2) == '0') {
					monthList.push(str.slice(-1) + "월");
				}else {
					monthList.push(str.slice(-2) + "월");					
				}
				paymentList.push(data[i].PAYMENT);
			}
			new Chart(document.getElementById('incomeChart'), {
			    type: 'line', 
			    data: { 
			        labels: monthList,
			        datasets: [{ 
			            data: paymentList,
			            label: '기간 매출 그래프', 
			            backgroundColor: 'rgba(216, 0, 39, .3)',
			            fill: false, 
			            borderColor: 'rgba(216, 0, 39, 1)',
			            borderWidth: 2
			        }]
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
		},
		error: function(){
			alert("실패");
		}
})



$.ajax({
	url : 'graphReservation',
		type : 'get',
		success : function(data) {
			let dayList = [];
			let countList = []
			for(let i = 0; i < data.length; i++) {
				let str = data[i].RESERVATION_DATE;
				if(str.charAt(str.length-5) == '0') {
					dayList.push(str.slice(-4));
				}else {
					dayList.push(str);					
				}
				countList.push(data[i].COUNT);
			}
			new Chart(document.getElementById('reservationChart'), {
			    type: 'line', 
			    data: { 
			        labels: dayList,
			        datasets: [
			            { //데이터
			                label: '기간 매출 그래프', 
			                fill: false, 
			                data: countList,
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
		}
});

const incomeChart = document.getElementById('incomeChart').getContext('2d');
const reservationChart = document.getElementById('reservationChart').getContext('2d');
const flightChart = document.getElementById('flightChart').getContext('2d');





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

