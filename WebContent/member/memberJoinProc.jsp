<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
request.setCharacterEncoding("utf-8");
request.setAttribute("user_ip", request.getLocalAddr());
%>
<sql:setDataSource var="db" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:orcl" user="scott" password="tiger"/>

<sql:query var="result" dataSource="${db}">
	SELECT USER_ID FROM USERS WHERE USER_ID = ?
	<sql:param value="${fn:trim(param.user_id)}"/>
</sql:query>

<c:choose>
	<c:when test="${empty result.rows}">
		<sql:transaction dataSource="${db}">
			<sql:update var="count">
				INSERT INTO USERS(
					USER_ID, USER_PWD, USER_NAME, USER_SEX, USER_BIRTH, USER_TEL, USER_EMAIL, JOIN_DATE, JOIN_IP
				) VALUES (
					?, ?, ?, ?, ?, ?, ?, SYSDATE, ?
				)
				<sql:param value="${fn:trim(param.user_id)}"/>
				<sql:param value="${fn:trim(param.user_pwd)}"/>
				<sql:param value="${fn:trim(param.user_name)}"/>
				<sql:param value="${param.user_sex}"/>
				<sql:param value="${param.user_birth_year + param.user_birth_month + param.user_birth_day}"/>
				<sql:param value="${fn:trim(param.user_tel)}"/>
				<sql:param value="${fn:trim(param.user_email)}"/>
				<sql:param value="${requestScope.user_ip}"/>
			</sql:update>
			<sql:update>
				INSERT INTO USERS_HIST(
					USER_ID, OCCUR_CASE, OCCUR_DATE, OCCUR_IP
				) VALUES(
					?, ?, SYSDATE, ?
				)
				<sql:param value="${fn:trim(param.user_id)}"/>
				<sql:param value="10"/>
				<sql:param value="${requestScope.user_ip}"/>
			</sql:update>					
		</sql:transaction>
		
		<c:if test="${count > 0}">
			<script>alert("가입되었습니다.");</script>
		</c:if>
		
		<script>
			location.href="/main.jsp";
		</script>	
	</c:when>
	<c:otherwise>
		<script>
			alert("해당 아이디는 이미 가입되어 있습니다.");
			history.back();
		</script>
	</c:otherwise>
</c:choose>
