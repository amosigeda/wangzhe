<%@ page language="java" contentType="text/html;charset=GB2312"%>
<%@ page autoFlush="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%=request.getContextPath()%>/public/public.js"></script>
<title>�ޱ����ĵ�</title>
</head>
<script language="javascript">
var postContent = "";
function onAdd(){
	if(frm.roleName.value.trim() == ''){
		alert("��ɫ���Ʋ���Ϊ�գ�");
		frm.roleName.focus();
		return false;			 
	}

	frm.submit();
}
</script>
<body>
<span class="title_1"></span>
<form name="frm" method="post" action="doRoleInfo.do?method=insertRoleInfo" onsubmit="return onAdd()">
<input name="roleType" type="hidden" value="��ɫ">
<table width="100%"   class="tbl_11">
<tr>
<th colspan="13" nowrap="nowrap" align="left">
��ӽ�ɫ
</th>
</tr>
  <tr class="tr_11">
    <td align="right" width="7%">��ɫ����</td>
    <td><div align="left">
      <input name="roleName" type="text" class="txt_1"maxlength="20" />
    </div></td>
  </tr>
  <tr class="tr_11">
    <td align="right" width="7%">����</td>
    <td><div align="left">
      <textarea name="roleDesc" rows="3" cols="50" class="txt_1"></textarea>
    </div></td>
  </tr>
  <tr class="tr_11">
    <td></td>
    <td  colspan="2"><input type="button" name="ok"accesskey="y" tabindex="y"  value="ȷ ��" class="but_1" onclick="onAdd()" >
	
      <input type="button" name="back"accesskey="b" tabindex="b" value="�� ��" class="but_1" onclick="location='doRoleInfo.do?method=queryRoleInfo'">
    </td>
  </tr>
</table>
</form>
</body>
</html>
