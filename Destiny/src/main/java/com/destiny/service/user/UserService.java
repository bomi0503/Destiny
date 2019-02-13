package com.destiny.service.user;

import java.util.List;
import java.util.Map;

import com.destiny.service.domain.Location;
import com.destiny.service.domain.User;
import com.destiny.service.domain.Letter;
import com.destiny.common.Search;


//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface UserService {
	
	// 내정보확인 / 로그인
	public User getUser(String userId) throws Exception;
	
	public User getUserByNickName(String nickName) throws Exception;
	
	public User getUserByEmail(String email) throws Exception;
	
	public User getUserByPhone(String phone) throws Exception;
	
	public void attendLogin(User user) throws Exception;
	
	public void addUser(User user) throws Exception;
	
	public Map<String, Object> getLocationList(String city) throws Exception;
	
	public List<String> getInterestByUser(int[] interestNo) throws Exception;
	
	public List<String> getInterestList() throws Exception;
		
	public Map<String, Object> getTypeByUser(int[] typeNo) throws Exception;
	
	public List<String> getTypeList() throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void updateType(User user) throws Exception;
	
	public void updatePassword(User user)throws Exception;
	
	public void updateGrade(User user) throws Exception;
	
	public void updateState(User user) throws Exception;
	
	public void updateWarningCount(User user) throws Exception;
	
	public Map<String , Object> getUserList(Search search) throws Exception;
	
	
}