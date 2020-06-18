package pwReset;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class,HibernateJpaAutoConfiguration.class})
@PropertySource("classpath:common.properties")
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class PasswordResetApplication {

	
	  public static void main(String[] args) { 
	  SpringApplication.run(PasswordResetApplication.class, args);
	  
	  }
	 

}
