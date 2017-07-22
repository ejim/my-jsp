<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@ include file="/common/header.jsp"%>
<body class="w3-light-grey">
<%@ include file="/common/top.jsp"%>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b><i class="fa fa-user"></i> 회원가입</b></h5>
  </header>
  
  <form name="member_join" method="post" action="memberJoinProc.jsp">
  <div class="w3-container">
    <h5>회원정보 입력</h5>
    <table class="w3-table">
      <tr>
        <td>아이디</td>
        <td><input class="w3-input" style="width:300px" type="text" name="user_id"></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input class="w3-input" style="width:300px" type="password" name="user_pwd"></td>
      </tr>
      <tr>
        <td>비밀번호 확인</td>
        <td><input class="w3-input" style="width:300px" type="password" name="user_pwd_cnfm"></td>
      </tr>
      <tr>
        <td>이름</td>
        <td><input class="w3-input" style="width:300px" type="text" name="user_name"></td>
      </tr>
      <tr>
        <td>성별</td>
        <td>
        	<input class="w3-radio" type="radio" name="user_sex" value="1"> 남자
        	<input class="w3-radio" type="radio" name="user_sex" value="2"> 여자
        </td>
      </tr>
      <tr>
        <td>생년월일</td>
        <td>
        	<select class="w3-select" style="width:100px" name="user_birth_year">
        		<c:set var="year" value="${2017}"/>
        		<option value="">년도</option>        		
        		<c:forEach var="i" begin="1900" end="${year}" step="1">
        		<option value="${year}">${year}</option>
        		<c:set var="year" value="${year-1}"/>
        		</c:forEach>
        	</select>
        	<select class="w3-select" style="width:100px" name="user_birth_month">
        		<option value="">월</option>
        		<c:forEach var="i" begin="1" end="12" step="1">        		
        		<option value="<fmt:formatNumber type="number" pattern="00" value="${i}"/>">${i}월</option>
        		</c:forEach>
        	</select>
        	<select class="w3-select" style="width:100px" name="user_birth_day">
        		<option value="">일</option>
        		<c:forEach var="i" begin="1" end="31" step="1">
        		<option value="<fmt:formatNumber type="number" pattern="00" value="${i}"/>">${i}</option>
        		</c:forEach>
        	</select>
        </td>
      </tr>
      <tr>
        <td>휴대폰번호</td>
        <td><input class="w3-input" style="width:300px" type="text" name="user_tel"></td>
      </tr>
      <tr>
        <td>이메일주소</td>
        <td><input class="w3-input" style="width:300px" type="text" name="user_email"></td>
      </tr>
    </table><br>
    <button class="w3-button w3-dark-grey" onclick="member_join.submit();">가입하기</button>
  </div>
  </form>

<%@ include file="/common/footer.jsp"%>
  <!-- End page content -->
</div>

<script src="/js/sidebar_effect.js"></script>

</body>
</html>
