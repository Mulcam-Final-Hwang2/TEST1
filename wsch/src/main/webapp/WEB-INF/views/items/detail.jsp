<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="/wsch/resources/css/detailPage.css">
<link rel="styleSheet" href="/wsch/resources/css/listanddetail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<style>
/* 추천부분 스타일 */
@import url('http://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
*{
	 margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.content2 {
    display: flex;
    align-items: center;
    justify-content: center;
}

.slide-container {
    max-width: 1120px;
    width: 100%;
    padding: 40px 0;
}

.slide-content {
    margin: 0 40px;
    overflow: hidden;
    border-radius: 25px;
}

.card {
    width: 320px;
    border-radius: 25px;
    background-color: #eee;
}

.image-content,
.card-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 10px 14px;
}

.image-content {
    position: relative;
    row-gap: 5px;
    padding: 25px 0;
}

.overlay {
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 100%;
    background-color: #4070f4;
    border-radius: 25px 25px 0 25px;
}

.overlay::before,
.overlay::after {
    content: '';
    position: absolute;
    right:0;
    bottom: -40px;
    height: 40px;
    width: 40px;
    background-color: #eee;
}

.overlay::after {
    border-radius: 0 25px 0 0;
    background-color: #eee;
}

.card-image {
    position: relative;
    height: 150px;
    width: 150px;
    border-radius: 50%;
    background: #fff;
    padding: 3px;
}
.card-image .card-img {
    height: 100%;
    width: 100%;
    object-fit: cover;
    border-radius: 50%;
    border: 4px solid #4070f4;
}

.name {
    font-size: 18px;
    font-weight: 500;
    color: #333;
}

.description {
    font-size: 14px;
    color: #707070;
    text-align: center;
}

.button {
    border: none;
    font-size: 16px;
    color: #fff;
    padding: 8px 16px;
    background-color: #4070f4;
    border-radius: 6px;
    margin: 14px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.button:hover {
    background: #265df2;
}

.swiper-navBtn {
    color: #6e93f7;
    transition: color 0.3s ease;
}

.swiper-navBtn:hover {
    color: #4070f4;
}

.swiper-navBtn::before,
.swiper-navBtn::after {
    font-size: 40px;
}

.swiper-button-next {
    right: 0;
}

.swiper-button-prev {
    left: 0;
}

.swiper-pagination.bullet {
    background-color: #6393f7;
    opacity: 1;
}

.swiper-pagination.bullet-active {
    background-color: #4070f4;
}
</style>
</head>
<body>
    <div class="detail-container">
        
        <div class="all">
            <h1>전체 보기</h1>
        </div>
        <div class="detail-select">
            <button class="nav-button" onclick="filter('전체')">전체</button>
            <button class="nav-button" onclick="filter('탁주')">탁주</button>
            <button class="nav-button" onclick="filter('약주, 청주')">약주, 청주</button>
            <button class="nav-button" onclick="filter('과실주')">과실주</button>
            <button class="nav-button" onclick="filter('증류주')">증류주</button>
            <button class="nav-button" onclick="filter('리큐르/기타주류')">리큐르/기타주류</button>
        </div>

        <div class="name">
            <hr width="100%" size="1">
            <h1 id="drink-title">${products[param.proNo].name }</h1>
            <hr width="100%" size="1">
        </div>
		<div class="row">
	        <div class="information">
	            <img id="drink-image" src="${products[param.proNo].imgurl }" alt="술 이미지">
	            
	        </div>
			<div class="detail-info">
	                <h2>상세 정보</h2>
	                <ul>
	                    <li>종류 | 약주, 청주</li>
	                    <li>원재료 | 쌀(화성시), 누룩(국내산), 정제수</li>
	                    <li>알콜도수 | 15%</li>
	                    <li>용량 | 375ml</li>
	                    <li>수상내역 | </li>
	                    <li>기타 | </li>
	                </ul>
	                
	            <div class="description">
	            	<hr width="100%" size="1">
	            	<h2>제품 소개</h2>
	            	<p>${products[param.proNo].description }</p>
	        	</div>
	        	<hr width="100%" size="1">
	
	        	<div class="matching-food">
	           		<h2>어울리는 음식</h2>
	            	<p>문어숙회, 조개구이</p>
	        	</div>
	        	<hr width="100%" size="1">
	
		        <div class="market">
		            <h2>상세 정보</h2>
		            <ul>
		                <li>양조장명 | 술로우</li>
		                <li>주소 | 경기도 화성시 마도면 마도로 609번길 16-11동 술로우</li>
		                <li>홈페이지 | <a href="//smartstore.naver.com/sulow_brewery" target="_blank">//smartstore.naver.com/sulow_brewery</a></li>
		                <li>문의 | 010-8712-8215</li>
		            </ul>
		        </div>
	        </div>
	 	</div>
	 	<hr/>
	 	
	 	<div id="searchTrendView">
	 		<h2>서치트랜드</h2>
	 		<h3>${products[param.proNo].name }와 연관된 추천 상품 더보기</h3>
	 		<section class="content2">
 	<div class="slide-container swiper">
 		<div class="slide-content">
 			<div class="card-wrapper swiper-wrapper">
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_16/u_image/6/822266612_EC9DBCED9288EC9588EB8F99EC868CECA3BC-40.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">일품안동소주350-40% </h2>
 						<p class="description">안동의 맑고 깨끗한 물과 옥토에서 수확된 양질의 쌀을 원료로 빚은 순곡증류주입니다.깔끔한 뒷맛으로 젊은층..</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_16/u_image/11/2029680230_EBAFBCEC868DECA3BCEC9588EB8F99EC868CECA3BC-EC9588EB8F99EC868CECA3BC600.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">안동소주 </h2>
 						<p class="description">민속주 안동소주는 경북무형문화재 제12호 대한민국 식품명인 제20호인 조옥화 여사가 전래된 비법으로 빚어..</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_16/u_image/9/770156006_EC88A0EC8398-EBAFB8EBA5B454.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">미르54 </h2>
 						<p class="description">최고의 재료로 빚어 타 증류주가 따라올 수 없는 향기를 가지고 장기 숙성시켜 부드러운 맛이 일품인 프리미..</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_21/u_image/10/1463026566_ED959CEC82B0EC868CEAB3A1ECA3BC-EBB688EC868CEAB3A1ECA3BC.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">불소곡주 </h2>
 						<p class="description">불소곡주는 한산소곡주를 증류하여 만든 알코올 43%의 리큐르입니다. 2014년 해외 주류품평회 몽드셀렉..</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_21/u_image/6/202076025_EB8C80EB868DEBB094EC9DB4EC98A4EC9881EB868DECA1B0ED95A9EBB295EC9DB8-EC82B0EC9691EC82B0EC82BCED98B8EB8BB4.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">산양산삼 호담 </h2>
 						<p class="description">국내산 5년근 산양산삼 한뿌리 통째로 담아 제조한 술입니다.</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_22/u_image/8/1518007706_EBA9B4ECB29CEB9190EAB2ACECA3BC.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">면천두견주 </h2>
 						<p class="description">진달래 꽃잎과 찹쌀로 담그는 향기나는 민속주 두견주는 예로부터 '백약지장(百藥之長)'이라 일컬어오고 ..</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_22/u_image/4/2101240720_ECA09CECA3BCEC8398-EC98A4EBA994EAB8B0EC88A0.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">오메기 375ml </h2>
 						<p class="description">오메기술' 이란 오메기떡(차조로 만든 제주 전통떡)을 사용하여 누룩(당화제)과 함께 발효시켜..</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_23/u_image/10/624179740_EC8B9CED8AB8EB9FACEC8AA4-ED98BCEB9494ECA3BC.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">혼디주 </h2>
 						<p class="description">'혼디'는 제주어로 '함께','같이'라는 의미로 청정 제주에서 정성스레 키운 향긋한 감귤이 함께 어우러..</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_23/u_image/1/1929184596_ED998DECA780EC9B90-ED8F89ECB0BDEBA8B8EBA3A8ECA3BC400.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">평창머루주400ml </h2>
 						<p class="description">해발 700m의 청정지역 평창지역에서 채취한 산머루로 빚은 평창 머루주는 삼국시대로부터 전해오는 전..</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 				<div class="card swiper-slide">
 					<div class="image-content">
 						<span class="overlay"></span>
 						
 						<div class="card-image">
 							<img src="http://koreansool.com/bizdemo51809/component/board/board_24/u_image/4/788492721_EC8694EB9E98EC9B90-EC84A4EAB68118.jpg" class="card-img">
 						</div>
 					</div>
 					
 					<div class="card-content">
 						<h2 class="name">설궁 </h2>
 						<p class="description">강원도의 자연산송이버섯, 자연산 토종벌꿀, 산양산삼 등 희귀한 천연 원재료를 침출 숙성시킨 후 프랑..</p>
 					
 						<button class="button">View More</button>
 					</div>
 				</div>
 			</div>
 		</div>	
 		<div class="swiper-button-next swiper-navBtn"></div>
 		<div class="swiper-button-prev swiper-navBtn"></div>
 		<div class="swiper-pagination "></div>
 	</div>
 </section> 
 
 
	 		
	 	</div>
    </div>
<script src="
https://cdn.jsdelivr.net/npm/swiper@11.0.4/swiper-bundle.min.js
">
</script>
<script>
var swiper = new Swiper(".slide-content", {
    slidesPerView: 3,
    spaceBetween: 25,
    loop: true,
    centeredSlides: true, // 'true' 대신에 'centeredSlides'로 수정
    fade: true,
    grabCursor: true,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
        dynamicBullets: true,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    breakpoints: {
        0: {
            slidesPerView: 1,
        },
        520: {
            slidesPerView: 2,
        },
        950: {
            slidesPerView: 3,
        },
    },
});
</script>
</body>