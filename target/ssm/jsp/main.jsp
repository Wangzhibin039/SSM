<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/7
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <!--1.导入css 和 js文件-->
    <!--layui:html/css/js的框架，简化三种的操作-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>

</head>

<body>

<ul class="layui-nav">
    <li class="layui-nav-item">
        <a href="">控制台<span class="layui-badge">99+</span></a>
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
                <a href="#">退了</a>
            </dd>
        </dl>
    </li>
</ul>

<div class="layui-fluid">

    <h2 align="center" style="margin-top: 20px;">员工列表</h2>
    <div class="layui-row" style="margin-top: 20px;">
        <div class="layui-col-md-offset2 layui-col-md8">
            <div class="layui-btn-group">
                <a href="${pageContext.request.contextPath}/jsp/addEmp.jsp" class="layui-btn"> <i class="layui-icon">&#xe654;</i>增加</a>
                <button class="layui-btn"><i class="layui-icon">&#xe642;</i>编辑</button>
                <button class="layui-btn"><i class="layui-icon">&#xe640;</i>删除</button>
            </div>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-col-md-offset2 layui-col-md8">
            <table class="layui-table">
                <thead>
                <th><input type="checkbox" name="all"></th>
                <th>序号</th>
                <th>id</th>
                <th>姓名</th>
                <th>岗位</th>
                <th>上级</th>
                <th>工资</th>
                <th>入职日期</th>
                <th>部门编号</th>
                <th colspan="2">操作</th>
                </thead>
                <tbody>

                <%--pageBean.data: data属性给的类型就是list --%>
                <c:forEach items="${pageInfo.list}" var="emp" varStatus="vs">
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>${vs.index+1}</td>
                        <td class="index">${emp.empno}
                        </td>
                        <td>${emp.ename}
                        </td>
                        <td>${emp.job}
                        </td>
                        <td>${emp.mgr}
                        </td>
                        <td>${emp.sal}
                        </td>
                        <td>${emp.hiredate}
                        </td>
                        <td>${emp.deptno}
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/emp/${emp.empno}" class="layui-btn layui-btn-xs">修改</a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/emp/del?empno=${emp.empno}" class="layui-btn layui-btn-xs layui-btn-danger" name="del">删除</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <div class="layui-row" style="margin-top: 20px;">
        <div class="layui-col-md-offset2 layui-col-md8">
            <div class="layui-btn-group">

                <%--自己完成：上一页和下一页--%>
                <button class="layui-btn layui-btn-radius layui-btn-primary">上一页</button>

                <%--分页页码--%>
                <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                    <%--判断是否是 当前页  需要高亮,有选中的按钮 --%>
                    <c:if test="${i==pageInfo.pageNum}">
                        <a href="${pageContext.request.contextPath}/emp/list?page=${i}&pageSize=${pageInfo.pageSize}" class="layui-btn layui-btn-radius ">${i}</a>
                    </c:if>
                    <c:if test="${i!=pageInfo.pageNum}">
                        <a href="${pageContext.request.contextPath}/emp/list?page=${i}&pageSize=${pageInfo.pageSize}" class="layui-btn layui-btn-radius layui-btn-primary">${i}</a>
                    </c:if>
                </c:forEach>
                <button class="layui-btn layui-btn-radius layui-btn-primary">下一页</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form', 'element', 'jquery'], function () {
        var layer = layui.layer, //初始化
            form = layui.form,
            $ = layui.$,
            element = layui.element;

        $("a[name=del]").click(function () {
            //当前点击的this
            var mynode = $(this); //避免和layui中的this冲突
            layer.confirm('是否删除?', {icon: 3, title: '提示'}, function (index) {
                //指向layui中的this,不能直接使用this
                //console.log($(this));
                // console.log(mynode);
                var empno = mynode.parents("tr").children(":eq(2)").html(); //需要删除的empno

                $.get("${pageContext.request.contextPath}/emp/delete?empno=" + empno, function (reslut) {
                    //reslut 数据库返回的影响行数
                    if (reslut > 0) {
                        mynode.parents("tr").remove(); //服务器删除成功，页面中整条记录删除
                    } else {
                        layer.alert("删除失败!!"); //提示
                    }

                });
                layer.close(index); //关闭弹框
            });

        });


        //layer.msg('Hello World');
        /*layer.msg('hello', {
            time: 1000
        });
        layer.msg('有表情地提示', {
            icon: 6
        });

        layer.msg('关闭后想做些什么', function() {
            //do something
            console.log("1234");
        });*/
    });
</script>
</body>

</html>
