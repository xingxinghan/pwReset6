package pwReset.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pwReset.Dao.UserDao;
import pwReset.Utils.MD4;
import pwReset.pojo.User;


@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;


	public String getIDnum(String stu_num) {
		// TODO Auto-generated method stub
		return "130528199102023689";
	}

	public boolean validate(User user) {
		// TODO Auto-generated method stub
		User userById = userDao.getUser(user.getUid());
		System.out.println(userById.getUserPassword());
		return true;
	}
	public User getUser(String uid) {
		// TODO Auto-generated method stub
		User userByUid = userDao.getUser(uid);
		return userByUid;
	}

	@Override
	public boolean update(User user) {
		// TODO Auto-generated method stub
		String uid = user.getUid();
		String eduPersonCardID = user.getEduPersonCardID();
		
		user.setOtherPassword(MD4.getMD4(eduPersonCardID.substring(12)));
		user.setUserPassword(eduPersonCardID.substring(12));
		return userDao.update(user);
	}

	

}
