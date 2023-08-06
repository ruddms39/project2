package com.lleek.web;

import javax.inject.Inject;
import javax.sql.DataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/resources/spring/*.xml"})
public class DBTest {
	
	@Inject
	private DataSource ds;
	
	@Test
	public void Test() throws Exception{
		ds.getConnection();
		System.out.println("DB Connection Complet");
	}
}
