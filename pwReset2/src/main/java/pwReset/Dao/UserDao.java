package pwReset.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.query.LdapQuery;
import org.springframework.ldap.query.LdapQueryBuilder;
import org.springframework.stereotype.Service;

import pwReset.pojo.User;
import pwReset.pojo.UserRepository;

@Service
public class UserDao {
	
	@Autowired
	private UserRepository userRepository;
	
	
	public User getUser(String uid) {
		
		LdapQuery bksQuery = LdapQueryBuilder.query()
				.base("ou=bzks,ou=People").where("uid").is(uid);
		LdapQuery yjsQuery = LdapQueryBuilder.query()
				.base("ou=yjs,ou=People").where("uid").is(uid);
		LdapQuery jzgQuery = LdapQueryBuilder.query()
				.base("ou=jzg,ou=People").where("uid").is(uid);
		
		
		User user = userRepository.findOne(bksQuery);
		if(user==null) {
				user=userRepository.findOne(yjsQuery);	
		}
		if(user==null) {
			user=userRepository.findOne(jzgQuery);
		}
		
		return user;
	}


	public boolean update(User user) {
		// TODO Auto-generated method stub
		
		try {
			User user1 = userRepository.save(user);
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
			
			
	
	

}
