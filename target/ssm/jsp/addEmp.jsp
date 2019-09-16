<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/7
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <!--1.导入css 和 js文件-->
    <!--layui:html/css/js的框架，简化三种的操作-->
    <%--${pageContext.reqeust.contextPath}:访问的项目名  /web --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" />

</head>

<body>

<ul class="layui-nav">
    <li class="layui-nav-item">
        <a href="">控制台<span class="layui-badge">9</span></a>
    </li>
    <li class="layui-nav-item">
        <a href="">个人中心<span class="layui-badge-dot"></span></a>
    </li>
    <li class="layui-nav-item">
        <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
        <dl class="layui-nav-child">
            <dd>
                <a href="javascript:;">修改信息</a>
            </dd>
            <dd>
                <a href="javascript:;">安全管理</a>
            </dd>
            <dd>
                <a href="javascript:;">退了</a>
            </dd>
        </dl>
    </li>
</ul>

<div class="layui-fluid">

    <div class="layui-row" style="margin-top: 20px;">

        <h2 align="center">添加员工</h2>
        <div class="layui-col-md-offset4 layui-col-md4">

            <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/emp/add" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">员工姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="ename" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">任职岗位</label>
                    <div class="layui-input-block">
                        <input type="text" name="job" required lay-verify="required" placeholder="请输入岗位" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">上级领导</label>
                    <div class="layui-input-block">
                        <select name="mgr" lay-verify="required">
                            <option value="">请选择领导</option>
                            <option value="1">大王</option>
                            <option value="2">小王</option>
                            <option value="3">0</option>
                            <option value="4">1</option>
                            <option value="5">2</option>
                            <option value="6">3</option>
                            <option value="7">4</option>
                            <option value="8">5</option>

                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">入职日期</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" id="test1" name="hiredate">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">薪资待遇</label>
                    <div class="layui-input-block">
                        <input type="text" name="sal" required lay-verify="required" placeholder="请输入薪资" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">所在部门</label>
                    <div class="layui-input-block">
                        <select name="deptno" lay-verify="required">
                            <option value=""></option>
                            <option value="0">北京</option>
                            <option value="1">上海</option>

                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>

        </div>

    </div>

</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form', 'element', 'laydate','jquery'], function() {
        var layer = layui.layer, //初始化
            form = layui.form,
            element = layui.element,
            laydate = layui.laydate,
            $ = layui.$;


        //加载mgr 上级信息
        $.get("${pageContext.request.contextPath}/emp/getMgr",function (reslut) {

            //清除原来的 option
            $("[name=mgr] option:not(:eq(0))").remove();

            $.each(reslut,function (index,emp) {
                var $option = $("<option value='"+emp.empno+"'>"+emp.ename+"</option>");
                console.log($option);
                $option.appendTo($("[name=mgr]"));
            })
            form.render('select'); //重新渲染，重新加载select 数据，不然不显示 (layui规定)
        },"json");

        //获取部分信息
        $.get("${pageContext.request.contextPath}/dept/list",function (reslut) {

            //清除原来的 option
            $("[name=deptno] option:not(:eq(0))").remove();

            $.each(reslut,function (index,dept) {
                var $option = $("<option value='"+dept.deptno+"'>"+dept.dname+"</option>");
                console.log($option);
                $option.appendTo($("[name=deptno]"));
            })

            form.render('select'); //重新渲染，重新加载select 数据，不然不显示 (layui规定)


        },"json");


        //日期控件
        laydate.render({
            elem: '#test1' //指定元素
        });
    });





</script>
</body>

</html>