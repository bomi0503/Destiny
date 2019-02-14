package com.destiny.service.meeting.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;
import com.destiny.service.meeting.MeetingDao;
import com.destiny.service.meeting.MeetingService;

@Repository("meetingDaoImpl")
public class MeetingDaoImpl implements MeetingDao {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	public MeetingDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<Meeting> getInterestList() throws Exception {
		return sqlSession.selectList("MeetingMapper.getInterestList");
	}

	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		String picpath = "";
		if(meeting.getImgFile() !=null && !meeting.getImgFile().isEmpty()) {
			MultipartFile file = meeting.getImgFile();
			byte fileData[] = file.getBytes();
			picpath = file.getOriginalFilename();
			FileOutputStream fos = new FileOutputStream("C:\\Users\\Bitcamp\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\meeting\\" + picpath);

			fos.write(fileData);
			fos.close();
		}
		meeting.setTitleImg(picpath);
		
		sqlSession.insert("MeetingMapper.addMeeting", meeting);
	}
	
	@Override
	public void addAct(Meeting meeting) throws Exception {
		sqlSession.insert("MeetingMapper.addAct", meeting);
		
	}
	
	@Override
	public void addCrewList(Meeting meeting) throws Exception {
		sqlSession.insert("MeetingMapper.addCrewList", meeting);
		
	}

	@Override
	public List<Meeting> getMeetingList(Search search) throws Exception {
		return sqlSession.selectList("MeetingMapper.getMeetingList",search);
	}

	@Override
	public Meeting getMeeting(int meetingNo) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getMeeting", meetingNo);
	}
	
	@Override
	public Meeting getAct(int meetingNo) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getAct", meetingNo);
	}
	
	@Override
	public int getCrewCount(int meetingNo) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getCrewCount", meetingNo);
	}
	
	@Override
	public List<Meeting> getCrew(int meetingNo) throws Exception {
		return sqlSession.selectList("MeetingMapper.getCrew",meetingNo);
	}
	
	@Override
	public void updateViews(int meetingNo) throws Exception {
		sqlSession.selectOne("MeetingMapper.updateViews", meetingNo);		
	}

	@Override
	public List<Meeting> getNearMeeting(String address) throws Exception {
		return sqlSession.selectList("MeetingMapper.getNearMeeting",address);
	}

	@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		sqlSession.update("MeetingMapper.updateMeeting",meeting);
	}

	@Override
	public void updateContentsMeeting(Meeting meeting) throws Exception {
		String picpath = "";
		
		if(meeting.getImgFile() !=null && !meeting.getImgFile().isEmpty()) {
			MultipartFile file = meeting.getImgFile();
			byte fileData[] = file.getBytes();
			picpath = file.getOriginalFilename();
			FileOutputStream fos = new FileOutputStream("C:\\Users\\Bitcamp\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\meeting\\" + picpath);
			fos.write(fileData);
			fos.close();
			meeting.setTitleImg(picpath);
		}else {
			meeting.setTitleImg(meetingService.getMeeting(meeting.getMeetingNo()).getTitleImg()); 
		}
		
		
		sqlSession.update("MeetingMapper.updateContentsMeeting",meeting);
		
	}

	@Override
	public int addCrewM(Meeting meeting) throws Exception {
		return sqlSession.insert("MeetingMapper.addCrewM", meeting);
		
	}

	@Override
	public int checkDuplicationCrew(Meeting meeting) throws Exception {
		return sqlSession.selectOne("MeetingMapper.checkDuplicationCrew", meeting);
	}

	@Override
	public int addCrewAct(Meeting meeting) throws Exception {
		return sqlSession.insert("MeetingMapper.addCrewAct", meeting);
	}

	@Override
	public Meeting getActNo(Meeting meeting) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getActNo", meeting);
	}

	@Override
	public Meeting getCrewNo(Meeting meeting) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getCrewNo", meeting);
	}

	@Override
	public int DuplicationAct(Meeting meeting) throws Exception {
		return sqlSession.selectOne("MeetingMapper.duplicationAct", meeting);
	}

	@Override
	public List<Meeting> getActCrew(Meeting meetingNo) throws Exception {
		return sqlSession.selectList("MeetingMapper.getActCrew",meetingNo);
	}

	@Override
	public void updateContentsAct(Meeting meeting) throws Exception {
		sqlSession.update("MeetingMapper.updateContentsAct",meeting);
		
	}

	@Override
	public String getCrewrole(Meeting meeting) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getCrewrole", meeting);
	}

	@Override
	public int kickOut(Meeting meeting) throws Exception {
		return sqlSession.update("MeetingMapper.kickOut", meeting);
	}

	@Override
	public int kickOutAct(Meeting meeting) throws Exception {
		return sqlSession.delete("MeetingMapper.kickOutAct", meeting);
	}

	@Override
	public int passto(Meeting meeting) throws Exception {
		return sqlSession.update("MeetingMapper.passto", meeting);
	}

	@Override
	public int dropMeeting(Meeting meeting) throws Exception {
		return sqlSession.delete("MeetingMapper.dropMeeting", meeting);
	}

	@Override
	public int nextMeeting(Meeting meeting) throws Exception {
		return sqlSession.update("MeetingMapper.nextMeeting", meeting);
	}

	@Override
	public void shutdown(Meeting meeting) throws Exception {
		sqlSession.update("MeetingMapper.shutdown", meeting);
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getTotalCount", search);
	}

	@Override
	public List<Meeting> todayTogeterMeeting(String today) throws Exception {
		return sqlSession.selectList("MeetingMapper.todayTogeterMeeting", today);
	}

	@Override
	public List<Meeting> hotMeeting() throws Exception {
		return sqlSession.selectList("MeetingMapper.hotMeeting");
	}
	

}
