<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.care.common.lang.*"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ page autoFlush="true"%>
<%
  PagePys pys = (PagePys) request.getAttribute("PagePys");
  String deviceSwitch = (String)request.getAttribute("deviceSwitch");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>�ޱ����ĵ�</title>
		<link href="<%=request.getContextPath()%>/css/tbls.css"
			rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/public.js"></script>
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

	var costTime1 = document.getElementById('costTime1').value;
	var costTiem2 = document.getElementById('costTime2').value;
	   if(!isNumber(costTime1.trim()) && costTime1.trim() !=""){
	   alert("����ʱ�䷶Χ����д����");
	    frmGo.costTime1.focus();
	    return false;
	}
	if(!isNumber(costTiem2.trim()) && costTiem2.trim() !=""){
	   alert("����ʱ�䷶Χ����д����");
	    frmGo.costTime2.focus();
	    return false;
	}
	if(parseInt(costTime1.trim()) > parseInt(costTiem2.trim())){
	   alert("����Ľ�������ʱ�䲻�ܴ��ڿ�ʼ����ʱ��,����������");
	   frmGo.costTime2.focus();
	   return false;
	}
	frmGo.submit();
}
function c(){
    document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.phone.value="";
    document.all.costTime1.value="";
    document.all.costTime2.value="";
    document.all.href.value="";
    document.all.func.value="";
}

function changeSwitch(obj){
	if(obj == 0){
		if(confirm("�Ƿ�������?")){
			frmGo.action="doMonitorInfo.do?method=changeSwitch&type=device&value=1";
			frmGo.submit();
		}
	}
	if(obj == 1){
		if(confirm("�Ƿ�رտ���?")){
			frmGo.action="doMonitorInfo.do?method=changeSwitch&type=device&value=0";
			frmGo.submit();
		}
	}		
}


</script>
	<body>
		<span class="title_1"> </span>
		<form name="frmGo" method="post"
			action="doMonitorInfo.do?method=queryVisit&type=1">
			<%if(request.getAttribute("fNow_date") != null && !"".equals(request.getAttribute("fNow_date"))){ %>
			<table class="table_1" style="font-size:14px;margin-bottom:5px;">
			   <tr>  
			     <td>
			                      ʱ�䷶Χ:
			              <font color="#FFA500">
			               <strong >
			               <%=request.getAttribute("fNow_date") %>		            
			                                                       ��
			               <%=request.getAttribute("now_date") %></strong>
			            </font>
			     </td>
			   </tr>
			</table>
		 <%} %>
			<table width="100%" class="table" >
			    <tr>
                   <th colspan="13" nowrap="nowrap" align="left">
                                                                      �豸�ӿ����ܹ��� 
                       <%if(deviceSwitch.equals("0")){ %>
                     <input name="switch" type="button" class="but_1" accesskey="a"
							tabindex="a" value="����" onclick="changeSwitch(<%=deviceSwitch %>);">
					 <%}else{ %>
					 <input name="switch" type="button" class="but_1" accesskey="a"
							tabindex="a" value="�ر�" onclick="changeSwitch(<%=deviceSwitch %>);">
					 <%} %>
                   </th>
                 </tr>
                   <tr class="title_3">
                       <td colspan="13">
						  ʱ�䷶Χ
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>
						IMEI						
						    <input id="phone" name="phone" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"phone");%>" size="15">											    
						�ӿ�
						    <input id="href" name="href" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"href");%>" size="9">
						�ӿ�˵��
						    <input id="func" name="func" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"func");%>" size="9">
						����ʱ�䷶Χ
						<%if(request.getAttribute("costTime1") != null){ %>
						    <input id="costTime1" name="costTime1" type="text" class="txt_1" 
						     value="<%=request.getAttribute("costTime1") %>" size="4">
						<%}else{ %>
						    <input id="costTime1" name="costTime1" type="text" class="txt_1" 
						    value="" size="4">
						<%} %>��
						<%if(request.getAttribute("costTime2") != null){ %>
						    <input id="costTime2" name="costTime2" type="text" class="txt_1" 
						    value="<%=request.getAttribute("costTime2") %>" size="4">
						<%}else{ %>
						    <input id="costTime2" name="costTime2" type="text" class="txt_1" 
						    value="" size="4">
						<%} %>ms
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr>
			<tr class="title_2">
					
					<td width="15%">
					     ����ʱ��
					</td>					
					<td width="20%">
						IMEI
					</td>				
					<td width="13%">
						��Ŀ
					</td>
					<td width="15%">
						����ʱ��(ms)
					</td>
					<td width="15%">
						�ӿ�
					</td>
					<td width="15%">
						�ӿ�˵��
					</td>
					<td width="15%">
						��������(B)
					</td>
				</tr>
				
				<logic:iterate id="element" name="pageList">
					 <tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >
						
						<td>
							<bean:write name="element" property="start_time" format="yyyy-MM-dd HH:mm:ss"/>
						</td>												
						<td>
							<a style="color: #0000FF"
								href="../../dyconfig/deviceActiveInfo/doDeviceActiveInfo.do?method=queryDeviceActiveInfo&deviceImei=<bean:write name="element" property="phone" />">
							<bean:write name="element" property="phone" />
							</a>
						</td>
						<td>
							<a style="color: #0000FF"  
								href="../../dyconfig/projectInfo/doProjectInfo.do?method=queryProjectInfo&projectId=<bean:write name="element" property="belong_project" />">
								<bean:write name="element" property="project_name"/> 
								</a>
						</td>
						<td>
							<bean:write name="element" property="cost_time"/>
						</td>
						<td>
							<bean:write name="element" property="function_href"/>
						</td>
						<td>
							<bean:write name="element" property="function"/>
						</td>
						<td>
							<bean:write name="element" property="len"/>
						</td>
					</tr>
				</logic:iterate>
				<tr class="title_3">
					
					<td align="left" colspan="7">	
						<%
							pys.printGoPage(response, "frmGo");
						%> 
					</td>
				</tr>
				</table>
		</form>
	</body>
</html>