package com.destiny.service.user.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.common.Search;
import com.destiny.service.domain.Location;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserDao;
import com.destiny.service.user.UserService;
import com.destiny.service.domain.Letter;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}
	
	@Override
	public User getUserByNickName(String nickName) throws Exception {
		return userDao.getUserByNickName(nickName);
	}
	
	@Override
	public User getUserByEmail(String email) throws Exception {
		return userDao.getUserByEmail(email);
	}

	@Override
	public User getUserByPhone(String phone) throws Exception {
		return userDao.getUserByPhone(phone);
	}

	@Override
	public void attendLogin(User user) throws Exception {
		userDao.attendLogin(user);
	}
	
	@Override
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	@Override
	public Map<String, Object> getLocationList(String city) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Location> list = userDao.getLocationList(city);
		map.put("list", list);
		return map;
	}

	@Override
	public List<String> getInterestByUser(int[] interestNo) throws Exception {
		List<String> list = new ArrayList<String>();
		
		list.add(userDao.getInterest(interestNo[0]));
		list.add(userDao.getInterest(interestNo[1]));
		list.add(userDao.getInterest(interestNo[2]));
		
		return list;
	}

	@Override
	public List<String> getInterestList() throws Exception {
		return userDao.getInterestList();
	}

	@Override
	public Map<String, Object> getTypeByUser(int[] typeNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("myType", userDao.getType(typeNo[0]));
		map.put("firstType", userDao.getType(typeNo[1]));
		map.put("secondType", userDao.getType(typeNo[2]));
		map.put("thirdType", userDao.getType(typeNo[3]));
		
		return map;
	}

	@Override
	public List<String> getTypeList() throws Exception {
		return userDao.getTypeList();
	}
	
	

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}
	
	@Override
	public void updatePassword(User user) throws Exception {
		userDao.updatePassword(user);
	}

	@Override
	public void updateType(User user) throws Exception {
		userDao.updateType(user);
	}
	
	@Override
	public void updateGrade(User user) throws Exception {
		userDao.updateGrade(user);
	}


	@Override
	public void updateState(User user) throws Exception {
		userDao.updateState(user);
	}
	
	@Override
	public void updateWarningCount(User user) throws Exception {
		userDao.updateWarningCount(user);
	}

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getUserTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	
	
	
}
