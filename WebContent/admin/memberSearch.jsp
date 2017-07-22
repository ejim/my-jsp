<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="common.DBConnector"%>
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
    <h5><b><i class="fa fa-user"></i> 회원조회</b></h5>
  </header>
  <form name="member_info" method="post" action="memberInfoProc.jsp">
  <div class="w3-container">
    <h5>회원목록</h5>
    <table class="w3-table">
      <tr>
        <td>번호</td>
        <td>아이디</td>
        <td>이름</td>
        <td>성별</td>
        <td>가입일</td>
      </tr>      
      <%
      int pageBlock = 10;
      int pageSize = 10;
      int currPage = (request.getParameter("page") != null)? Integer.parseInt(request.getParameter("page")) : 1;
      int totalCount = 0;
      
      DBConnector connector = DBConnector.getInstance();
      Connection conn = connector.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
	      String sql = "";
	      sql += "  SELECT *";
	      sql += "  FROM (";
	      sql += "	  SELECT ROWNUM RNUM, A.*";
	      sql += "	  FROM (";
	      sql += "		  SELECT USER_ID, USER_NAME, USER_SEX, JOIN_DATE, COUNT(0) OVER() AS CNT";
	      sql += "		  FROM USERS";
	      sql += "		  WHERE 1 = 1";
	      sql += "		  AND (('ALL' = ? AND USER_ID = USER_ID) OR ('USER_ID' = ? AND USER_ID = ?))";
	      sql += "		  ORDER BY JOIN_DATE DESC";
	      sql += "	  ) A";
	      sql += "	  WHERE ROWNUM <= ? * ?";
	      sql += "  )";
	      sql += "  WHERE RNUM >= (? - 1) * ? + 1";
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, "ALL");
	      pstmt.setString(2, "ALL");
	      pstmt.setString(3, "zzzz");
	      pstmt.setInt(4, currPage);
	      pstmt.setInt(5, pageSize);
	      pstmt.setInt(6, currPage);
	      pstmt.setInt(7, pageSize);
      	  rs = pstmt.executeQuery();
      	  
      	  while(rs.next()) {
      %>	  
      <tr>
      	<td><%=rs.getInt("rnum")%></td>
        <td><a href="/admin/memberDetail.jsp?id=<%=rs.getString("user_id")%>"><%=rs.getString("user_id")%></a></td>
        <td><%=rs.getString("user_name")%></td>
        <td>
        	<%
        	switch(rs.getInt("user_sex")) {
	        	case 1: out.print("남");break;
	        	case 2: out.print("여");break;
	        	default: out.print("-");
        	}
        	%>       	
        <td>
        <td><%=rs.getString("join_date").substring(0, 10)%></td>
      </tr>
      <%
      		totalCount = rs.getInt("cnt");
      	  }
      } catch(Exception e) {
    	  e.printStackTrace();
      } finally {
    	  rs.close();
    	  pstmt.close();
    	  conn.close();
      }
      %>
    </table><br>
<!-- 페이징 -->
<%
int totalPage = (int)Math.ceil((double)totalCount/pageSize);
int startPage = (currPage / pageBlock) * pageBlock + 1;
int endPage = ((currPage / pageBlock) + 1) * pageBlock;

if(currPage % pageBlock == 0) {
	startPage = startPage - pageBlock;
	endPage = startPage + pageBlock - 1;
}
if(endPage > totalPage) endPage = totalPage;

if(totalPage > 0) {
	if(currPage > 1) {
%>
<a href="memberSearch.jsp?page=1">처음</a>
<%
	} else {
%>
처음
<%			
	}
	
	if(startPage > 1) {
%>
<a href="memberSearch.jsp?page=<%=startPage - 1%>">이전</a>
<%
	} else {
%>
이전
<%			
	}
	
	for(int i = startPage; i <= endPage; i++) {
		if(i == currPage) {
%>
<b><%=i%></b>
<%
		} else {
%>
<a href="memberSearch.jsp?page=<%=i%>"><%=i%></a>
<%			
		}			
	}
	
	if(endPage < totalPage) {
%>
<a href="memberSearch.jsp?page=<%=endPage + 1%>">다음</a>
<%
	} else {
%>
다음
<%			
	}
	
	if(currPage < totalPage) {
%>
<a href="memberSearch.jsp?page=<%=totalPage%>">맨끝</a>
<%
	} else {
%>
맨끝
<%			
	}
}
%>
  </div>
  </form>
        
<%@ include file="/common/footer.jsp"%>
  <!-- End page content -->
</div>

<script src="/js/sidebar_effect.js"></script>

</body>
</html>    
