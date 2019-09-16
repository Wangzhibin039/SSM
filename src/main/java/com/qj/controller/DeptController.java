package com.qj.controller;

import com.qj.bean.Dept;
import com.qj.service.IDeptService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {

    Logger logger = Logger.getLogger(DeptController.class);

    @Autowired
    private IDeptService  iDeptService;


    @RequestMapping("/list")
    @ResponseBody
    public List<Dept> findDeptList(){
        List<Dept> deptList = iDeptService.findDeptList();
        logger.debug(deptList);
        return iDeptService.findDeptList();
    }



}
