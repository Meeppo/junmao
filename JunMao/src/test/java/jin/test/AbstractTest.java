package jin.test;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/config/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/config/root-context.xml"})
public class AbstractTest extends AbstractTransactionalJUnit4SpringContextTests{
	
}
