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
		<script language="JavaScript" src="../../js/jquery-1.8.2.js"></script>
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
    document.all.companyId.options[0].selected=true;
    document.all.projectId.options[0].selected=true;
    document.getElementById("type").options[0].selected=true;
}

function changeCompany(obj){
	$.ajax({
		type:"get",
		url:"doPhoneInfo.do?method=getProjectByCompanyId",
		data:"companyId="+obj,
		success:function(msg){
			var projectSelect = document.getElementById("projectId");
			projectSelect.length=1;
			if(msg.trim() != ""){				
				var projects = msg.split("&");
				for(i=0;i<projects.length; i++){
					var project = projects[i].split(",");
					if(project.length == 2){
						projectSelect.options[projectSelect.length] = new Option(project[1],project[0]);
						
					}
					
				}
			}
		}
	});
}
 
function addimei(){
	frmGo.action="doPhoneInfo.do?method=initInsert";
	frmGo.submit();
}
</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post"
			action="doPhoneInfo.do?method=queryPhoneIMEIInfo">
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="12" nowrap="nowrap" align="left">
                IMEI����
                <input name="addDevice" type="button" class="but_1" accesskey="a"
							tabindex="a" value="�� ��" onclick="addimei()">
                </th>
                </tr>
                 <tr class="title_3">
                       <td colspan="13">
					  ¼��ʱ��
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>											
						�ͻ�
							<%String companyId = (String)request.getAttribute("companyId"); %>
							<select id="companyId" name="companyId" onchange="changeCompany(this.value)">
								<option value="">ȫ��</option>
								<logic:iterate id="com" name="company">
									<bean:define id="company" name="com" property="id" type="java.lang.Integer" />																	
									<option value='<%=company %>' <%=String.valueOf(company).equals(companyId)? "selected" : "" %>><bean:write name="com" property="company_name"/></option>
								</logic:iterate>
							</select>
						��Ŀ
						<%String projectId = (String)request.getAttribute("projectId"); %>			
							<select id="projectId" name="projectId" >
								<option value="">ȫ��</option>
								<logic:iterate id="pro" name="project">
									<bean:define id="project" name="pro" property="id" type="java.lang.Integer" />																	
									<option value='<%=project %>' <%=String.valueOf(project).equals(projectId)? "selected" : "" %>><bean:write name="pro" property="project_name"/></option>
								</logic:iterate>
							</select>
							
						����<%if(request.getAttribute("type") != null && !"".equals(request.getAttribute("type"))){%>
						<%=request.getAttribute("type")%>
						<%}else{ %>
						<select id="type" name="type">
							<option value="">ȫ��</option>
							<option value="1">����</option>
							<option value="2">����</option>
						</select>
						<%} %>									
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr> 
				<%int i=1; %>
                  <tr class="title_2"> 
                    <td width="10%" >¼��ʱ��</td>   
                    <td width="7%" >�ͻ�</td>
                    <td width="7%" >��Ŀ</td>             	
                  	<td width="7%" >IMEI����</td>
                  	<td width="7%" >��СIMEI</td>
                  	<td width="7%" >���IMEI</td>
                  	<td width="7%" >��������</td>
                  	<td width="7%" >����</td>                  	                                   	                 	
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >						
						<td><bean:write name="element" property="input_time" format="yyyy-MM-dd HH:mm:ss"/></td>
						<td><bean:write name="element" property="company_name" /></td>
						<td><bean:write name="element" property="project_name" /></td>
						<td>
							<a style="color: #0000FF"
								href="../phoneInfo/doPhoneInfo.do?method=queryPhoneInfo&phoneManageId=<bean:write name="element" property="id" />">
							<bean:write name="element" property="count_num" />
							</a>
						</td>
						<td><bean:write name="element" property="mini_num" /></td>
						<td><bean:write name="element" property="max_num" /></td>					
						<td>
							<a style="color: #0000FF"
								href="../deviceActiveInfo/doDeviceActiveInfo.do?method=queryDeviceActiveInfo&phoneManageId=<bean:write name="element" property="id" />">
							<bean:write name="element" property="active" />
							</a>						
						</td>
						<td>
							<logic:equal name="element" property="type" value="1">����</logic:equal>
							<logic:equal name="element" property="type" value="2">����</logic:equal>
							<logic:equal name="element" property="type" value="">��</logic:equal>
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