package com.destiny.service.meeting;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;

public interface MeetingService {
	
	public Map<String , Object> getInterestList() throws Exception; /*개설하기 열떄 관심사 항목 가져오기*/
	
	public void addMeeting(Meeting meeting) throws Exception; /*새로 개설하기*/
	
	public void addAct(Meeting meeting) throws Exception; /*개설과 동시에 엑트 1회차 업데이트*/
	
	public void addCrewList(Meeting meeting) throws Exception; /*개설과 동시에  모임원 리스트에 모임장 자신 업데이트*/
	
	public Map<String , Object> getMeetingList(Search search) throws Exception; /*리스트 보여줄떄 목록 리스팅*/
	
	public Meeting getMeeting(int meetingNo) throws Exception; /*상세보기 */
	
	public Meeting getAct(int meetingNo) throws Exception; /*상세보기 갈때 엑트 가져가기 */
	
	public int getCrewCount(int meetingNo) throws Exception; /*상세보기 멤버수*/
	
	public Map<String , Object> getCrew(int meetingNo) throws Exception; /*상세보기 멤버 리스트*/
	
	public void updateViews(int meetingNo) throws Exception; /*상세보기 들어갈때 조회수 올려주기*/
	
	public Map<String , Object> getNearMeeting(String address) throws Exception; /*리스트 불러올떄 베스트 테이브 불러오기*/

	public void updateMeeting(Meeting meeting) throws Exception; /*모임 삭제될떄 상태값 변경*/
	
	public void updateContentsMeeting(Meeting meeting) throws Exception; /*모임 수정 미팅테이블*/
	
	public void updateContentsAct(Meeting meeting) throws Exception; /*모임 수정 회차테이블*/
	
	public int addCrewM(Meeting meeting) throws Exception; /*모임원 리스트에 업데이트*/
	
	public int addCrewAct(Meeting meeting) throws Exception; /*참여원 리스트에 업데이트*/
	
	public int checkDuplicationCrew(Meeting meeting) throws Exception; /*가입할떄 중복체크*/
	
	public Meeting getActNo(Meeting meeting) throws Exception; /*참여할떄 참여번호 가져오기*/
	
	public Meeting getCrewNo(Meeting meeting) throws Exception; /*참여할떄 회원번호 가져오기*/
	
	public int DuplicationAct(Meeting meeting) throws Exception; /*참여할떄 중복체크*/
	
	public Map<String , Object> getActCrew(Meeting meetingNo) throws Exception;/*참여자 명단 가져오기*/
	
	public String getCrewrole(Meeting meeting) throws Exception; /*수정 삭제 시 모임장인지 확인 */
	
	public int kickOut(Meeting meeting)throws Exception; /*강퇴진행*/
	
	public int kickOutAct(Meeting meeting)throws Exception; /*강퇴된 회원 활동회차에서 삭제*/
	
	public int passto(Meeting meeting)throws Exception; /*위임하기*/
	
	public int dropMeeting(Meeting meeting)throws Exception; /*탈퇴진행*/
	
	public int nextMeeting(Meeting meeting)throws Exception; /*다음회차 모임 등록*/
	
	public void shutdown(Meeting meeting)throws Exception; /*모임장 탈퇴 셧다운 발동*/
}
