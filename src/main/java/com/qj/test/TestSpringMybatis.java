package com.qj.test;

import com.qj.bean.Dept;
import com.qj.service.IDeptService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring/applicationContext.xml"})
public class TestSpringMybatis {

    Logger logger = Logger.getLogger(String.valueOf(TestSpringMybatis.class));
    @Autowired
    private IDeptService iDeptService;
    @Test
    public void test0(){
        List<Dept> deptList = iDeptService.findDeptList();
        for (Dept dept:deptList
             ) {
            logger.debug(dept);
        }

    }
}
