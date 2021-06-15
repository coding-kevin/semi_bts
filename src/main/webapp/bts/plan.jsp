<%@page import="com.bts.plan.model.TourplaceVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.bts.plan.model.TourplaceVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/planTop.jsp"%>
<% String key = "609a540cc1b04dc8b85cfe9e7393f6ff"; %>

<style type="text/css">
	.divMap{
		clear:both;
		float: right;
		width: 60%;
	}

</style>
<jsp:useBean id="tourPlaceVO" class="com.bts.plan.model.TourplaceVO" scope="page"></jsp:useBean>
<jsp:useBean id="tourPlaceService" class="com.bts.plan.model.TourPlaceService" scope="page"></jsp:useBean>
<%
	//
	//2. db - db에서 여행지이름, 위도, 경도 가져옴
	List<TourplaceVO> list = null;
	try{
		list = tourPlaceService.selectAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3. 결과처리
	
%>
<div class="site-section">
	<div class="divMap">
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width: 90%;height: 750px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=key%>"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		
			mapOption = { 
        		center: new kakao.maps.LatLng(35.17998420235873, 129.07496554041742), // 부산시청 지도의 중심좌표
        		level: 9 // 지도의 확대 레벨
    		};

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var positions = [];
	    	<%
	    	String title = "", lat="", lng="", tel="", homepage="", address="", imageURL="";
	    	for(int i=0; i<list.size();i++){
	    		tourPlaceVO = list.get(i);
	    		title = tourPlaceVO.getPlaceName();
	    		tel = tourPlaceVO.getPlaceTel();
	    		address = tourPlaceVO.getPlaceAddress();
   				homepage = tourPlaceVO.getHomepage();
   				imageURL = tourPlaceVO.getImageURL();
	    		lat = tourPlaceVO.getLatitude();
	    		lng = tourPlaceVO.getLongitude();
	    		System.out.println("title =  "+ title +", lat = "+ lat+", lng =" + lng);
	    	%>
			positions = [
			    {
			    	title: '<%=title%> ',
			        latlng: new kakao.maps.LatLng(<%=lat%>, <%=lng%>)
			    }
			];
	    	
			/* title: '카카오', 
	        latlng: new kakao.maps.LatLng(33.450705, 126.570677) */
	        
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			}
			
			// 커스텀 오버레이에 표시할 컨텐츠 입니다
			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			// 별도의 이벤트 메소드를 제공하지 않습니다 
			var content = '<div class="wrap">' + 
			            '    <div class="info">' + 
			            '        <div class="title">' + 
			            '            <%=title%>' + 
			            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			            '        </div>' + 
			            '        <div class="body">' + 
			            '            <div class="img">' +
			            '                <img src="<%=imageURL%>" width="73" height="70">' +
			            '           </div>' + 
			            '            <div class="desc">' + 
			            '                <div class="ellipsis"><%=address%></div>' + 
			            '                <div class="jibun ellipsis"></div>' + 
			            '                <div><a href="<%=homepage%>" target="_blank" class="link">홈페이지</a></div>' + 
			            '            </div>' + 
			            '        </div>' + 
			            '    </div>' +    
			            '</div>';

			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: marker.getPosition()       
			});


			
		<%}%>
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
			    overlay.setMap(null);     
			}
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
			    overlay.setMap(map);
			});
		</script>
	</div>
</div>

<div class="site-section">
    <div class="container">
    </div>
</div>


<%@include file="../inc/planBottom.jsp"%>
