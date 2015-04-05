package jin.service.mail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jin.model.Email;
import jin.service.email.EmailServiceI;
import jin.test.AbstractTest;
@RunWith(SpringJUnit4ClassRunner.class)
public class EmailServiceTests extends AbstractTest{
	
	@Autowired
	private EmailServiceI emailservice;
	
	@Test
	public void add(){
		try {
			emailservice.add(new Email());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
