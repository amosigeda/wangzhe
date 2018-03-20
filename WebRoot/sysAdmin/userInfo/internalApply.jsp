<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ page autoFlush="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%=request.getContextPath()%>/public/public.js"></script>
<script language="JavaScript" src="../../js/jquery-1.8.2.js"></script>
<title>�ޱ����ĵ�</title>
</head>
<script language="javascript">
function c(){
	frm.phoneNo.value="";
	frm.userName.value="";
	frm.groupCode.value="";
}
	function pho(){
	var phoneNo=$("#phoneNo").val().trim();
	var tel = /^1(3|5|8)\d{9}$/;
	if(phoneNo == ""|| phoneNo.length==0){
		document.getElementById("tel1").innerHTML="";
		document.getElementById("tel").innerHTML=" �ֻ��Ų���Ϊ�գ�";	
	}else if(!tel.test(phoneNo)){
		document.getElementById("tel1").innerHTML="";
		document.getElementById("tel").innerHTML=" �ֻ��Ÿ�ʽ����ȷ�����������룡";
		}else{
			var flag;
			$.ajax({
				type:"post",
				url:"doUserInfo.do?method=getPhoneNoInfo",
				data:"phoneNo="+phoneNo,
				async:false,
				success:function(msg){
					if(msg=="false"){
						document.getElementById("tel1").innerHTML="";
						document.getElementById("tel").innerHTML=" ���ֻ���δע�ᣬ����ע�ᣡ";
						}else if(msg=="success"){
							//alert("��ϲ�����ֻ�����ע�ᣬ�������룡");
							document.getElementById("tel").innerHTML="";
							document.getElementById("tel1").innerHTML=" ��";
							flag = true;
					}else if(msg=="fail"){
						document.getElementById("tel1").innerHTML="";
						document.getElementById("tel").innerHTML=" ���ֻ����������Ȩ�ޣ�";
					}else if(msg=="fail2"){
						document.getElementById("tel1").innerHTML="";
						document.getElementById("tel").innerHTML=" ���ֻ������ύ���룬������ˣ�";
					}	
					
				}
			});
		}
	return flag;
	}
	function use(){
		var phoneNo=$("#phoneNo").val().trim();
		var userName=$("#userName").val().trim();
		var reg = /^[a-zA-Z]\w{4,14}$/;	
		if(userName=="" || userName.length==0){
			document.getElementById("us1").innerHTML="";
			document.getElementById("us").innerHTML=" �û�������Ϊ�գ�";
		}else if(!reg.test(userName)){
			document.getElementById("us1").innerHTML="";
				document.getElementById("us").innerHTML=" �û�����ʽ����ȷ�����������룡";		
			}else{
				var flag;
				$.ajax({
					type:"post",
					url:"doUserInfo.do?method=getUserNamefromUserInfo",
					data:"phoneNo="+phoneNo+"&userName="+userName,
					async:false,
					success:function(msg){
						if(msg=="fail"){
							document.getElementById("us1").innerHTML="";
							document.getElementById("us").innerHTML=" ���û����Ѿ���ע��!";
							return false;
						}else{
							document.getElementById("us").innerHTML="";
							document.getElementById("us1").innerHTML=" ��";
							flag = true;
						}
					}
				});
			}
	
		return flag;
		}
	function onAdd(){
		if(pho() == true && use() == true){
	      frm.submit();
	      
		}
		
}



	
</script>
<body>
<span class="title_1"></span>
<form name="frm" method="post" action="doUserInfo.do?method=addInsertUserInfo" onsubmit="return onAdd()">

<table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11">
  <tr>
        <th colspan="3" nowrap="nowrap" align="left">
                                    �ڲ�Ȩ������
        </th>
       </tr>
  <tr class="tr_11">
    <td align="left" width="8%">&nbsp;&nbsp;&nbsp;�ֻ���</td>
    <td align="left" colspan="2">
      <input name="phoneNo" id="phoneNo" onblur="pho()" type="text" class="txt_1"maxlength="20"/><span id="tel" style="color:red" ></span><span id="tel1" style="color:green"></span>
    </td>
    </tr>
   <tr class="tr_11">
    <td align="left" width="8%">&nbsp;&nbsp;&nbsp;�û���</td>
    <td align="left" colspan="2">
      <input name="userName" id="userName" onblur="use()"type="text" 
      class="txt_1"maxlength="20"><span id="us" style="color:red"></span><span id="us1" style="color:green"></span>
    </td>
  </tr>

  <tr class="tr_11">
    <td align="left" width="8%">&nbsp;&nbsp;����Ȩ��</td>   
    <td align="left" colspan="2">
		<select name="groupCode">
			<option value="">��ѡ��</option>
			<logic:iterate id="element" name="pageList">
			<option value='<bean:write name="element" property="id"/>'>
				<bean:write name="element" property="roleName"/>
			</option>
			</logic:iterate>
		</select>
    </td>
  </tr>
	<tr>
  <td width="5%"></td>
    <td align="left" colspan="2">&nbsp;&nbsp;&nbsp;<input type="button" name="ok"accesskey="y" tabindex="y"  value="ȷ ��" class="but_1" onclick="onAdd()" style="font-size:12;width:40px;height:21px;">
      <input type="button" name="back"accesskey="b" tabindex="b" value="���" class="but_1" onclick="c();" style="font-size:12;width:40px;height:21px;">
  
    </td>
  </tr>
</table>
</form>
</body>
</html>
