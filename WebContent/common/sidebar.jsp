<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
boolean isMember = false;

if(session.getAttribute("user_id") != null) {
	isMember = true;
}
%>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>	
  <%if(isMember == true) {%>  
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <a href="/member/memberInfo.jsp"><img src="https://www.w3schools.com/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px"></a>
    </div>
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <a href="/member/memberInfo.jsp"><strong><%=session.getAttribute("user_name")%> </strong></a></span><br>
      <!-- <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a> -->
      <input class="w3-button w3-margin-top w3-green" type="button" value="로그아웃" onclick="location.href='/member/memberLogout.jsp';">
    </div>    
  </div>
  <%} else {%>
  <form name="member_login" method="post" action="/member/memberLogin.jsp">
  <div class="w3-container w3-center">
    <input class="w3-input" placeholder="아이디" type="text" name="user_id">
    <input class="w3-input" placeholder="비밀번호" type="password" name="user_pwd">
    <input class="w3-button w3-margin-top w3-green" type="button" value="로그인" onclick="member_login.submit();">&nbsp;
    <input class="w3-button w3-margin-top w3-dark-grey" type="button" value="회원가입" onclick="location.href='/member/memberJoin.jsp';">
  </div>
  </form>
  <%}%>
  <hr>
  
  <%if(request.getRequestURI().indexOf("/member/") > -1) {%>
  <div class="w3-container">
    <h5>회원정보</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <a href="/member/memberInfo.jsp" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-user fa-fw"></i>  정보 변경</a>
    <a href="/member/memberPwd.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  비밀번호 변경</a>
    <a href="/member/memberCncl.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  탈퇴</a>
    <!-- <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  Geo</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-diamond fa-fw"></i>  Orders</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bell fa-fw"></i>  News</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bank fa-fw"></i>  General</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i>  History</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br> -->
  </div>
  <%} %>
  
  <div class="w3-container">
    <h5>관리메뉴</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <a href="/admin/memberSearch.jsp" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-user fa-fw"></i>  회원조회</a>
    <!-- <a href="/member/memberPwd.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  비밀번호 변경</a>
    <a href="/member/memberCncl.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  탈퇴</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  Geo</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-diamond fa-fw"></i>  Orders</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bell fa-fw"></i>  News</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bank fa-fw"></i>  General</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i>  History</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br> -->
  </div>
  
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>