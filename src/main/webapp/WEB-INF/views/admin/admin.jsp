<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
    <title>미래항공 관리자페이지</title>
</head>
<body>
<!-- header S -->  
<header class="header">
    <h1 class="logo"><a href="${pageContext.request.contextPath}/admin"><img src="${pageContext.request.contextPath}/resources/images/common/logo.png" alt="FUTURE AIR"></a></h1>
    <nav class="gnb">
        <ul>
            <span class="gnb_txt">GENERAL</span>
            <li class="active">
                <a href="${pageContext.request.contextPath}/admin">홈
                    <span class="icon"><i class="fas fa-home"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">FLIGHT</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/flight/flightList">비행일정
                    <span class="icon"><i class="fas fa-plane"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/flight/reservationList">예약현황
                    <span class="icon"><i class="fas fa-clipboard-list"></i></span>
                </a>
            </li>
            
            <span class="gnb_txt">CUSTOMER</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/customerList">회원정보
                    <span class="icon"><i class="fas fa-user"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/customerGrade">회원등급
                    <span class="icon"><i class="fas fa-arrow-circle-up"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/sendMail">메일발송
                    <span class="icon"><i class="fas fa-envelope"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">BOARD</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/board/postList">게시물관리
                    <span class="icon"><i class="fas fa-pen-alt"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/board/boardList">게시판설정
                    <span class="icon"><i class="fas fa-cog"></i></span>
                </a>
            </li>
        </ul>
    </nav>
</header>
<!-- header E -->  
<!-- util S -->  
<div class="util contents">
    <div class="row">
        <div class="search_box">
            <form action="#" class="search item">
                <span class="search_icon"><i class="fas fa-search"></i></span>
                <input type="search_text" name="search" placeholder="Search for...">
            </form>
        </div>
        
        <div class="info">
            <a class="bell" href="${pageContext.request.contextPath}/" target="_blank"></a>
            <div class="profile">
                <div class="profile_img">
                    <img src="${pageContext.request.contextPath}/resources/images/profile.jpg" alt="profile">
                </div>
                <p>홍길동<span>마스터관리자</span></p>
                <div class="btn_m"><span></span></div>
            </div>
        </div>
    </div>
</div>
<!-- util E -->  
<!-- content S -->   
<div class="contents contents_box">
    <div class="row">
        <section class="today_info">
            <div class="inner flex_space_between">
                <div class="today_info_txt">
                    <h2>오늘의 총 매출액</h2>
                    <p class="income">${todayInfo.TODAY_INCOME / 10000} 만</p>
                </div>
                <span class="today_info_icon">
                    <i class="fas fa-coins"></i>
                </span>
            </div>
        </section>
        <section class="today_info">
            <div class="inner flex_space_between">
                <div class="today_info_txt">
                    <h2>오늘의 총 예약수</h2>
                    <p class="income">${todayInfo.TODAY_RESERVATION }</p>
                </div>
                <span class="today_info_icon">
                    <i class="fas fa-wallet"></i>
                </span>
            </div>
        </section>
    
        <section class="today_info">
            <div class="inner flex_space_between">
                <div class="today_info_txt">
                    <h2>오늘의 비행일정</h2>
                    <p class="income">${todayInfo.TODAY_FLIGHT }</p>
                </div>
                <span class="today_info_icon">
                    <i class="fas fa-tags"></i>
                </span>
            </div>
        </section>
    
        <section class="today_info">
            <div class="inner flex_space_between">
                <div class="today_info_txt">
                    <h2>오늘의 총 방문자</h2>
                    <p class="income">30,942</p>
                </div>
                <span class="today_info_icon">
                    <i class="fas fa-exchange-alt"></i>
                </span>
            </div>
        </section>
    </div>
    
    <div class="row">
        <section class="popular_flight">
                <div class="inner">
                <h2>인기 비행노선</h2>
                <ul>
                   	<c:forEach var="flight" items="${popularFlight}">
		        		<li>
			                <a href="#">
			                    <div class="popular_flight_img">
			                        <img src="${pageContext.request.contextPath}/resources/images/img_admin_popular_flight.png" alt="인천공항로고">
			                    </div>
			                    <div class="popular_flight_info">
			                        <p >${flight.DEPARTURE_NAME} - ${flight.ARRIVAL_NAME}</p>
			                        <div class="flex_space_between">
			                            <span>${flight.AIRPLANE_TYPE}</span><span>${flight.PRICE / 10000}만~</span>
			                        </div>
			                    </div>
			                </a>
			            </li>
		        	</c:forEach>
                </ul>
            </div>
        </section>
        <section class="graph_income width50">
            <div class="inner">
                <h2>기간 매출 그래프</h2>
                <div class="chartWrap">
                    <canvas id="incomeChart"></canvas>
                </div>
            </div>
        </section>
        <section class="graph_reservation">
            <div class="inner">
                <h2>예약 분석</h2>
                <div class="chartWrap">
                    <canvas id="reservationChart"></canvas>
                </div>
            </div>
        </section>
    </div>
    <div class="row">
        <section class="state_flight">
            <div class="inner">
                <h2>항공편 상황</h2>
                <div class="chartWrap">
                    <canvas id="flightChart"></canvas>
                </div>
            </div>
        </section>
        <section class="rate_reservation">
                <div class="inner">
                <h2>대륙별 점유율</h2>
                <ul>
                    <c:forEach var="continents" items="${rateContinents}">
			        	<li>
			                <div class="flex_space_between">
			                    <p>${continents.CONTINENTS}</p>
			                    <span>${continents.RATE}%</span>
			                </div>
			                <div class="progress">
			                    <div class="progress_bar" role="progressbar" aria-valuenow="${continents.RATE}" aria-valuemin="0" aria-valuemax="100" style="width:${continents.RATE}%"></div>
			                </div>
			            </li>
        			</c:forEach>
                </ul>
            </div>
        </section>
        <section class="recent_reservation width50">
            <div class="inner">
                <h2>최근 예약현황</h2>
                <table class="table">
                    <tr>
                        <th>예약번호</th>
                        <th>예약자</th>
                        <th>출발일</th>
                        <th>가격</th>
                    </tr>
                    <c:forEach var="recent" items="${recentReservation}">
			            <tr>
			                <td><a href="javascript:popupOpen('${pageContext.request.contextPath}/admin/customer/customerReservationDetail?id=${recent.CUSTOMER_ID}&reservation_num=${recent.RESERVATION_NUM}', 1000, 600)">${recent.RESERVATION_NUM}</a></td>
			                <td>${recent.CUSTOMER_NAME}</td>
			                <td>${recent.DEPARTURE_DATE}</td>
			                <td class="payment"><fmt:formatNumber value="${recent.PAYMENT}" pattern="#,###"/>원</td>
			            </tr>
	            	</c:forEach>
                </table>
            </div>
        </section>
    </div>
