<%@page import="java.sql.SQLException"%>
<%@page import="com.bts.plan.model.TourPlaceVO"%>
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
<jsp:useBean id="tourPlaceVO" class="com.bts.plan.model.TourPlaceVO" scope="page"></jsp:useBean>
<jsp:useBean id="tourPlaceService" class="com.bts.plan.model.TourPlaceService" scope="page"></jsp:useBean>
<%
	//
	//2. db - db에서 여행지이름, 위도, 경도 가져옴
	List<TourPlaceVO> list = null;
	try{
		list = tourPlaceService.selecAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3. 결과처리
	
%>
<div class="site-section">
	<div class="divMap">
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width: 90%; height: 800px; float: left;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=key%>"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		
			mapOption = { 
        		center: new kakao.maps.LatLng(35.17998420235873, 129.07496554041742), // 지도의 중심좌표
        		level: 9 // 지도의 확대 레벨
    		};

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var positions = [];
	    	<%
	    	String title = "", lat="", lng="";
	    	for(int i=0; i<list.size();i++){
	    		tourPlaceVO = list.get(i);
	    		title = tourPlaceVO.getTName();
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
				
	    	<%}%>
	    	console.log(positions.length);
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
		</script>
	</div>
</div>
<!-- 
    <div class="site-section">
      <div class="container">
      </div>
    </div>

 -->
<%@include file="../inc/planBottom.jsp"%>
