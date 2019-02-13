package com.destiny.service.meeting;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;

public interface MeetingDao {
   
   public List<Meeting> getInterestList() throws Exception;
   
   public List<Meeting> todayTogeterMeeting(String today) throws Exception; /*리스트 보여줄때 오늘의 함께해요 리스팅*/
   
   public List<Meeting> hotMeeting() throws Exception; /*리스트 보여줄때  what's hot 리스팅*/

   public void addMeeting(Meeting meeting)throws Exception;/*새로 개설하기 */
   
   public void addAct(Meeting meeting)throws Exception; /*미팅 애드할때 액트 테이블 같이 업데이트*/
   
   public void addCrewList(Meeting meeting)throws Exception; 
   
   public List<Meeting> getMeetingList(Search search) throws Exception;
   
   public Meeting getMeeting(int meetingNo)throws Exception;
   
   public Meeting getAct(int meetingNo)throws Exception;
   
   public int getCrewCount(int meetingNo)throws Exception;
   
   public List<Meeting> getCrew(int meetingNo) throws Exception;
   
   public void updateViews(int meetingNo)throws Exception;
   
   public List<Meeting> getNearMeeting(String address) throws Exception;
   
   public void updateMeeting(Meeting meeting)throws Exception;
   
   public void updateContentsMeeting(Meeting meeting)throws Exception;
   
   public void updateContentsAct(Meeting meeting) throws Exception; /*모임 수정 회차테이블*/
   
   public int addCrewM(Meeting meeting)throws Exception;
   
   public int addCrewAct(Meeting meeting)throws Exception;
   
   public int checkDuplicationCrew(Meeting meeting)throws Exception;
   
   public Meeting getActNo(Meeting meeting) throws Exception; /*참여할떄 참여번호 가져오기*/
   
   public Meeting getCrewNo(Meeting meeting) throws Exception; /*참여할떄 회원번호 가져오기*/
   
   public int DuplicationAct(Meeting meeting) throws Exception; /*참여할떄 중복체크*/
   
   public List<Meeting> getActCrew(Meeting meetingNo) throws Exception;/*참여자 명단 가져오기*/
   
   public String getCrewrole(Meeting meeting) throws Exception; /*수정 삭제 시 모임장인지 확인 */
   
   public int kickOut(Meeting meeting)throws Exception; /*강퇴진행*/
   
   public int kickOutAct(Meeting meeting)throws Exception; /*강퇴된 회원 활동회차에서 삭제*/
   
   public int passto(Meeting meeting)throws Exception; /*위임하기*/
   
   public int dropMeeting(Meeting meeting)throws Exception; /*탈퇴진행*/
   
   public int nextMeeting(Meeting meeting)throws Exception; /*다음회차 모임 등록*/
   
   public void shutdown(Meeting meeting)throws Exception; /*모임장 탈퇴 셧다운 발동*/
   
   public int getTotalCount(Search search) throws Exception;
}