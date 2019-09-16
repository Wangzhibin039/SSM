package com.qj.service;

import com.qj.bean.Emp;

import java.util.List;

public interface IEmpService {
    public List<Emp> list();


    int deleteByPrimaryKey(Integer empno);

    int insertEmp(Emp emp);

    int findEmpByEmpno(Integer empno);

    int updateEmp(Emp emp);


    public  boolean swap(int oneside,int other) throws  Exception;
}
