package com.qj.service.impl;

import com.qj.bean.Dept;
import com.qj.mapper.DeptMapper;
import com.qj.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements IDeptService{

    @Autowired
    private DeptMapper deptMapper;

    @Override
    public List<Dept> findDeptList() {
        return deptMapper.findDeptList();
    }
}
