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
		<title>�ޱ����ĵ�</title>
		<link href="<%=request.getContextPath()%>/css/tbls.css"
			rel="stylesheet" type="text/css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/public/public.js"></script>   <!-- ���ô˷��� -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>
	</head>
	<script type="text/javascript">
function finds(){
    var st = new Date(frmGo.startTime.value.replace(/-/g,'/'));
	var et = new Date(frmGo.endTime.value.replace(/-/g,'/'));
	if(Date.parse(st) - Date.parse(et)>0){
		alert("��ʼʱ�䲻�ܴ��ڽ���ʱ��!");
		return false;
	}
	
	var loginNumValue1 = document.getElementById("loginNum1").value;
	var loginNumValue2 = document.getElementById("loginNum2").value;	 
	if((loginNumValue1 && isNaN(loginNumValue1))||(loginNumValue2 && isNaN(loginNumValue2))){
		 alert("��¼��������Ϊ����!");
		 return false;
	 }
	if(loginNumValue1>loginNumValue2){
		alert("��¼��ʼ��������С�ڻ���ڵ�¼��������!");
		return false;
	}
	 
	frmGo.submit();
}
function c(){
    document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.serieNo.value="";
    document.all.loginNum1.value="";
    document.all.loginNum2.value="";
    document.getElementById("belongProject").options[0].selected=true;
    document.getElementById("status").options[0].selected=true;
} 

</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post"
			action="doDeviceLogin.do?method=queryDeviceLogin">
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
                <th colspan="13" nowrap="nowrap" align="left">
                                           �����豸��Ϣ
                </th>
                </tr>
                <% if(request.getAttribute("deviceImei") == null){%>
                 <tr class="title_3">
                       <td colspan="13">
					 ǩ������
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>						
					IMEI
						 <input id="serieNo" name="serieNo" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"serieNo");%>" size="15">	
					��¼����
						<input id="loginNum1" name="loginNum1" type="number" min="0" class="txt_number"
							value="<%CommUtils.printReqByAtt(request,response,"loginNum1"); %>"/>
						-<input id="loginNum2" name="loginNum2" type="number" min="0" class="txt_number"
							value="<%CommUtils.printReqByAtt(request,response,"loginNum2"); %>"/>
					��Ŀ
							<%String belongProject = (String)request.getAttribute("belongProject"); %>
							<select id="belongProject" name="belongProject">
								<option value="">ȫ��</option>
								<logic:iterate id="pro" name="project">
									<bean:define id="projectId" name="pro" property="id" type="java.lang.Integer" />																	
									<option value='<%=projectId %>' <%=String.valueOf(projectId).equals(belongProject)? "selected" : "" %>><bean:write name="pro" property="project_name"/></option>
								</logic:iterate>
							</select>	
					״̬<%if(request.getAttribute("status") != null && !"".equals(request.getAttribute("status"))){%>
						<%=request.getAttribute("status")%>
						<%}else{ %>
						<select id="status" name="status">
							<option value="">ȫ��</option>
							<option value="0">¼��</option>
							<option value="1">����</option>
							<option value="2">��</option>
							<option value="3">���</option>
						</select>
						<%} %>		          
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr> 
				<%} %>
				<%int i=1; %>
                  <tr class="title_2">  
                    <td width="10%" >ǩ��ʱ��</td>
                  	<td width="10%" >IMEI</td>
                  	<td width="6%" >��Ŀ</td>   
                  	<td width="6%" >��¼����</td>            	 
                  	<td width="6%" >�̼��汾��</td>  
                  	<td width="5%" >״̬</td>              	     						 
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >						
						<td><bean:write name="element" property="date_time" format="yyyy-MM-dd HH:mm:ss"/></td>
						<td><a style="color: #0000FF"
								href="../deviceActiveInfo/doDeviceActiveInfo.do?method=queryDeviceActiveInfo&deviceImei=<bean:write name="element" property="device_imei" />">
							<bean:write name="element" property="device_imei" />
							
							</a></td>
						<td><a style="color: #0000FF"  
								href="../../dyconfig/projectInfo/doProjectInfo.do?method=queryProjectInfo&projectId=<bean:write name="element" property="belong_project" />">
									<bean:write name="element" property="project"/>
							</a></td>
						<td><bean:write name="element" property="count_num" /></td>	
						<td><bean:write name="element" property="device_version"/></td>	
						<td>
							<logic:equal name="element" property="device_status" value="0">¼��</logic:equal>
						    <logic:equal name="element" property="device_status" value="1">����</logic:equal> 
						    <logic:equal name="element" property="device_status" value="2">��</logic:equal> 
							<logic:equal name="element" property="device_status" value="3">���</logic:equal>
						</td>																																		 						
					</tr>
				</logic:iterate> 

			  	<tr class="title_3">
					<td colspan="13" align="left" >  
						<%
							pys.printGoPage(response, "frmGo");
						%>
					</td>
				</tr>  
			</table>
		</form>
	</body>
</html>