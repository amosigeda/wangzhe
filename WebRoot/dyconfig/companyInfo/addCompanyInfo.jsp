<%@ page language="java" contentType="text/html;charset=GB2312"%>
<%@ page autoFlush="true" %>
<%@ page import="com.care.app.LoginUser"%>
<%@ page import="com.care.common.config.Config"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%=request.getContextPath()%>/public/public.js"></script>
<title>�ޱ����ĵ�</title>
</head>
<script language="javascript">
function onAdd(){
	if(frmGo.companyNo.value.trim() == ""){
		alert("��˾��Ų���Ϊ�գ�����������");
		frmGo.companyNo.focus();
		return false;
	}
	if(frmGo.companyName.value.trim() == ""){
		alert("��˾���Ʋ���Ϊ�գ�����������");
		frmGo.companyName.focus();
		return false;
	}
	frmGo.submit();
}

</script>
<body>
<span class="title_1"></span>
<form name="frmGo" method="post" action="doCompanyInfo.do?method=insertCompanyInfo" onsubmit="return onAdd()">
<% LoginUser loginUser = (LoginUser)request.getSession().getAttribute(Config.SystemConfig.LOGINUSER);
	String loginUserCode = loginUser.getUserCode();
%>
<!-- <input type="hidden" name="addUser" value="<%=loginUserCode %>"> -->
<table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11">
  <tr>
        <th colspan="3" nowrap="nowrap" align="left">
                                    ��ӿͻ�
        </th>
       </tr>
  <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;���</td>
    <td align="left" width="20%" colspan="2">
      <input name="companyNo" id="companyNo" type="text" class="txt_1"maxlength="20"/><font color="red">*����˾Ӣ����ĸ��д��</font>
    </td>
    </tr>
      <!--  <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;�˻�</td> 
    <td align="left" width="20%" colspan="2">
		<%=request.getAttribute("usersList")%><font color="red">*</font>
    </td>
  </tr> -->
   <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;��˾��</td>
    <td align="left" width="20%" colspan="2">
      <input name="companyName" type="text" class="txt_1"maxlength="20"><font color="red">*</font>
    </td>
  </tr>
    
  <!-- <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;�ƹ�����</td>  
    <td>
    <%int i=0; %>
    <logic:iterate id="element" name="list">
    	<%i++; 
    	if(i%5==1 && i!=1){%>
    	<br/>
    	<%} %>
    	<input type="checkbox" id='channel'<bean:write name="element" property="id"/> name='channel' value=<bean:write name="element" property="id"/> />
    	<bean:write name="element" property="channel_name" />
    	
    </logic:iterate>
    </td>
    
  </tr> -->
  <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;��ע</td>
    <td align="left" width="20%">
      <textarea name="remark" id="remark" rows="5" cols="50" class="txt_1"></textarea>
    </td>
    <td><font color="red">���������ܳ���30�֣�</font></td>
  </tr>
  <tr class="tr_11">
  	<td></td><td></td>
  </tr>
  <tr class="tr_11">
  <td width="7%"></td>
    <td align="left" colspan="2">&nbsp;&nbsp;&nbsp;<input type="button" name="ok"accesskey="y" tabindex="y"  value="ȷ ��" class="but_1" onclick="onAdd()" style="font-size:12;width:40px;height:21px;">
      <input type="button" name="back"accesskey="b" tabindex="b" value="�� ��" class="but_1" onclick="location='doCompanyInfo.do?method=queryCompanyInfo'" style="font-size:12;width:40px;height:21px;">
  
    </td>
  </tr>
</table>
</form>
</body>
</html>