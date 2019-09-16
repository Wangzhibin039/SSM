package com.qj.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qj.bean.Emp;
import com.qj.service.IEmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/emp")
public class EmpController {


    @Autowired
    private IEmpService iEmpService;


    @RequestMapping("/list")
    public String list(@RequestParam(defaultValue = "1",value = "page") int page, @RequestParam(defaultValue = "5",value = "pageSize")int pageSize, Model model) {

        //分页插件
        PageHelper.startPage(page,pageSize);
        List<Emp> list = iEmpService.list();



        //PageInfo:包含了分页当中需要的数据
        PageInfo<Emp> pageInfo = new PageInfo<>(list);

        model.addAttribute("pageInfo", pageInfo);


        //前缀和后缀
        return "main";
    }


    @RequestMapping("/del")
    public String del(Integer empno){

        int row =  iEmpService.deleteByPrimaryKey(empno);

        //重定向到指定的地址
        return "redirect:/emp/list";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(Emp emp){
        int row =  iEmpService.insertEmp(emp);
        //重定向到指定的地址
        return "redirect:/emp/list";
    }


//    @RequestMapping("/{empno}")
//    public String findDeptByKey(@PathVariable("empno") Integer empno, Model model) {
//        int emp = iEmpService.findEmpByEmpno(empno);
//        model.addAttribute("emp",emp);
//        return "updateEmp";
//    }

    @RequestMapping("/{empno}")
    public String list(@PathVariable("empno") Integer empno, Model model) {
        int emp = iEmpService.findEmpByEmpno(empno);
        model.addAttribute("emp",emp);
        return "updateEmp";
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Emp emp) {
        int row = iEmpService.updateEmp(emp);
        //重定向到指定的地址
        return "redirect:/emp/list";
    }


    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        //转换日期格式
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //注册自定义的编辑器
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));

    }

    @RequestMapping("/swap")
    @ResponseBody
    public boolean swap( int oneside, int other) throws Exception {

        boolean swap = iEmpService.swap(oneside, other);

        return swap;
    }
















}