</div>
<!-- content E --> 
<!-- footer S -->
<%@include file ="include/footer.jsp" %>
<!-- footer E --> 

<script>

/* 기간 매출 그래프 */
$.ajax({
	url : 'graphIncome',
		type : 'get',
		success : function(data) {
			console.log(data)
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
			                        // if(values[0].toString().length >= 8 && value != 0) return (Math.floor(value / 10000000)).toLocaleString("ko-KR") + "천";
			                        //else if(values[0].toString().length = 8 && value != 0) return (value / 10000000).toFixed(1) + "천";
			                        if(values[0].toString().length > 6 && value != 0) return (Math.floor(value / 1000000)).toLocaleString("ko-KR") + "백";
			                        else if(values[0].toString().length = 6 && value != 0) return (value / 1000000).toFixed(1) + "백";
			                        else return value.toLocaleString("ko-KR");
			                        }
			                    }
			                }
			            ]
			        }
			    }
			});
		}
})


/* 예약분석 그래프 */
$.ajax({
	url : 'graphReservation',
		type : 'get',
		success : function(data) {
			console.log(data)
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
			                        /* beginAtZero: true, */
			                        padding: 30,
			                        stepSize: 1,
			                        /* min: 0 */
			                    }
			                } 
			            ]
			        }
			    },
			});
		}
});

/* 항공편 상황 그래프 */
$.ajax({
	url : 'graphFlightState',
		type : 'get',
		success : function(data) {
			console.log(data)
			let labelList = Object.keys(data);
			let countList = Object.values(data);
			new Chart(document.getElementById('flightChart'), {
			    type: 'doughnut', 
			    data: { 
			        labels: labelList,
			        datasets: [
			            { //데이터
			                label: '기간 매출 그래프', 
			                fill: false, 
			                data: countList,
			                backgroundColor: [
			                    //색상
			                    'rgba(0, 99, 212, .8)',
			                    'rgba(101, 177, 45, .8)',
			                    'rgba(125, 53, 168, .8)'
			                ],
			                borderColor: [
			                    'rgba(0, 99, 212, 1)',
			                    'rgba(101, 177, 45, 1)',
			                    'rgba(125, 53, 168, 1)'
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
		}
});

</script>
