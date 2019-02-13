package com.destiny.service.meeting;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;

public interface MeetingDao {
   
   public List<Meeting> getInterestList() throws Exception;
   
   public List<Meeting> todayTogeterMeeting(String today) throws Exception; /*����Ʈ �����ٶ� ������ �Բ��ؿ� ������*/
   
   public List<Meeting> hotMeeting() throws Exception; /*����Ʈ �����ٶ�  what's hot ������*/

   public void addMeeting(Meeting meeting)throws Exception;/*���� �����ϱ� */
   
   public void addAct(Meeting meeting)throws Exception; /*���� �ֵ��Ҷ� ��Ʈ ���̺� ���� ������Ʈ*/
   
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
   
   public void updateContentsAct(Meeting meeting) throws Exception; /*���� ���� ȸ�����̺�*/
   
   public int addCrewM(Meeting meeting)throws Exception;
   
   public int addCrewAct(Meeting meeting)throws Exception;
   
   public int checkDuplicationCrew(Meeting meeting)throws Exception;
   
   public Meeting getActNo(Meeting meeting) throws Exception; /*�����ҋ� ������ȣ ��������*/
   
   public Meeting getCrewNo(Meeting meeting) throws Exception; /*�����ҋ� ȸ����ȣ ��������*/
   
   public int DuplicationAct(Meeting meeting) throws Exception; /*�����ҋ� �ߺ�üũ*/
   
   public List<Meeting> getActCrew(Meeting meetingNo) throws Exception;/*������ ��� ��������*/
   
   public String getCrewrole(Meeting meeting) throws Exception; /*���� ���� �� ���������� Ȯ�� */
   
   public int kickOut(Meeting meeting)throws Exception; /*��������*/
   
   public int kickOutAct(Meeting meeting)throws Exception; /*����� ȸ�� Ȱ��ȸ������ ����*/
   
   public int passto(Meeting meeting)throws Exception; /*�����ϱ�*/
   
   public int dropMeeting(Meeting meeting)throws Exception; /*Ż������*/
   
   public int nextMeeting(Meeting meeting)throws Exception; /*����ȸ�� ���� ���*/
   
   public void shutdown(Meeting meeting)throws Exception; /*������ Ż�� �˴ٿ� �ߵ�*/
   
   public int getTotalCount(Search search) throws Exception;
}