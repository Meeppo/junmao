package jin.service.email;

import jin.dao.email.EmailDaoI;
import jin.model.Email;
import jin.service.base.BaseService;

import org.springframework.stereotype.Service;

@Service
public class EmailService extends BaseService<Long, Email, EmailDaoI> implements
		EmailServiceI {


}
