<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ page autoFlush="true"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>�ޱ����ĵ�</title>
		<link href="<%=request.getContextPath()%>/css/tbls.css"
			rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/public.js"></script>   <!-- ���ô˷��� -->
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>
	</head>
	<script type="text/javascript">
		function add(){
			if(frmGo.IDCode.value.trim() == ""){
				alert("ʶ���벻��Ϊ��,����������");
				frmGo.IDCode.focus();
				return false;
			}
			frmGo.action="doCheckInfo.do?method=addIDCode";
			frmGo.submit();
		}
	</script>
	<body>
		<br><span class="title_1"></span>
<form name="frmGo" method="post" action="doCheckInfo.do?method=addIDCode" onsubmit="return onAdd()">
  	<table> 		
  		<tr>
  			<td>ʶ����:</td>
  			<td><input type="text" name="IDCode" id="IDCode"/>
  				<font style="color:red">*(��ʽΪ����Ŀ@����@ǩ��)</font>
  			</td> 			
  		</tr>  		
  		<tr></tr>
  	</table>
  	
    <input type="button" name="back"accesskey="b" tabindex="b" value="�� ��" class="but_1" onclick="location='doCheckInfo.do?method=queryCheckInfo'"  style="font-size:12;width:50px;height:21px;">
	<input type="button" name="ok"accesskey="y" tabindex="y"  value="ȷ��" class="but_1" onclick="add()" style="font-size:12;width:50px;height:21px;" >
</form>
	</body>
</html>