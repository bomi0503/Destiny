<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	    <!-- 모달창 디자인 부분 -->
        
        <!-- ///////////////////////   다음 모임 등록 모달창    //////////////////////////////////////////////// -->
        <div id="nextDialog">
        	<form id="nextDialogForm" class="form-horizontal">
				 <div  id="dateOrDay" class="form-group col-sm-12 col-md-12" >
		 			<input style="width: 100%;" id="nextDay" type="text" class="datepicker form-control" readonly="readonly" class="form-control" placeholder="모임날짜" name="meetingDate"/>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<select id="nextTime" name="meetingTime" class="form-control">
				 		<option>모임시간</option>
				 		<option value="12:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='12:00' ? "selected" : "" }>12:00</option>
				 		<option value="13:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='13:00' ? "selected" : "" }>13:00</option>
				 		<option value="14:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='14:00' ? "selected" : "" }>14:00</option>
				 	</select>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	회비가 있다면 아래 입력해주세요
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input style="width: 100%;" id="nextDues" name="meetingDues" type="text" class="form-control" placeholder="ex)식비 1만원">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 <input style="width: 100%;" name="meetingLocation" type="text" class="form-control nextLocation" id="sample6_address" readonly="readonly">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
					<input style="width:100%;" type="button" class="" onclick="sample6_execDaumPostcode()" value="주소 검색"><br>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				 </div>
				 </form>
				 <div class="form-group">
				   <div class="col-sm-12 col-md-12 text-center">
				     <button class="col-sm-6 col-md-6"  id="nextSchedul" value="nextSchedul">등록</button>
					 <button class="col-sm-6 col-md-6" id="nextCancle">취소</button>
				   </div>
				 </div>
			
		</div>
		
		<!-- //////////////////////////   다음 모임 등록 모달창 끝       ////////////////////////////////////////////// -->