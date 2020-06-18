package pwReset.pojo;

import javax.naming.Name;

import org.springframework.ldap.odm.annotations.Attribute;
import org.springframework.ldap.odm.annotations.DnAttribute;
import org.springframework.ldap.odm.annotations.Entry;
import org.springframework.ldap.odm.annotations.Id;

@Entry(base = "dc=authldap,dc=edu,dc=cn", objectClasses = {"top", "person"})
public class User {

	@Id
	private Name id;
	
	@DnAttribute(value = "uid")
	private String uid;
	
	@Attribute(name = "cn")
	private String commonName;
	
	@Attribute(name = "eduPersonCardID")
	private String eduPersonCardID;
	
	@Attribute(name = "userPassword")
	private String userPassword;
	
	@Attribute(name = "otherPassword")
	private String otherPassword;

	public Name getId() {
		return id;
	}

	public void setId(Name id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getCommonName() {
		return commonName;
	}

	public void setCommonName(String commonName) {
		this.commonName = commonName;
	}

	

	public String getEduPersonCardID() {
		return eduPersonCardID;
	}

	public void setEduPersonCardID(String eduPersonCardID) {
		this.eduPersonCardID = eduPersonCardID;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getOtherPassword() {
		return otherPassword;
	}

	public void setOtherPassword(String otherPassword) {
		this.otherPassword = otherPassword;
	}

	


	
}
