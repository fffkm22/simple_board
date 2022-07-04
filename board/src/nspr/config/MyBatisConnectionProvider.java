package nspr.config;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnectionProvider {
	private static SqlSessionFactory sqlSessionFactory;

	static {
		InputStream in = MyBatisConnectionProvider.class.getResourceAsStream("/mybatis-config.xml");
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
	}

	public static SqlSession getSession() {
		return sqlSessionFactory.openSession();
	}
}
