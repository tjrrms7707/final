package final_project.kosta180.controller;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {

 @Inject
 private DataSource ds;
 
 @Test
 public void test()throws Exception {
  
  Connection con = ds.getConnection();
  
  System.out.println(con);
  
  con.close();
  
 }

}
