<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
request.setAttribute("user_ip", request.getLocalAddr());
%>
<sql:setDataSource var="db" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:orcl" user="scott" password="tiger"/>

<sql:update dataSource="${db}">
	INSERT INTO USERS_HIST(
		USER_ID, OCCUR_CASE, OCCUR_DATE, OCCUR_IP
	) VALUES(
		?, ?, SYSDATE, ?
	)
	<sql:param value="${sessionScope.user_id}"/>
	<sql:param value="12"/>
	<sql:param value="${requestScope.user_ip}"/>
</sql:update>
<%
session.invalidate();
%>
<c:redirect url="/main.jsp"/>