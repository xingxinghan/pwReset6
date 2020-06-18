package pwReset.service;

import org.springframework.stereotype.Service;

import pwReset.pojo.User;

public interface UserService {
	
	
	public String getIDnum(String stu_num);

	public boolean validate(User user);

	public User getUser(String uid);

	public boolean update(User userByUid);
}
