package jin.dao.email;

import jin.base.hibernate.dao.BaseDao;
import jin.model.Email;

import org.springframework.stereotype.Repository;

@Repository
public class EmailDao extends BaseDao<Long, Email> implements EmailDaoI {


}
