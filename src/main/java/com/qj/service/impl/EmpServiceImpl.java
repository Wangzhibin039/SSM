package com.qj.service.impl;

import com.qj.bean.Emp;
import com.qj.mapper.EmpMapper;
import com.qj.service.IEmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements IEmpService {
    @Autowired
    private EmpMapper empmapper;

    @Override
    public List<Emp> list() {


        List<Emp> list = empmapper.list();
        return list;
    }



    @Override
    public int deleteByPrimaryKey(Integer empno) {
        return empmapper.deleteByPrimaryKey(empno);
    }

    @Override
    public int insertEmp(Emp emp) {
        return empmapper.insert(emp);
    }

    @Override
    public int findEmpByEmpno(Integer empno) {
        return empmapper.updateByPrimaryKeySelective(empno);
    }

    @Override
    public int updateEmp(Emp emp) {
        return empmapper.updateByPrimaryKey(emp);
    }

    @Override
    public boolean swap(int oneside, int other) throws Exception {

        int variation=1000;

        Emp onesideemp = empmapper.selectByPrimaryKey(oneside);
        onesideemp.setSal(onesideemp.getSal()-variation);
        empmapper.updateByPrimaryKey(onesideemp);

        Emp otheremp = empmapper.selectByPrimaryKey(other);
        otheremp.setSal(otheremp.getSal()+variation);
        empmapper.updateByPrimaryKey(otheremp);

        return true;
    }


}
