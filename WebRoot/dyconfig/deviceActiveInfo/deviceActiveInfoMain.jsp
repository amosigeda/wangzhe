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
	function onView1(download){
		if(download.length == 0){
			alert("û��ͷ���ļ����޷����أ�");
			return false;
		}
		frmGo.action="doDeviceActiveInfo.do?method=downloadImg&download="+download;
	   	frmGo.submit();
	}
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
    document.all.serieNo.value="";
    document.all.userName.value="";
    document.getElementById("belongProject").options[0].selected=true;
} 
function deleteDeviceActive(obj){
	if(confirm("�������豸,���豸���������Ҳ��ɾ��,���󲻿ɻָ�,ȷ�Ͻ��?")){
		var msg = obj.split(",");
		if(msg.length == 3){
			frmGo.action = "doDeviceActiveInfo.do?method=deleteDeviceActive&user_id="+msg[0]+"&device_imei="+msg[1]+"&belong_project="+msg[2];
			frmGo.submit();
		}		
	}
}
</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post"
			action="doDeviceActiveInfo.do?method=queryDeviceActiveInfo">
			<% if(request.getAttribute("deviceImei") != null && !request.getAttribute("deviceImei").equals("")){%>
			<table class="table_1" style="font-size:14px;margin-bottom:5px;">
			   <tr>  
			     <td>
			                      ��ǰIMEI:
			              <font color="#FFA500">
			               <strong ><%=request.getAttribute("deviceImei") %></strong>
			               <input type="hidden" name="deviceImei" value="<%=request.getAttribute("deviceImei") %>"/>
			            </font>
			     </td>
			   </tr>
			</table>
		 <%} %>		 
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="14" nowrap="nowrap" align="left">
                                           �����豸��Ϣ
                </th>
                </tr>
                <% if(request.getAttribute("deviceImei") == null){%>
                 <tr class="title_3">
                       <td colspan="14">
					 ��ʱ��
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>						
					IMEI
						 <input id="serieNo" name="serieNo" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"serieNo");%>" size="15">
				        <!--   �豸����
						 <input id="phoneNumber" name="phoneNumber" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"phoneNumber");%>" size="9"> -->
					  ���������
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
				<%} %>
				<%int i=1; %>
                  <tr class="title_2">
                  	<td width="9%" >�״μ���ʱ��</td>
                  	<td width="10%" >IMEI</td>
                  	<td width="6%" >��Ŀ</td>
                  	<td width="8%" >�豸����</td> 
                  	<td width="5%" >�󶨴���</td>
                  	<td width="5%" >���������</td> 
                  	<!-- <td width="6%" >������ID</td> -->
                 <!--  	<td width="5%" >�豸ID</td> -->
                  	<td width="7%" >�豸�ǳ�</td>
                  	<!-- <td width="5%" >�Ա�</td>
                  	<td width="8%" >����</td>
                  	<td width="6%" >���(cm)</td>
                  	<td width="6%" >����(kg)</td> -->
                  	<td width="6%" >ͷ��</td>
                  	<td width="6%" >�豸�̼��汾��</td>
                  	<td width="9%" >��ʱ��</td> 
                  	<td width="6%">����</td>                	
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >						
						<td><bean:write name="element" property="first" format="yyyy-MM-dd HH:mm:ss"/></td>
						<td><bean:write name="element" property="device_imei" /></td>
						<td>
							<a style="color:#00f" href="../projectInfo/doProjectInfo.do?method=queryProjectInfo&projectId=<bean:write name="element" property="belong_project"/>">
						<bean:write name="element" property="project" />
						</a>
						</td>
						<td>
						<logic:empty name="element" property="device_phone">��</logic:empty>
							<logic:notEmpty name="element" property="device_phone">
								<bean:write name="element" property="device_phone" />
							</logic:notEmpty>
						</td>
						<td><bean:write name="element" property="count"/></td>
					<%-- 	<td><bean:write name="element" property="user_name"/></td>	 --%>					
						<td>
							<a style="color: #0000FF"
								href="../appUserInfo/doAppUserInfo.do?method=queryAppUserInfo&user_id=<bean:write name="element" property="user_id" />">
								<bean:write name="element" property="user_name"/>
							</a>
						</td>
						<%-- <td><bean:write name="element" property="id" /></td>	 --%>				
						<td><bean:write name="element" property="device_name" /></td>
						<%-- <td>
							<logic:equal name="element" property="device_sex" value="0">��</logic:equal> 
							<logic:equal name="element" property="device_sex" value="1">Ů</logic:equal>
						</td>
						<td><bean:write name="element" property="device_age" /></td>	
						<td><bean:write name="element" property="device_height" /></td>
						<td><bean:write name="element" property="device_weight" /></td> --%>
						<td>
							<logic:equal name="element" property="device_head" value="0">��</logic:equal>
							<logic:notEqual name="element" property="device_head" value="0">
								<a href=# onclick="onView1('<bean:write name="element" property="device_head"/>')" style="color:#0000FF">����</a>
							</logic:notEqual>							
						</td>	
						<td>
						<logic:notEmpty name="element" property="firm"><bean:write name="element" property="firm"/></logic:notEmpty>
						<logic:empty name="element" property="firm">��</logic:empty>
						<%-- <bean:write name="element" property="firm"/> --%>
						</td>							
						<td><bean:write name="element" property="device_update_time" format="yyyy-MM-dd HH:mm:ss"/></td>								 						
						<td>
							<a href=# onclick="deleteDeviceActive('<bean:write name="element" property="user_id" />,<bean:write name="element" property="device_imei" />,<bean:write name="element" property="belong_project" />')" style="color:#0000FF" > �����</a>
							
						</td>
					</tr>
				</logic:iterate> 

			  	<tr class="title_3">
					<td colspan="14" align="left" >  
						<%
							pys.printGoPage(response, "frmGo");
						%>
					</td>
				</tr>  
			</table>
		</form>
	</body>
</html>