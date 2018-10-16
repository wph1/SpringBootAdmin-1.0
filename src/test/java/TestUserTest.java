import com.geekcattle.Application;
import com.geekcattle.mapper.UserTestMapper;
import com.geekcattle.model.UserTest;
import com.geekcattle.service.UserTestServiceImpl;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import redis.clients.jedis.JedisPool;

import java.util.logging.SimpleFormatter;


@RunWith(SpringJUnit4ClassRunner.class) // SpringJUnit支持，由此引入Spring-Test框架支持！
@SpringBootTest(classes = Application.class)
@WebAppConfiguration // 由于是Web项目，Junit需要模拟ServletContext，因此我们需要给我们的测试类加上@WebAppConfiguration。
public class TestUserTest extends TestCase {

    private static Logger logger = LoggerFactory.getLogger(TestUserTest.class);

    @Autowired
    JedisPool jedisPool;

    @Autowired
    RedisTemplate<String, String> redisTemplate;
    @Autowired
   private UserTestServiceImpl userTestService;
    //测试添加
    @Test
    public static void testSelect() {
        UserTest test= new UserTest();
        test.setName("王鹏豪");
        test.setPassword("123456");
        test.setAddress("中国河南");
//        SimpleFormatter sdf = new SimpleFormatter();
//        String dateString = sdf.format(new Date());
//        test.setCreateDate();
//
//        userTestService.insert();


    }


}
