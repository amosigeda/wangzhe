<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import = "com.godoing.rose.http.common.*" %>
<%@ page import = "com.godoing.rose.lang.*" %>

<jsp:useBean id = "dynamicInfo" scope = "request"  class = "com.godoing.rose.lang.DataMap"/>
<%@ page autoFlush="true" %>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%=request.getContextPath()%>/public/public.js"></script>
<title>�ޱ����ĵ�</title>
</head>
<script language="javascript">
function onUpdate(){
	if(frmGo.name.value.trim() == ''){
		alert("�ǳƲ���Ϊ��");
		frmGo.nc_name.focus();
		return false;
	}
	/* if(frmGo.mName.value.trim().length > 10){
		alert("�������ܳ���10��");
		frmGo.remark.focus();
		return false;
	}
	if(frmGo.m_describe.value.trim().length > 30){
		alert("�������ܳ���30��");
		frmGo.m_describe.focus();
		return false;
	} */
	frmGo.submit();
}


</script>
<body>
<span class="title_1"></span>
<form name="frmGo" method="post" action="doDynamicInfo.do?method=updateDynamicInfo" onsubmit="return onUpdate()">
<input name="id" type="hidden" value="<%=dynamicInfo.getAt("id")%>" >
<table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11"> 
  <tr>
     <th colspan="13" nowrap="nowrap" align="left">
                          ��̬�˵������޸�
     </th>
   </tr>
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;�ǳ�</td>
    <td width="20%" align="left">
    	<input name="name" id="name" type="text" class="txt_1" maxlength="20" value="<%=dynamicInfo.getAt("nc_name")==null?" ":dynamicInfo.getAt("nc_name")%>"><font color="red">*</font>
    </td>
    <td align="left"><font>(�������ܳ���10��)</font></td>
  </tr>
 
   <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;Ӣ����</td>
    <td width="20%" align="left">
    	<input name="mName" id="mName" type="text" class="txt_1" maxlength="20" value="<%=dynamicInfo.getAt("mName")==null?" ":dynamicInfo.getAt("mName")%>"><font color="red">*</font>
    </td>
  </tr>
   <tr class="tr_11">
    <td width="7%" align="left">�ϼ��˵�����</td>
    <td width="20%" align="left">
    	<input name="superId" id="superId" type="text" class="txt_1" maxlength="20" value="<%=dynamicInfo.getAt("superId")==null?" ":dynamicInfo.getAt("superId")%>"><font color="red">*</font>
    </td>
  </tr>
   <tr class="tr_11">
    <td width="7%" align="left">&nbsp;�˵��ȼ�</td>
    <td width="20%" align="left">
    	<input name="menuLeave" id="menuLeave" type="text" class="txt_1" maxlength="20" value="<%=dynamicInfo.getAt("menuLeave")==null?" ":dynamicInfo.getAt("menuLeave")%>"><font color="red">*</font>
    </td>
  </tr>
   <tr class="tr_11">
    <td width="7%" align="left">&nbsp;�˵�����</td>
    <td width="20%" align="left">
    	<input name="menuRank" id="menuRank" type="text" class="txt_1" maxlength="20" value="<%=dynamicInfo.getAt("menuRank")==null?" ":dynamicInfo.getAt("menuRank")%>"><font color="red">*</font>
    </td>
  </tr>
  <%--  <tr class="tr_11">
    <td width="7%" align="left">�Ӳ˵� ����</td>
    <td width="20%" align="left">
    	<input name="submenuNumber" id="submenuNumber" type="text" class="txt_1" maxlength="20" value="<%=dynamicInfo.getAt("submenuNumber")==null?" ":dynamicInfo.getAt("submenuNumber")%>"><font color="red">*</font>
    </td>
  </tr> --%>
 <%--   <tr class="tr_11">
    <td width="7%" align="left"> &nbsp;�Ƿ���Ч</td>
    <td width="20%" align="left">
    	<input name="effect" id="effect" type="text" class="txt_1" maxlength="20" value="<%=dynamicInfo.getAt("effect")==null?" ":dynamicInfo.getAt("effect")%>"><font color="red">*</font>
    </td>
  </tr> --%>
   <tr class="tr_11">
    <td width="7%" align="left">&nbsp;�Ƿ���Ч</td>
    <td width="20%" align="left">
    	<input name="effect" type="radio" class="txt_1" value="0" <%=dynamicInfo.getAt("effect").equals("0")? "checked":"" %>>��
    	<input name="effect" type="radio" class="txt_1" value="1" <%=dynamicInfo.getAt("effect").equals("1")? "checked":"" %> >��
    </td>
    <td align="left"></td>
  </tr>
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;����</td>
    <td width="20%" align="left">
      <textarea name="describe" id="describe" rows="5" cols="30" class="txt_1" maxlength="30"><%=dynamicInfo.getAt("m_describe")==null?" ":dynamicInfo.getAt("m_describe")%></textarea>
    </td>
    <td align="left">(�������ܳ���30��)</font></td>
  </tr>
  <tr  class="tr_11"> 
    <td></td>
    <td  align="left">&nbsp;&nbsp;&nbsp;<input type="button" name="ok" accesskey="y" tabindex="y"  value="ȷ ��" class="but_1" onclick="onUpdate()">
	
      <input type="button" name="back" accesskey="b" tabindex="b" value="�� ��" class="but_1" onclick="location='doDynamicInfo.do?method=queryDynamicInfo'">
       <input type="reset" name="back" accesskey="b" tabindex="b" value="����" class="but_1" >
    </td>	     
    </td>
    <td></td>
  </tr>
</table>
</form>
</body>
</html>