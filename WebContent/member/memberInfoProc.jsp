<%@ include file="/common/checkSession.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
request.setCharacterEncoding("utf-8");
request.setAttribute("user_ip", request.getLocalAddr());
%>
<sql:setDataSource var="db" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:orcl" user="scott" password="tiger"/>

<sql:transaction dataSource="${db}">
	<sql:update var="count">
		UPDATE USERS SET
			USER_TEL = ?,
			USER_EMAIL = ?
		WHERE USER_ID = ?
		<sql:param value="${param.user_tel}"/>
		<sql:param value="${param.user_email}"/>
		<sql:param value="${sessionScope.user_id}"/>
	</sql:update>		
	<sql:update>
		INSERT INTO USERS_HIST(
			USER_ID, OCCUR_CASE, OCCUR_DATE, OCCUR_IP
		) VALUES(
			?, ?, SYSDATE, ?
		)
		<sql:param value="${sessionScope.user_id}"/>
		<sql:param value="20"/>
		<sql:param value="${requestScope.user_ip}"/>
	</sql:update>
</sql:transaction>

<c:if test="${count > 0}">
	<script>alert("변경되었습니다.");</script>
</c:if>

<script>
	location.href="/member/memberInfo.jsp";
</script>