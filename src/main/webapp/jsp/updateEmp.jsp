<%--
  Created by IntelliJ IDEA.
  User: wangzhibin
  Date: 2019/9/2
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改</title>

    <style>
        p{
            text-align: center;
        }
    </style>

    <script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script>
        $(function () {

            $.get("${pageContext.request.contextPath}/dept/list",function (result) {

                $("[name=deptno]").empty();

                $.each(result,function (index,dept) {
                    var mydeptno = '${emp.deptno}';
                    if(mydeptno == dept.deptno) {
                        var op = "<option value='" + dept.deptno + "' selected>" + dept.dname + "</option>";
                        $("[name=deptno]").append($(op));
                    }else
                    {
                        var op = "<option value='" + dept.deptno + "'>" + dept.dname + "</option>";
                        $("[name=deptno]").append($(op));
                    }

//                    $("[name=deptno]").append($(op));
                });
            },"json")

        })
    </script>

</head>
<body style="background-color: cornsilk">


<%--<form action="${pageContext.request.contextPath}/update" method="post">--%>

    <form action="${pageContext.request.contextPath}/emp/update" method="post">
        <p>员工编号:<input type="text" name="empno" readonly value="${emp.empno}"/></p>
        <p>员工姓名:<input type="text" name="ename" value="${emp.ename}"/></p>
        <p>员工岗位:<input type="text" name="job" value="${emp.job}"/></p>
        <p>员工上级:<input type="text" name="mgr" value="${emp.mgr}" /></p>
        <p>员工薪资:<input type="text" name="sal" value="${emp.sal}" /></p>
        <p>入职日期:<input type="text" name="hiredate" value="${emp.hiredate}" /></p>
        <p>部门编号:<select name="deptno"></select></p>
        <p><input type="submit" value="确认修改" /></p>
    </form>


<%--</form>--%>
</body>
</html>
