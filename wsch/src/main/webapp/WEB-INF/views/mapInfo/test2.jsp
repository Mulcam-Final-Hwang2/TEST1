<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
	<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qogjasc38p&submodules=geocoder"></script>
    <style>
	    #map-container {
	        display: flex;
	        height: 90vh;
	    }	
	    .navi-bar {
	        width: 250px;
	        background-color: #f2f2f2;
	        display: flex;
	        flex-direction: column;
	        align-items: flex-start;
	        padding-top: 20px;
	        border-right: 1px solid #dddddd;
	    }	
	    .navi-bar button {
	        text-align: center;
	        margin-bottom: 10px;
	        text-decoration: none;
	        color: black;
	        font-weight: bold;
	        cursor: pointer;
	        background-color: #ffffff;
	        border: 1px solid #dddddd;
	        padding: 10px;
	        border-radius: 5px;
	        width: 100%; /* 버튼을 100% 너비로 설정 */
	        position: static; /* 변경된 부분 */
	    }
        #map {
            flex: 1;
            height: 100%;
        }
        #traditional-bars-list {
            display: none;
            position: relative; /* 추가된 부분 */
        }
            .favorite-star {
	        cursor: pointer;
	        font-size: 20px;
	        color: #cccccc; /* 빈 별 색깔 */
	        position: static; /* 변경된 부분 */
	        right: 0; /* 변경된 부분 */
	        top: 50%; /* 변경된 부분 */
	        transform: translateY(-50%); /* 변경된 부분 */
	    }
	
	    .favorite-star.filled {
	        color: gold; /* 채워진 별 색깔 */
	    }
        .list-item-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        position: relative; /* 추가된 부분 */
    }
    </style>
