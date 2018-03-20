<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ page import="com.care.common.lang.*"%>
<%@ page import="com.care.common.config.Config"%>
<%@ page import="com.care.app.LoginUser"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ page autoFlush="true"%>
<%
	/*ҳ������*/
	PagePys pys = (PagePys) request.getAttribute("PagePys");
LoginUser loginUser = (LoginUser)request.getSession().getAttribute(Config.SystemConfig.LOGINUSER);
%>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
	<script type="text/javaScript" src="<%=request.getContextPath()%>/public/public.js"></script>
	<title>�ޱ����ĵ�</title>	
	<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/public.js"></script>   <!-- ���ô˷��� -->		
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>
	
	<script type="text/javascript">		
	function checkPhoneNo(){
		var phoneNo = document.getElementById("phoneNo").value;
		if(isNaN(phoneNo)){
			alert("�ֻ��ű���ȫ��Ϊ���֣�");
			document.getElementById("phoneNo").focus();
			return false;
		}
	}
	
	function finds(){
		var st = new Date(frmGo.startTime.value.replace(/-/g,'/'));
		var et = new Date(frmGo.endTime.value.replace(/-/g,'/'));
		if(Date.parse(st) - Date.parse(et)>0){
			alert("��ʼʱ�䲻�ܴ��ڽ���ʱ��!");
			return false;
		}
		
		var phoneNo = document.getElementById("phoneNo").value;
		if(isNaN(phoneNo)){
			alert("�ֻ��ű���ȫ��Ϊ���֣�");
			return false;
		}
		frmGo.submit();
	}
	
	function setRole(objId){
		frmGo.action ="doRegisterUser.do?method=initChangeRoleInfo&id="+objId;
		frmGo.submit();
	}
	
	function setTag(objId){
		frmGo.action="doRegisterUser.do?method=initChangeTagInfo&id="+objId;
		frmGo.submit();
	}
	
	function c(){
		document.getElementById("startTime").value="";
		document.getElementById("endTime").value="";
		document.getElementById("phoneNo").value="";
		document.getElementById("roleId").options[0].selected=true;
		document.getElementById("apply_status").options[0].selected=true;
	}
	</script>
  </head>
  
  <body>
    <body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doRegisterUser.do?method=queryRegisterInfo">
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <a href="/dyconfig/userRegisterInfo/addRegisterInfo.jsp"><th colspan="12" nowrap="nowrap" align="left">
                	����ע��
                </th>
               </tr>  								
               <tr class="title_3">
               	<td colspan="15">
					����ʱ��
                  <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
						 value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
						 size="9" readonly>-
				  <input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
						 value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
						 size="9" readonly>				       
				         �ֻ��˺�
				  <input name="phoneNo" type="text" class="txt_1" id="phoneNo" size=13 style="cursor:text" value="<%CommUtils.printReqByAtt(request,response,"phoneNo");%>" onBlur="checkPhoneNo()">
        		        ��ɫ
        		  <%=request.getAttribute("roleList")%>
        		       ״̬
        		  <%=request.getAttribute("apply_status")%>     
				  <input type="hidden" />
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	     
				  <input name="find1" type="button" class="but_1" accesskey="f"
					     tabindex="f" value="�� ��" onclick="javascript:finds()">	     	     				     	     
				  <input name="clear" type="button" class="but_1" accesskey="c"
						 tabindex="c"  value="�������" onclick="c()">
				 </td>		 
				</tr>               
                <tr class="title_2"> 
                  	 <td width="15%">����</std>
                  	 <td width="8%">����</td>
                  	 <td width="10%">�ֻ��˺�</td>
                  	 <td width="8%">��ɫ</td>
                     <td width="8%">״̬</td>
                     <td width="10%">��������</td> 
                     <td width="10%">��������</td>           	                 	
                  	 <td width="15%">����</td>                              	                 	  						 
			    </tr>
			    <logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"'>						
						<td>							
							<bean:write name="element" property="userName" />
						</td>
						<td>
							<bean:write name="element" property="passWrd1"/>
						</td>
						<td>
							<bean:write name="element" property="phoneNo"/>
							<logic:empty name="element" property="phoneNo">��</logic:empty>
						</td>	
						<td>
							<bean:write name="element" property="roleName"/>
							<logic:empty name="element" property="roleName">��</logic:empty>
						</td>
						<logic:equal name="element" property="apply_status" value="0">
							<td style="color:black;">������</td>
						</logic:equal>
						<logic:equal name="element" property="apply_status" value="1">
							<td style="color:green;">��׼</td>
						</logic:equal>
						<logic:equal name="element" property="apply_status" value="2">
							<td style="color:red;">����׼</td>
						</logic:equal>
						<!--  
						<td style="color:green;">
							<logic:equal name="element" property="apply_status" value="0">������</logic:equal>
							<logic:equal name="element" property="apply_status" value="1">��׼</logic:equal>
							<logic:equal name="element" property="apply_status" value="2" >����׼</logic:equal>
						</td>
						-->
						<td>
							<bean:write name="element" property="createDate" format="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							<bean:write name="element" property="applyReason"/>
							<logic:empty name="element" property="applyReason">��</logic:empty>
						</td>
						<td align="left">
							<logic:equal  name="element" property="apply_status" value="0">����ɫ���䡿</logic:equal>
							<logic:equal  name="element" property="apply_status" value="1">
								<a href=# onclick="setRole('<bean:write name="element" property="id"/>')" style="color:#0000FF">����ɫ���䡿</a>
							</logic:equal>
							<logic:equal  name="element" property="apply_status" value="2">����ɫ���䡿</logic:equal>							
													
							<a href=# onclick="setTag('<bean:write name="element" property="id"/>')" style="color:#0000FF">���Ƿ������� </a>
						</td>
					</tr>		
				</logic:iterate>		   
			  <tr class="title_3">
				<td colspan="12" align="left" >  
					<%
						pys.printGoPage(response,"frmGo");
					%>
				</td>
			 </tr>  
			</table>
		</form>
  </body>
</html>
