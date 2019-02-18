package com.destiny.service.user;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Location;
import com.destiny.service.domain.User;
import com.destiny.service.domain.Letter;


//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface UserDao {
	
	// SELECT ONE
	public User getUser(String userId) throws Exception;
	
	public User getUserByNickName(String nickName) throws Exception;
	
	public User getUserByEmail(String email) throws Exception;
	
	public User getUserByPhone(String phone) throws Exception;
	
	public void attendLogin(User user) throws Exception;
	
	public void addUser(User user) throws Exception;
	
	public List<Location> getLocationList(String city) throws Exception;
	
	public String getInterest(int interestNo) throws Exception;
	
	public List<String> getInterestList() throws Exception;
	
	public String getType(int typeNo) throws Exception;
	
	public List<String> getTypeList() throws Exception;
	
	public void updateUser(User user)throws Exception;
	
	public void updateType(User user)throws Exception;
	
	public void updatePassword(User user)throws Exception;
	
	public void updateGrade(User user)throws Exception;
	
	public void updateState(User user)throws Exception;
	
	public void updateWarningCount(User user)throws Exception;
	
	public List<User> getUserList(Search search) throws Exception;
	
	public int getUserTotalCount(Search search) throws Exception;
	
	public List<String> getType() throws Exception;
	
}