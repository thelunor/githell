<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Tomcat Connection Pool</title>
</head>
<body>
<%
	Connection conn =null;
	
	Context context = new InitialContext(); //���� �� ������Ʈ���� �̸� ��� �˻� : naming
	DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/oracle"); //������ ����� �����ڵ� ���� ��� : java:comp/env/ + name 
	
	//POOL�ȿ��� connection ������ ����  -> context.xml����
	conn=ds.getConnection();
	
	out.print("db ���� ���� : " + conn.isClosed()+"<br>");
	//db ����Ȯ���� project�Ҷ� ���� �������� ���� ������ �۾��ϱ� 
	//POINT
	//POOL�� connection ��ȯ�ϱ�
	conn.close(); //���� close�� ���� ���� ������ ���⼭�� ��ȯ�ϴ� ���
	
	out.print("db ���� ���� : " + conn.isClosed()+"<br>");

%>
</body>
</html>






