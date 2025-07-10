<%@ page language="java" session="true" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp?msg=loggedout");
%>