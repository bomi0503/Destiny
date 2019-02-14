package com.destiny.service.meeting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;
import com.destiny.service.letter.LetterDao;
import com.destiny.service.meeting.MeetingDao;
import com.destiny.service.meeting.MeetingService;

@Service("meetingServiceImpl")
public class MeetingServiceImpl implements MeetingService {
	@Autowired
	@Qualifier("meetingDaoImpl")
	private MeetingDao meetingDao;

	public void setLetterDao(MeetingDao meetingDao) {
		this.meetingDao = meetingDao;
	}
	
	public MeetingServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> getInterestList() throws Exception {
		List<Meeting> list= meetingDao.getInterestList();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		return map;
	}

	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		meetingDao.addMeeting(meeting);
	}
	
	@Override
	public void addAct(Meeting meeting) throws Exception {
		meetingDao.addAct(meeting);
		
	}
	
	@Override
	public void addCrewList(Meeting meeting) throws Exception {
		meetingDao.addCrewList(meeting);
		
	}

	@Override
	public Map<String, Object> getMeetingList(Search search) throws Exception {
		List<Meeting> list= meetingDao.getMeetingList(search);
		int totalCount = meetingDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	@Override
	public Meeting getMeeting(int meetingNo) throws Exception {
		return meetingDao.getMeeting(meetingNo);
	}
	
	@Override
	public Meeting getAct(int meetingNo) throws Exception {
		return meetingDao.getAct(meetingNo);
	}
	
	@Override
	public int getCrewCount(int meetingNo) throws Exception {
		return meetingDao.getCrewCount(meetingNo);
	}

	@Override
	public Map<String, Object> getCrew(int meetingNo) throws Exception {
		List<Meeting> crewList= meetingDao.getCrew(meetingNo);
		
		Map<String, Object> crewMap = new HashMap<String, Object>();
		crewMap.put("crewList", crewList );
		return crewMap;
	}
	
	@Override
	public void updateViews(int meetingNo) throws Exception {
		meetingDao.updateViews(meetingNo);
	}

	@Override
	public Map<String, Object> getNearMeeting(String address) throws Exception {
		List<Meeting> bestList= meetingDao.getNearMeeting(address);
		
		Map<String, Object> bestMap = new HashMap<String, Object>();
		bestMap.put("bestList", bestList );
		return bestMap;
	}

	@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		meetingDao.updateMeeting(meeting);
		
	}

	@Override
	public void updateContentsMeeting(Meeting meeting) throws Exception {
		meetingDao.updateContentsMeeting(meeting);
		
	}

	@Override
	public int addCrewM(Meeting meeting) throws Exception {
		return meetingDao.addCrewM(meeting);
		
	}

	@Override
	public int checkDuplicationCrew(Meeting meeting) throws Exception {
		return meetingDao.checkDuplicationCrew(meeting);
	}

	@Override
	public int addCrewAct(Meeting meeting) throws Exception {
		return meetingDao.addCrewAct(meeting);
	}

	@Override
	public Meeting getActNo(Meeting meeting) throws Exception {
		return meetingDao.getActNo(meeting);
	}

	@Override
	public Meeting getCrewNo(Meeting meeting) throws Exception {
		return meetingDao.getCrewNo(meeting);
	}

	@Override
	public int DuplicationAct(Meeting meeting) throws Exception {
		return meetingDao.DuplicationAct(meeting);
	}

	@Override
	public Map<String, Object> getActCrew(Meeting meetingNo) throws Exception {
		List<Meeting> list= meetingDao.getActCrew(meetingNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		return map;
	}

	@Override
	public void updateContentsAct(Meeting meeting) throws Exception {
		meetingDao.updateContentsAct(meeting);
		
	}

	@Override
	public String getCrewrole(Meeting meeting) throws Exception {
		return meetingDao.getCrewrole(meeting);
	}

	@Override
	public int kickOut(Meeting meeting) throws Exception {
		return meetingDao.kickOut(meeting);
	}

	@Override
	public int kickOutAct(Meeting meeting) throws Exception {
		return meetingDao.kickOutAct(meeting);
	}

	@Override
	public int passto(Meeting meeting) throws Exception {
		return meetingDao.passto(meeting);
	}

	@Override
	public int dropMeeting(Meeting meeting) throws Exception {
		return meetingDao.dropMeeting(meeting);
	}

	@Override
	public int nextMeeting(Meeting meeting) throws Exception {
		return meetingDao.nextMeeting(meeting);
	}

	@Override
	public void shutdown(Meeting meeting) throws Exception {
		meetingDao.shutdown(meeting);
		
	}

	@Override
	public Map<String, Object> todayTogeterMeeting(String today) throws Exception {
		List<Meeting> todaylist= meetingDao.todayTogeterMeeting(today);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("todaylist", todaylist );
		return map;
	}

	@Override
	public Map<String, Object> hotMeeting() throws Exception {
		List<Meeting> hotlist= meetingDao.hotMeeting();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hotlist", hotlist);
		return map;
	}

	
}
