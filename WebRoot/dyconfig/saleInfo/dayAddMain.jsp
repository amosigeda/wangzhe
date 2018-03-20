<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="java.text.*" %>
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
   		document.getElementById("belongProject").options[0].selected=true;  
	} 

	</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doSaleInfo.do?method=queryDayAddInfo">						
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="14" nowrap="nowrap" align="left">
                                            ����������
                </th>
                </tr>            
                 <tr class="title_3">
                       <td colspan="14">					
						����
                     	<input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>
						��Ŀ��
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
				
                  <tr class="title_2">  
                  	<td width="10%" >��Ŀ</td>   
                  	<td width="10%">����</td>
                  	<td width="8%" >�豸��Ծ</td>                 	           	
                  	<td width="8%" >����APPע��</td> 
                  	<td width="8%" >�豸�ռ���</td>
                  	<td width="8%" >������</td>
                  	<td width="8%" >�������</td>
                  	<td width="8%" >�豸��¼</td>                 	
                  	<td width="8%" >�豸ƽ����¼����</td>
                  	<td width="8%" >APP��¼</td> 
                  	<td width="8%" >APP��Ծ</td>
                  	<td width="8%" >APPƽ����¼����</td>                         						 
				</tr>
 				
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >						
						<%
						long countDeviceLogin = 0L; 
						long activeDevice = 0L;
						long countUserLogin = 0L; 
						long activeUser = 0L;
						%>
						<logic:notEmpty name="element" property="count_device_login">
							<bean:define id="count_device_login" name="element" property="count_device_login" type="java.lang.Long"/>
							<%countDeviceLogin=count_device_login; %>
						</logic:notEmpty>
						<logic:notEmpty name="element" property="active_device">
							<bean:define id="active_device" name="element" property="active_device" type="java.lang.Long"/>
							<%activeDevice=active_device; %>
						</logic:notEmpty>											
						<logic:notEmpty name="element" property="count_userlogin">
							<bean:define id="count_userlogin" name="element" property="count_userlogin" type="java.lang.Long"/>
							<%countUserLogin=count_userlogin; %>
						</logic:notEmpty>
						<logic:notEmpty name="element" property="active_user">
							<bean:define id="active_user" name="element" property="active_user" type="java.lang.Long"/>
							<%activeUser=active_user; %>
						</logic:notEmpty>
						
						<td><a style="color:#00f" href="../projectInfo/doProjectInfo.do?method=queryProjectInfo&projectId=<bean:write name="element" property="belong_project"/>">
									<bean:write name="element" property="project_name"/>
							</a></td>
						<td><bean:write name="element" property="date_time" format="yyyy-MM-dd"/></td>						
						<td>
							<logic:empty name="element" property="active_device">0</logic:empty>
							<logic:notEmpty name="element" property="active_device">
								<bean:write name="element" property="active_device"/>
							</logic:notEmpty>
						</td>
						<td>
							<logic:empty name="element" property="count_appuser">0</logic:empty>
							<logic:notEmpty name="element" property="count_appuser">
								<bean:write name="element" property="count_appuser"/>
							</logic:notEmpty>
						</td>
						<td>
							<logic:empty name="element" property="count_device_active">0</logic:empty>
							<logic:notEmpty name="element" property="count_device_active">
								<bean:write name="element" property="count_device_active"/>
							</logic:notEmpty>
						</td>
						<td>
							<logic:empty name="element" property="bind_count">0</logic:empty>
							<logic:notEmpty name="element" property="bind_count">
								<bean:write name="element" property="bind_count"/>
							</logic:notEmpty>
						</td>
						<td>
							<logic:empty name="element" property="unbind_count">0</logic:empty>
							<logic:notEmpty name="element" property="unbind_count">
								<bean:write name="element" property="unbind_count"/>
							</logic:notEmpty>
						</td>
						<td>
							<logic:empty name="element" property="count_device_login">0</logic:empty>
							<logic:notEmpty name="element" property="count_device_login">
								<bean:write name="element" property="count_device_login"/>
							</logic:notEmpty>
						</td>						
						<td>
						<%DecimalFormat df = new DecimalFormat(".00");
						float averageDevice = (float)countDeviceLogin/activeDevice;
						float averageUser = (float)countUserLogin/activeUser;
						%>
							<logic:empty name="element" property="count_device_login">0</logic:empty>
							<logic:notEmpty name="element" property="count_device_login">
								<%=df.format(averageDevice) %>
							</logic:notEmpty>							
						 </td>
						<td>
							<logic:empty name="element" property="count_userlogin">0</logic:empty>
							<logic:notEmpty name="element" property="count_userlogin">
								<bean:write name="element" property="count_userlogin"/>
							</logic:notEmpty>
						</td>
						<td>
							<logic:empty name="element" property="active_user">0</logic:empty>
							<logic:notEmpty name="element" property="active_user">
								<bean:write name="element" property="active_user"/>
							</logic:notEmpty>
						</td>
						<td>
							<logic:empty name="element" property="count_userlogin">0</logic:empty>
							<logic:notEmpty name="element" property="count_userlogin">
								<%=df.format(averageUser) %>
							</logic:notEmpty>														
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