<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page autoFlush="true" %>
<%@ page import="com.care.app.LoginUser"%>
<%@ page import="com.care.common.config.Config"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
	<script type="text/javaScript" src="<%=request.getContextPath()%>/public/public.js"></script>
	<title>�ޱ����ĵ�</title>	
	<script type="text/javascript">
	
	function onAdd(){
		if(frm.userName.value.trim() == ''){
			alert("��¼�˺Ų���Ϊ��");
			frm.userName.focus();
			return false;
		}else{
			var userName = frm.userName.value;
			var reg = /^[a-zA-Z]\w{4,14}$/;		
			if(!reg.test(userName)){
				alert("�˺Ÿ�ʽ����ȷ�����������룡");
				frm.userName.focus();
				return false;
			}
		}
		var phoneNum = document.getElementById("phoneNo").value.trim();		
		if(!((phoneNum.length==11)&&(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phoneNum)))){
			alert("����������11λ�ֻ��Ż�����ȷ���ֻ���ǰ7λ��");
			document.getElementById("phoneNo").focus();
			return false;
		}
		
		var pwd = document.getElementById("pwd").value.trim();
		var pwdcfm = document.getElementById("pwdconfirm").value.trim();
		if(pwd==""){
			alert("���벻��Ϊ��");
			document.getElementById("pwd").focus();
			return false;	
			
		}else if(pwd !=""){
			var reg = /^\w{5,15}$/;		
			if(!reg.test(pwd)){
				alert("�����ʽ����ȷ�����������룡");
				document.getElementById("pwd").focus();				
				return false;
			}
			
			if(pwd != pwdcfm){
				alert("�����������벻һ�£����������룡");
				document.getElementById("pwdconfirm").clear();
				return false;
			}
		}
		
		if(frm.remark.value.trim().length > 30){
			alert("�������ܳ���30��");
			frm.remark.focus();
			return false;
		}
		frm.submit();	
	}
	</script>
	
</head>
  
  <body>
    <body>
    <span class="title_1"></span>
	<form name="frm" method="post" action="doRegisterUser.do?method=insertRegisterInfo" onsubmit="return onAdd()">
    <table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11">
    	<tr>
        	<th colspan="3" nowrap="nowrap" align="left">
                                         ע���û�
            </th>
        </tr>
  	    <tr class="tr_11">
          <td align="left" width="7%">&nbsp;&nbsp;ע���˺�</td>
          <td align="left" width="20%" colspan="2">
             <input name="userName" id="userName" type="text" class="txt_1"maxlength="20"/><font color="#595959">*����ĸ��ͷ��5~15λ��ĸ�����ֻ��»�����ϣ�</font>
          </td>
        </tr>
        <tr class="tr_11">
        	<td align="left" width="7%">&nbsp;&nbsp;�ֻ�����</td>
        	<td align="left" width="20%" colspan="2">
        	<input name="phoneNo" id="phoneNo" type="text" class="txt_1"maxlength="20"><font color="#595959">*</font>
    	</td>
    	<tr class="tr_11">
        	<td align="left" width="7%">&nbsp;&nbsp;&nbsp;��֤��</td>
        	<td align="left" width="20%" colspan="2">
        		<input name="checkPhoneNo" type="text" class="txt_1"maxlength="20"><font color="#595959">*</font>
        		<input type="button" value="��ѻ�ȡ��֤��" id="checkPhoneBtn"/>
    		</td>
        <tr class="tr_11">
        	<td align="left" width="7%">&nbsp;&nbsp;&nbsp;��&nbsp;��</td>
        	<td align="left" width="20%" colspan="2">
        		<input name="passWrd" type="password" class="txt_1"maxlength="20" id="pwd"><font color="#595959">*��5~15λ��ĸ�����ֻ��»�����ϣ�</font>
    		</td>
  		</tr>
  		<tr class="tr_11">
        	<td align="left" width="7%">&nbsp;&nbsp;ȷ������</td>
        	<td align="left" width="20%" colspan="2">
        		<input name="passWrd" type="password" class="txt_1"maxlength="20" id="pwdconfirm"><font color="#595959">*��5~15λ��ĸ�����ֻ��»�����ϣ�</font>
    		</td>
  		</tr>
  		
  		<tr class="tr_11">
  			<td align="left" width="7%">&nbsp;&nbsp;��ע</td>
    		<td align="left" width="20%">
      			<textarea name="remark" id="remark" rows="5" cols="50" class="txt_1"></textarea>
    		</td>
    		<td><font color="#595959">���������ܳ���30�֣�</font></td>
  		</tr>
  		<tr class="tr_11">
  			<td width="7%"></td>
    		<td align="left" colspan="2">&nbsp;&nbsp;&nbsp;
    			<input type="button" name="ok" 
    			       accesskey="y" tabindex="y" 
    			       value="ȷ ��" class="but_1" 
    			       onclick="onAdd()" 
    			       style="font-size:12;width:40px;height:21px;"/>
      			<input type="button" name="back" 
      			       accesskey="b" tabindex="b" 
      			       value="�� ��" class="but_1" 
      			       onclick="location='doRegisterUser.do?method=queryRegisterInfo'" style="font-size:12;width:40px;height:21px;"/>  
    		</td>
  		</tr>
	</table>
	</form>
  </body>
</html>
