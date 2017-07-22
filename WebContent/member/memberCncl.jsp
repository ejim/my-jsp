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
    <h5><b><i class="fa fa-user"></i> 회원탈퇴</b></h5>
  </header>
  <div class="w3-container w3-dark-grey w3-padding-32">
    <h5>탈퇴 안내</h5>
    <ul class="w3-ul w3-card-4 w3-white">
      <li class="w3-padding-16">
        <span class="w3-padding-16">회원 정보와 활동 내역이 모두 삭제됩니다.</span><br><br>
        <span class="w3-padding-16">탈퇴 이후에는 관련 정보를 다시 활성화할 수 없습니다.</span>
      </li>
    </ul><br>
    <span>
      탈퇴하시겠습니까? <input type="radio" name="option">예 <input type="radio" name="option">아니오
    </span><br><br>
    <button class="w3-button w3-red" onclick="location.href='/member/memberCnclProc.jsp';">탈퇴하기</button>
  </div>
<%@ include file="/common/footer.jsp" %>
  <!-- End page content -->
</div>

<script src="/js/sidebar_effect.js"></script>

</body>
</html>