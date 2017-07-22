<%@ include file="/common/checkSession.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <h5><b><i class="fa fa-user"></i> 비밀번호 변경</b></h5>
  </header>
  <form name="member_pwd" method="post" action="memberPwdProc.jsp">
  <div class="w3-container">
    <h5>비밀번호 확인</h5>
    <table class="w3-table">
      <tr>
        <td>현재 비밀번호</td>
        <td><input class="w3-input" style="width:300px" type="password" name="user_pwd"></td>
      </tr>
      <tr>
        <td>변경할 비밀번호</td>
        <td><input class="w3-input" style="width:300px" type="password" name="mod_pwd"></td>
      </tr>
      <tr>
        <td>변경할 비밀번호 확인</td>
        <td><input class="w3-input" style="width:300px" type="password" name="mod_pwd_cofm"></td>
      </tr>
    </table><br>
    <button class="w3-button w3-dark-grey" onclick="this.form.submit();">변경하기</button>
  </div>
  </form>
<%@ include file="/common/footer.jsp"%>
  <!-- End page content -->
</div>

<script src="/js/sidebar_effect.js"></script>

</body>
</html>