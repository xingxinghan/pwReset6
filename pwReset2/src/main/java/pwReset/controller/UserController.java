package pwReset.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import pwReset.pojo.User;
import pwReset.service.UserService;


@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String welcome() {
		
		return "welcome";
		
	}
	
	@RequestMapping("/pwReset")
	public String pwReset() {
		
		return "pw-index";
		
	}
	
	@RequestMapping("/wechat")
	public String wechat() {
		
		return "wechat";
		
	}
	
	@RequestMapping("/pwReset/validateID")
	public String validateID(@RequestParam("uid") String uid, @RequestParam("iD_num") String iD_num) {
		
		User user=new User();
		user.setEduPersonCardID(iD_num);
		user.setUid(uid);
		
		User userByUid=userService.getUser(uid);
		
		if(userByUid==null) {
			
			return "cardNumErrors";
		}
		
		String eduPersonCardID = userByUid.getEduPersonCardID();
		if(!eduPersonCardID.equals(iD_num)) {
			
			return "errors";
		}
		else {
			
			boolean passwordIfModified = userService.update(userByUid);
		}
		User userByUid1=userService.getUser(uid);
		return "succeed";
	}
	

}
