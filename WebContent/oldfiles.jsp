<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

</head>

<body>
	<table>
		<tr>
			<td width="10">&nbsp;</td>
			<td><a href="national" target="textD">National Tally</a></td>
			<td width="10">&nbsp;</td>
		</tr>
		<tr>
			<td width="10">&nbsp;</td>
			<td><a href="newselectstate.jsp" target="textD">State Tally</a></td>
			<td width="10">&nbsp;</td>
		</tr>
		<tr>
			<td width="10">&nbsp;</td>
			<td><a href="shownationaldata" target="textD">National
					Tally_Old</a></td>
			<td width="10">&nbsp;</td>
		</tr>
		<tr>
			<td width="10">&nbsp;</td>
			<td><a href="selectstate.jsp" target="textD">State Tally_Old</a></td>
			<td width="10">&nbsp;</td>
		</tr>
		<tr>
			<td width="10">&nbsp;</td>
			<td><a href="nationalmaster.jsp" target="textD">National
					Tally Master</a></td>
			<td width="10">&nbsp;</td>
		</tr>
	</table>
</body>
</html>
