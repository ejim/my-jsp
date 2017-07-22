<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
request.setCharacterEncoding("utf-8");
request.setAttribute("user_ip", request.getLocalAddr());
%>
<sql:setDataSource var="db" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:orcl" user="scott" password="tiger"/>
<sql:query var="result" dataSource="${db}">
	SELECT USER_ID, USER_PWD, USER_NAME FROM USERS WHERE USER_ID = ?
	<sql:param value="${param.user_id}"/>
</sql:query>

<c:forEach var="rs"	items="${result.rows}">
	<c:if test="${rs.user_pwd == param.user_pwd}">
		<c:set var="user_id" value="${rs.user_id}"/>
		<c:set var="user_name" value="${rs.user_name}"/>
		<%
		session.setAttribute("user_id", pageContext.getAttribute("user_id"));
		session.setAttribute("user_name", pageContext.getAttribute("user_name"));
		%>
		<sql:update dataSource="${db}">
			INSERT INTO USERS_HIST(
				USER_ID, OCCUR_CASE, OCCUR_DATE, OCCUR_IP
			) VALUES(
				?, ?, SYSDATE, ?
			)
			<sql:param value="${rs.user_id}"/>
			<sql:param value="11"/>
			<sql:param value="${requestScope.user_ip}"/>
		</sql:update>
		<c:redirect url="/main.jsp"/>
	</c:if>
</c:forEach>

<script>
	alert("아이디 또는 비밀번호가 정확하지 않습니다.");
	history.back();
</script>