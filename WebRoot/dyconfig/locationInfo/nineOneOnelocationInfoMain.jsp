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
    document.all.serieNo.value="";
  /*   document.all.locationType.options[0].selected=true;
    document.all.statusSelect.options[0].selected=true;
    document.all.projectId.value=""; */
} 

</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post"
			action="doLocationInfo.do?method=queryNineOneOneLocationInfo">
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="12" nowrap="nowrap" align="left">
                                           ��λ��Ϣ
                </th>
                </tr>
                 <tr class="title_3">
                       <td colspan="13">
					  ��λʱ��
                     <input name="startTime" type="text"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								size="15" class="Wdate" readonly> -
							<input name="endTime" type="text" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								size="15" class="Wdate" readonly>						
						IMEI<input id="serieNo" name="serieNo" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"serieNo");%>" size="20">
					<%-- 	��λ����<%if(request.getAttribute("locationType") != null && !"".equals(request.getAttribute("locationType"))){%>
						<%=request.getAttribute("locationType")%>
						<%}else{ %>
						<select id="locationType" name="locationType">
							<option value="">ȫ��</option>
							<option value="0">LBS</option>
							<option value="1">GPS</option>
							<option value="2">WIFI</option>
						</select>
						<%} %>  
						�Ƿ���ʾ
						<%if(request.getAttribute("statusSelect") != null && !"".equals(request.getAttribute("statusSelect"))){ %>
						<%=request.getAttribute("statusSelect") %>
						<%}else{ %>
						<select id="statusSelect" name="statusSelect">
						<option value="">ȫ��</option>
						<option value="1">��</option>
						<option value="0">��</option>
						</select>
						<%} %>  
						��Ŀ��
						<%String projectId = (String)request.getAttribute("projectId"); %>			
							<select id="projectId" name="projectId" >
								<option value="">ȫ��</option>
								<logic:iterate id="pro" name="project">
									<bean:define id="project" name="pro" property="id" type="java.lang.Integer" />																	
									<option value='<%=project %>' <%=String.valueOf(project).equals(projectId)? "selected" : "" %>><bean:write name="pro" property="project_name"/></option>
								</logic:iterate>
							</select> --%>
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr> 
				<%int i=1; %>
                  <tr class="title_2">                 	
                  	<td width="12%" >�豸IMEI</td>                  	
                  	<td width="8%" >����</td>
                  	<td width="8%" >γ��</td>
                  	<td width="6%" >�ٶ�</td>                   	 
                  	<td width="6%" >����</td>                   	 
                  	<td width="6%" >��λ����</td> 
                  	<td width="6%" >����</td> 
                  	<td width="6%" >����ʹ��״̬</td>
                  	<td width="6%" >����</td>
                  	<td width="6%" >�Ƿ����</td>
                  	<td width="10%" >��λʱ��</td>
                  	<td width="10%" >��ַ</td>
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >						
						<td><%-- <a style="color:#00f" href="../deviceActiveInfo/doDeviceActiveInfo.do?method=queryDeviceActiveInfo&deviceImei=<bean:write name="element" property="serie_no"/>">
							</a> --%>
								<bean:write name="element" property="DEVICE_SERIAL_NUMBER"/>
							</td>						
										
						<td><bean:write name="element" property="LON" /></td>
						<td><bean:write name="element" property="LAT" /></td>
						<td><bean:write name="element" property="SPEED" /></td>						
						<td><bean:write name="element" property="ELEVATION" /></td>						
						<td>	
						<logic:equal name="element" property="TRANSACTION_CODE" value="sl">��վ</logic:equal>
						<logic:equal name="element" property="TRANSACTION_CODE" value="slc">GPS</logic:equal>
							<%-- <logic:equal name="element" property="location_type" value="0">LBS</logic:equal> 
							<logic:equal name="element" property="location_type" value="1">GPS</logic:equal>
							<logic:equal name="element" property="location_type" value="2">WIFI</logic:equal> --%>
						</td>
						<td><bean:write name="element" property="DIRECTION" /></td>

						<td>
						<logic:equal name="element" property="BAT_STATUS" value="1">���ڳ��</logic:equal>
						<logic:equal name="element" property="BAT_STATUS" value="2">�ڳ��</logic:equal>
						</td>
                         
                         <td><bean:write name="element" property="ELECTRIC_QUANTITY" /></td>
                         
                         <td>
						<logic:equal name="element" property="FLY" value="1">��</logic:equal>
						<logic:equal name="element" property="FLY" value="2">��</logic:equal>
						</td>
						
						<td>
						  <bean:write name="element" property="INSERT_TIME" format="yyyy-MM-dd HH:mm:ss"/>
						  </td>		
						  
						      <td><bean:write name="element" property="ADDRESS" /></td>													 						
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