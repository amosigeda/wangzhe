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
	if(frmGo.createtime.value.trim() == ''){
		alert("���ڲ���Ϊ��");
		frmGo.createtime.focus();
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
<form name="frmGo" method="post" action="doLocationInfo.do?method=updateQuDaoInfo" onsubmit="return onUpdate()">
<input name="id" type="hidden" value="<%=dynamicInfo.getAt("id")%>" >
<table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11"> 
  <tr>
     <th colspan="13" nowrap="nowrap" align="left">
                    ��Ϣ�޸�
     </th>
   </tr>
   <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;����</td>
    <td width="20%" align="left">
    	<input name="createtime" id="createtime" type="text" class="txt_1" maxlength="20" value="<%=dynamicInfo.getAt("createtime")==null?" ":dynamicInfo.getAt("createtime")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��Ϸ����</td>
    <td width="20%" align="left">
    	<input name="gamename" id="gamename" type="text" class="txt_1" maxlength="20" value="<%=dynamicInfo.getAt("gamename")==null?" ":dynamicInfo.getAt("gamename")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
    <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;������</td>
    <td width="20%" align="left">
    	<input name="qudaonumber" id="qudaonumber" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("qudaonumber")==null?" ":dynamicInfo.getAt("qudaonumber")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
    <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;�����û�</td>
    <td width="20%" align="left">
    	<input name="insertuser" id="insertuser" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("insertuser")==null?" ":dynamicInfo.getAt("insertuser")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
   <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��Ծ�û�</td>
    <td width="20%" align="left">
    	<input name="liveuser" id="liveuser" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("liveuser")==null?" ":dynamicInfo.getAt("liveuser")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
     <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;�����û�</td>
    <td width="20%" align="left">
    	<input name="payuser" id="payuser" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("payuser")==null?" ":dynamicInfo.getAt("payuser")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
    <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;�����û�</td>
    <td width="20%" align="left">
    	<input name="payuser" id="payuser" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("payuser")==null?" ":dynamicInfo.getAt("payuser")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
    <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��Ӫ��ˮ(Ԫ)</td>
    <td width="20%" align="left">
    	<input name="runwater" id="runwater" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("runwater")==null?" ":dynamicInfo.getAt("runwater")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
      <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;����ARPU</td>
    <td width="20%" align="left">
    	<input name="payarpu" id="payarpu" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("payarpu")==null?" ":dynamicInfo.getAt("payarpu")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
      <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;��ԾARPU</td>
    <td width="20%" align="left">
    	<input name="livearpu" id="livearpu" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("livearpu")==null?" ":dynamicInfo.getAt("livearpu")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
      <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;������</td>
    <td width="20%" align="left">
    	<input name="payrate" id="payrate" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("payrate")==null?" ":dynamicInfo.getAt("payrate")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
     <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;����������</td>
    <td width="20%" align="left">
    	<input name="erkeep" id="erkeep" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("erkeep")==null?" ":dynamicInfo.getAt("erkeep")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
    <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;����������</td>
    <td width="20%" align="left">
    	<input name="sankeep" id="sankeep" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("sankeep")==null?" ":dynamicInfo.getAt("sankeep")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
  
    <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;����������</td>
    <td width="20%" align="left">
    	<input name="qikeep" id="qikeep" type="text" class="txt_1" maxlength="20" 
    	value="<%=dynamicInfo.getAt("qikeep")==null?" ":dynamicInfo.getAt("qikeep")%>"><font color="red">*</font>
    </td>
    <td align="left"><font></font></td>
  </tr>
 
  
  <tr  class="tr_11"> 
    <td></td>
    <td  align="left">&nbsp;&nbsp;&nbsp;<input type="button" name="ok" accesskey="y" tabindex="y"  value="ȷ ��" class="but_1" onclick="onUpdate()">
	
      <input type="button" name="back" accesskey="b" tabindex="b" value="�� ��" class="but_1" onclick="location='doLocationInfo.do?method=queryQuDaoInfo'">
       <input type="reset" name="back" accesskey="b" tabindex="b" value="����" class="but_1" >
    </td>	     
    </td>
    <td></td>
  </tr>
</table>
</form>
</body>
</html>