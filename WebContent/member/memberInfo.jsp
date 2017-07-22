<%@ include file="/common/checkSession.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<%@ include file="/common/header.jsp"%>
<body class="w3-light-grey">
<%@ include file="/common/top.jsp"%>
<%@ include file="/common/sidebar.jsp"%>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b><i class="fa fa-user"></i> 회원정보</b></h5>
  </header>
  
  <form name="member_info" method="post" action="memberInfoProc.jsp">
  <div class="w3-container">
    <h5>회원정보 상세</h5>
    
	<sql:setDataSource var="db" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:orcl" user="scott" password="tiger"/>
	<sql:query var="result" dataSource="${db}">
		SELECT USER_NAME, USER_SEX, USER_BIRTH, USER_TEL, USER_EMAIL, JOIN_DATE
		FROM   USERS
		WHERE  USER_ID = ?
		<sql:param value="${sessionScope.user_id}"/>
	</sql:query>
	
    <c:forEach var="rs" items="${result.rows}">
    <table class="w3-table">
      <tr>
        <td>아이디</td>
        <td>${sessionScope.user_id}</td>
      </tr>
      <tr>
        <td>이름</td>
        <td>${rs.user_name}</td>
      </tr>
      <tr>
        <td>성별</td>
        <td>
        	<c:choose>
	        	<c:when test="${rs.user_sex == '1'}">남</c:when>
	        	<c:when test="${rs.user_sex == '2'}">여</c:when>
	        	<c:otherwise>-</c:otherwise>
        	</c:choose>        
        </td>
      </tr>
      <tr>
        <td>생년월일</td>
        <td>
        	<c:out value="${fn:substring(rs.user_birth, 0, 4)}"/>년
        	<c:out value="${fn:substring(rs.user_birth, 4, 6)}"/>월
        	<c:out value="${fn:substring(rs.user_birth, 6, 8)}"/>일
        </td>
      </tr>
      <tr>
        <td>휴대폰번호</td>
        <td><input class="w3-input" style="width:300px" type="text" name="user_tel" value="${rs.user_tel}"></td>
      </tr>
      <tr>
        <td>이메일주소</td>
        <td><input class="w3-input" style="width:300px" type="text" name="user_email" value="${rs.user_email}"></td>
      </tr>
      <tr>
        <td>가입일</td>
        <td>
        	<c:out value="${fn:substring(rs.join_date, 0, 4)}"/>년
        	<c:out value="${fn:substring(rs.join_date, 5, 7)}"/>월
        	<c:out value="${fn:substring(rs.join_date, 8, 10)}"/>일
        </td>
      </tr>
    </table><br>
    </c:forEach>
    <button class="w3-button w3-dark-grey" onclick="this.form.submit();">수정하기</button>
  </div>
  </form>
<%@ include file="/common/footer.jsp"%>
  <!-- End page content -->
</div>

<script src="/js/sidebar_effect.js"></script>

</body>
</html>