</head>
<body >
	<div id="map-container">
	    <div class="navi-bar" id="navi-bar-1">
	        <button onclick="showTraditionalBar()">전통주점찾기</button>
	        <button onclick="showDirections()">길찾기</button>
	        <button onclick="showFavorites()">즐겨찾기</button>
	    </div>
	    <div class="navi-bar" id="navi-bar-2">
	        <div id="traditional-bars-list"></div>
	        <div id="directions-list" style="display: none;"></div>
	        <div id="favorites-list" style="display: none;"></div>
	    </div>
	    <div id="map"></div>
	</div>
    <script>
	    var map; // map 객체를 전역 변수로 선언
	    var marker;
	    document.addEventListener('DOMContentLoaded', function() {
	        // 지도 생성
	        var mapOptions = {
	            // 현재 중심부
	            center: new naver.maps.LatLng(36.51282381744998, 127.95866646925863),
	            zoom: 8
	        };
	        map = new naver.maps.Map('map', mapOptions);
	
	        // 지도 옵션 설정
	        map.setOptions({
	            scaleControl: false,
	            logoControl: false,
	            mapDataControl: false,
	            zoomControl: true,
	            minZoom: 6
	        });
	
	        // 마커 생성
	        //marker = new naver.maps.Marker({
	            //map: map
	        //});
	    });
        // 네비바 기능
	    // 즐겨찾기 배열 선언 (객체 배열로 변경)
	    var favorites = [];
	
	    function showTraditionalBar() {
	        document.getElementById('traditional-bars-list').style.display = 'block';
	        document.getElementById('directions-list').style.display = 'none';
	        document.getElementById('favorites-list').style.display = 'none';
	        // 전통주점과 그 위치
	        var traditionalBars = [
	            { name: "술이송송", position: new naver.maps.LatLng(37.54274487439848, 127.06892219155522) },
	            { name: "명식탁", position: new naver.maps.LatLng(37.62007273513242, 126.9172072201999) },
	            { name: "우리술당당", position: new naver.maps.LatLng(37.54645312223146, 127.04404743547458) },
	            { name: "당산전", position: new naver.maps.LatLng(37.522587334489025, 126.89714794146165) },
	            { name: "한술당", position: new naver.maps.LatLng(35.20511922011246, 129.07922697979654) },
	            { name: "몽로주점", position: new naver.maps.LatLng(37.50540083376486, 126.89225460073942) },
	            { name: "방자전", position: new naver.maps.LatLng(37.206143674023416, 127.07388127175764) },
	            { name: "문가네양조장", position: new naver.maps.LatLng(34.81224890336717, 126.46441216227191) },
	            { name: "꿀주막", position: new naver.maps.LatLng(37.51039713538696, 127.0822501709979) },
	            { name: "전통주점10", position: new naver.maps.LatLng(37.53374487439848, 127.05992219155522) },
	            { name: "전통주점11", position: new naver.maps.LatLng(37.53274487439848, 127.05892219155522) },
	        ];
	        // 각 전통주점의 위치에 마커를 생성하고 지도에 추가
	        traditionalBars.forEach(function(bar) {
	            var marker = new naver.maps.Marker({
	                position: bar.position,
	                map: map // 전역 변수로 선언된 map 객체 사용
	            });
	        });
	        var traditionalBarsList = document.getElementById('traditional-bars-list');
	        traditionalBarsList.innerHTML = "<h3>전통주점 목록</h3>";
	
	        traditionalBars.forEach(function (bar, index) {
	            var listItemContainer = document.createElement("div");
	            listItemContainer.className = 'list-item-container'; 

	            var listItem = document.createElement("button");
	            listItem.onclick = function() {
	                moveToTraditionalBar(index);
	            };
	            listItem.innerHTML = bar.name;

	            var star = document.createElement("span");
	            star.className = "favorite-star";
	            star.innerHTML = "&#9734;";
	            star.onclick = function() {
	                addToFavorites(bar);
	                star.className += " filled";
	            };
	            // 즐겨찾기에 추가된 전통주점이라면 별 모양을 채운 상태로 설정
	            if (favorites.find(favorite => favorite.name === bar.name)) {
	                star.className += " filled";
	            }

	            listItemContainer.appendChild(listItem);
	            listItemContainer.appendChild(star);
	            traditionalBarsList.appendChild(listItemContainer);
	        });
	
	        traditionalBarsList.style.display = 'block';
	    	}   	    	
		    
		    function convertToCoordinates(addressId, xId, yId) {
		        var address = document.getElementById(addressId).value;
		        naver.maps.Service.geocode({
		            query: address
		        }, function(status, response) {
		            if (status !== naver.maps.Service.Status.OK) {
		                return alert('주소를 변환하는데 실패했습니다!');
		            }
		            var result = response.v2, // 검색 결과의 컨테이너
		                items = result.addresses; // 검색 결과의 배열
		
		            document.getElementById(xId).value = items[0].x;
		            document.getElementById(yId).value = items[0].y;
		        });
		    }
	
		    function showDirections() {
		        document.getElementById('traditional-bars-list').style.display = 'none';
		        document.getElementById('directions-list').style.display = 'block';
		        document.getElementById('favorites-list').style.display = 'none';
		        var directionsList = document.getElementById('directions-list');
		        directionsList.innerHTML = ""; // 추가된 부분
		        directionsList.innerHTML += `
		            <h3>길찾기</h3>
		            <div>
		                <label for="startAddress">출발지 주소: </label>
		                <input type="text" id="startAddress" name="startAddress">
		                <button onclick="convertToCoordinates('startAddress', 'startX', 'startY')">좌표 변환</button>
		            </div>
		            <div>
		                <label for="endAddress">목적지 주소: </label>
		                <input type="text" id="endAddress" name="endAddress">
		                <button onclick="convertToCoordinates('endAddress', 'endX', 'endY')">좌표 변환</button>
		            </div>
		            <div>
		                <label for="startX">출발지 X 좌표: </label>
		                <input type="text" id="startX" name="startX">
		            </div>
		            <div>
		                <label for="startY">출발지 Y 좌표: </label>
		                <input type="text" id="startY" name="startY">
		            </div>
		            <div>
		                <label for="endX">목적지 X 좌표: </label>
		                <input type="text" id="endX" name="endX">
		            </div>
		            <div>
		                <label for="endY">목적지 Y 좌표: </label>
		                <input type="text" id="endY" name="endY">
		            </div>
		            <div id="directions-result"></div>
		            <button onclick="findRoute()">길찾기</button> <!-- '길찾기' 버튼 추가 -->
		            <button onclick="findRoute('subway')">지하철 길찾기</button>
		            <button onclick="findRoute('bus')">버스 길찾기</button>
		            <div id="result"></div> <!-- 결과를 출력할 div 요소 추가 -->
		        `;
		        directionsList.style.display = 'block';
		    }
		    function searchPubTransPathAJAX(startX, startY, endX, endY, searchPathType) {
		        var xhr = new XMLHttpRequest();
		        var apiKey = encodeURIComponent("YhVwAhh+Oc85PUFl7nVE/Q");
		        var url = "https://api.odsay.com/v1/api/searchPubTransPathT?SX=" + startX + "&SY=" + startY + "&EX=" + endX + "&EY=" + endY + "&apiKey=" + apiKey + "&SearchPathType=" + searchPathType;
		        xhr.open("GET", url, true);
		        xhr.send();
		        xhr.onreadystatechange = function() {
		            if (xhr.readyState == 4 && xhr.status == 200) {
		                var result = JSON.parse(xhr.responseText);
		                var paths = result.result.path;
		                var output = '';
		                for (var i = 0; i < paths.length; i++) {
		                    var info = paths[i].info;
		                    output += '경로 ' + (i+1) + ':\n';
		                    output += '총 이동 거리: ' + info.trafficDistance + 'm\n';
		                    output += '총 소요시간: ' + info.totalTime + '분\n';
		                    output += '총 요금: ' + info.payment + '원\n';
		                    output += '---------------------\n';
		                }
		                document.getElementById("result").innerText = output;
		            }
		        }
		    }
		    //길찾기 api
			function findRoute(type) {
			    var startX = document.getElementById("startX").value;
			    var startY = document.getElementById("startY").value;
			    var endX = document.getElementById("endX").value;
			    var endY = document.getElementById("endY").value;
			    var searchPathType = (type === 'subway') ? 1 : 2;
			    searchPubTransPathAJAX(startX, startY, endX, endY, searchPathType);
			}
		    // 즐겨찾기에 추가하는 함수
		    function addToFavorites(bar) {
		        if (!favorites.find(favorite => favorite.name === bar.name)) {
		            favorites.push(bar);
		            alert(bar.name + '가 즐겨찾기에 추가되었습니다.');
		        }
		    }    
		    // 즐겨찾기에서 제거하는 함수
		    function removeFromFavorites(barName) {
		        var index = favorites.findIndex(favorite => favorite.name === barName);
		        if (index !== -1) {
		            favorites.splice(index, 1);
		            alert(barName + '가 즐겨찾기에서 제거되었습니다.');
		            showFavorites(); // 즐겨찾기 목록을 갱신합니다.
		        }
		    }

		    function showFavorites() {
		        document.getElementById('traditional-bars-list').style.display = 'none';
		        document.getElementById('directions-list').style.display = 'none';
		        document.getElementById('favorites-list').style.display = 'block';
		        var favoritesList = document.getElementById('traditional-bars-list');
		        favoritesList.innerHTML = "<h3>즐겨찾기 목록</h3>";

		        favorites.forEach(function (bar, index) {
		            favoritesList.innerHTML += "<button style='display: block; margin-bottom: 5px;' onclick='moveToFavoriteBar(" + index + "); removeFromFavorites(\"" + bar.name + "\")'>" + bar.name + "</button>";
		        });

		        favoritesList.style.display = 'block';
		    }
		    // 즐겨찾기 목록에서 특정 위치로 이동하는 함수
		    function moveToFavoriteBar(index) {
		        var selectedPosition = favorites[index].position;
		        map.panTo(selectedPosition);
		        marker.setPosition(selectedPosition);
		    }
			 // 마커 생성
		    marker = new naver.maps.Marker({
		        //position: new naver.maps.LatLng(36.51282381744998, 127.95866646925863),
		        map: map
		    });
			 
	        // 목록 클릭 시 해당 위치로 이동하고 마커 표시
			function moveToTraditionalBar(index) {
			    var traditionalBarsPositions = [
	            	new naver.maps.LatLng(37.54274487439848, 127.06892219155522),
	            	new naver.maps.LatLng(37.62007273513242, 126.9172072201999),
	            	new naver.maps.LatLng(37.54645312223146, 127.04404743547458),
	            	new naver.maps.LatLng(37.522587334489025, 126.89714794146165),
	            	new naver.maps.LatLng(35.20511922011246, 129.07922697979654),
	            	new naver.maps.LatLng(37.50540083376486, 126.89225460073942),
	            	new naver.maps.LatLng(37.206143674023416, 127.07388127175764),
	            	new naver.maps.LatLng(34.81224890336717, 126.46441216227191),
	            	new naver.maps.LatLng(37.51039713538696, 127.0822501709979),
	            	new naver.maps.LatLng(37.53374487439848, 127.05992219155522),
	            	new naver.maps.LatLng(37.53274487439848, 127.05892219155522),
	                // 다른 전통주점들의 위치도 추가해주세요.
	            ];
	
			    var selectedPosition = traditionalBarsPositions[index];
			    marker.setPosition(selectedPosition);
			    // bounds를 만들어 지도가 해당 영역이 모두 보이도록 조정
			    var bounds = new naver.maps.LatLngBounds();
			    bounds.extend(selectedPosition);
			    map.fitBounds(bounds);
			    // 지도가 새로운 위치로 완전히 이동한 후에 확대를 시작
			    naver.maps.Event.addListenerOnce(map, 'idle', function() {
			        map.setZoom(18);  // 마커 위치가 화면 중앙이 되도록 확대
			    });
	        }
</script>
</body>
</html>