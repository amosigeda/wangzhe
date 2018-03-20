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
	<script language="javascript">
function finds(){
    var st = new Date(frmGo.startTime.value.replace(/-/g,'/'));
	var et = new Date(frmGo.endTime.value.replace(/-/g,'/'));
	if(Date.parse(st) - Date.parse(et)>0){
		alert("��ʼʱ�䲻�ܴ��ڽ���ʱ��!");
		return false;
	}
	   frmGo.submit();
}
function c(){
    document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.userName.value="";
    document.getElementById("belongProject").options[0].selected=true;
} 

</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doUserLoginInfo.do?method=queryUserLoginInfo">
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="12" nowrap="nowrap" align="left">
                APP��¼��Ϣ
                </th>
                </tr>
                 <tr class="title_3">
                       <td colspan="13">
					  ǩ������
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>												
						ע���ֻ���
						 <input id="userName" name="userName" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"userName");%>" size="9">
						��Ŀ
							<%String belongProject = (String)request.getAttribute("belongProject"); %>
							<select id="belongProject" name="belongProject">
								<option value="">ȫ��</option>
								<logic:iterate id="pro" name="project">
									<bean:define id="projectId" name="pro" property="id" type="java.lang.Integer" />																	
									<option value='<%=projectId %>' <%=String.valueOf(projectId).equals(belongProject)? "selected" : "" %>><bean:write name="pro" property="project_name"/></option>
								</logic:iterate>
							</select>
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr> 
				<%int i=1; %>
                  <tr class="title_2"> 
                  	<td width="12%" >ǩ��ʱ��</td>
                  	<td width="8%" >ע���ֻ���</td>
                    <td width="7%" >��Ŀ</td>            	                 	
                  	<td width="12%" >�ֻ�IMEI</td>
                  	<td width="12%" >IMSI</td> 
                  	<td width="10%" >�ֻ��ͺ�</td>
                  	<td width="10%" >�ֻ��汾</td>
                  	<td width="12%" >app�汾</td>
                  	<td width="10%" >IP��ַ</td>
                  	<td width="10%" >������</td>                               	                 	  						 
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >						
						<td><bean:write name="element" property="login_time" format="yyyy-MM-dd HH:mm:ss"/></td>
						<td><a style="color: #0000FF"
								href="../appUserInfo/doAppUserInfo.do?method=queryAppUserInfo&user_id=<bean:write name="element" property="user_id" />">
								<bean:write name="element" property="user_name"/>
							</a></td>
						<td><a style="color: #0000FF"  
								href="../../dyconfig/projectInfo/doProjectInfo.do?method=queryProjectInfo&projectId=<bean:write name="element" property="belong_project" />">
									<bean:write name="element" property="project_name"/>
							</a></td>
						<td>
							<logic:equal name="element" property="imei" value="0">��</logic:equal>
							<logic:empty name="element" property="imei">��</logic:empty>
							<logic:notEqual  name="element" property="imei" value="0">
							<bean:write name="element" property="imei" />
							 </logic:notEqual>
						</td>						
						<td>
						<logic:equal name="element" property="imsi" value="0">��</logic:equal>
						<logic:empty name="element" property="imsi">��</logic:empty>
							<logic:notEqual  name="element" property="imsi" value="0">
							<bean:write name="element" property="imsi" />
							</logic:notEqual>
						</td>
						<td><bean:write name="element" property="phone_model"/></td>
						<td><bean:write name="element" property="phone_version"/></td>
						<td><bean:write name="element" property="app_version"/></td>
						<td>
							<logic:empty name="element" property="ip" >������</logic:empty>
							<logic:notEmpty name="element" property="ip">
								<bean:write name="element" property="ip" />
							</logic:notEmpty>
						</td>
						<td>
							<logic:empty name="element" property="province" >������</logic:empty>
							<logic:notEmpty name="element" property="province">
								<bean:write name="element" property="province" />
							</logic:notEmpty>
						</td>
					</tr>
				</logic:iterate> 

			  	<tr class="title_3">
					<td colspan="12" align="left" >  
						<%
							pys.printGoPage(response, "frmGo");
						%>
					</td>
				</tr>  
			</table>
		</form>
	</body>
</html>