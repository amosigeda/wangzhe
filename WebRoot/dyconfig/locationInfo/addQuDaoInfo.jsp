<%@ page language="java" contentType="text/html;charset=GB2312"%>
<%@ page autoFlush="true"%>
<%@ page import="com.care.app.LoginUser"%>
<%@ page import="com.care.common.config.Config"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet"
	type="text/css">
<script language="JavaScript"
	src="<%=request.getContextPath()%>/public/public.js"></script>
<title>�ޱ����ĵ�</title>
</head>
<script language="javascript">
function onAdd(){
	frmGo.submit();
}

</script>
<body>
	<span class="title_1"></span>
	<form name="frmGo" method="post"
		action="doLocationInfo.do?method=insertQuDaoInfo"
		onsubmit="return onAdd()">
		<% LoginUser loginUser = (LoginUser)request.getSession().getAttribute(Config.SystemConfig.LOGINUSER);
	String loginUserCode = loginUser.getUserCode();
%>
		<!-- <input type="hidden" name="addUser" value="<%=loginUserCode %>"> -->
		<table width="100%" border="0" cellpadding="0" cellspacing="1"
			class="tbl_11">
			<tr>
				<th colspan="3" nowrap="nowrap" align="left">�����Ϣ</th>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;����</td>
				<td align="left" width="20%" colspan="2"><input
					name="createtime" id="createtime" type="text" class="txt_1"
					maxlength="20" /><font color="red">*</font></td>
			</tr>

			
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;��Ϸ����</td>
				<td align="left" width="20%" colspan="2"><input name="gamename"
					id="gamename" type="text" class="txt_1" maxlength="20">
					<font color="red">*</font></td>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;������</td>
				<td align="left" width="20%" colspan="2"><input
					name="qudaonumber" id="qudaonumber" type="text" class="txt_1"
					maxlength="20"><font color="red">*</font></td>
			</tr>

			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;�����û�</td>
				<td align="left" width="20%" colspan="2"><input
					name="insertuser" id="insertuser" type="text" class="txt_1"
					maxlength="20"><font color="red">*</font></td>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;��Ծ�û�</td>
				<td align="left" width="20%" colspan="2"><input name="liveuser"
					id="liveuser" type="text" class="txt_1" maxlength="20"><font color="red">*</font></td>
			</tr>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;�����û�</td>
				<td align="left" width="20%" colspan="2"><input name="payuser"
					id="payuser" type="text" class="txt_1" maxlength="20"><font color="red">*</font></td>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;��Ӫ��ˮ(Ԫ)</td>
				<td align="left" width="20%" colspan="2"><input name="runwater"
					id="runwater" type="text" class="txt_1" maxlength="20"><font color="red">*</font></td>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;����ARPU</td>
				<td align="left" width="20%" colspan="2"><input name="payarpu"
					id="payarpu" type="text" class="txt_1" maxlength="20"><font color="red">*</font></td>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;��ԾARPU</td>
				<td align="left" width="20%" colspan="2"><input name="livearpu"
					id="livearpu" type="text" class="txt_1" maxlength="20"><font color="red">*</font></td>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;������</td>
				<td align="left" width="20%" colspan="2"><input name="payrate"
					id="payrate" type="text" class="txt_1" maxlength="20"><font color="red">*</font></td>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;����������</td>
				<td align="left" width="20%" colspan="2"><input name="erkeep"
					id="erkeep" type="text" class="txt_1" maxlength="20"><font color="red">*</font></td>
			</tr>
			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;����������</td>
				<td align="left" width="20%" colspan="2"><input name="sankeep"
					id="sankeep" type="text" class="txt_1" maxlength="20"><font color="red">*</font></td>
			</tr>

			<tr class="tr_11">
				<td align="left" width="7%">&nbsp;&nbsp;����������</td>
				<td align="left" width="20%" colspan="2"><input name="qikeep"
					id="qikeep" type="text" class="txt_1" maxlength="20"><font color="red">*</font></td>
			</tr>


   
  <tr class="tr_11">
    <td align="left" width="7%">&nbsp;&nbsp;��ע</td>
    <td align="left" width="20%">
      <textarea name="remark" id="remark" rows="5" cols="50" class="txt_1"></textarea>
    </td>
    <td><font color="red">*</font></td>
  </tr>
			<tr class="tr_11">
				<td></td>
				<td></td>
			</tr>
			<tr class="tr_11">
				<td width="7%"></td>
				<td align="left" colspan="2">&nbsp;&nbsp;&nbsp;<input
					type="button" name="ok" accesskey="y" tabindex="y" value="ȷ ��"
					class="but_1" onclick="onAdd()"
					style="font-size:12;width:40px;height:21px;"> <input
					type="button" name="back" accesskey="b" tabindex="b" value="�� ��"
					class="but_1"
					onclick="location='doLocationInfo.do?method=queryQuDaoInfo'"
					style="font-size:12;width:40px;height:21px;">

				</td>
			</tr>
		</table>
	</form>
</body>
</html>