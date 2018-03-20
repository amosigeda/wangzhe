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
	var versionCode = document.getElementById('versionCode').value;
	if(Date.parse(st) - Date.parse(et)>0){
		alert("��ʼʱ�䲻�ܴ��ڽ���ʱ��!");
		return false;
	}
	if(!isNumber(versionCode.trim()) && versionCode.trim() !=""){
		alert("�汾������д����");
		frmGo.versionCode.focus();
		return false;
		   }
	frmGo.action="doCheckInfo.do?method=queryCheckInfo";
	frmGo.submit();
}
function c(){
    document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.versionCode.value="";
    document.getElementById("belongProject").options[0].selected=true;
    document.getElementById("upType").options[0].selected=true;
    document.getElementById("versionType").options[0].selected=true;
    document.getElementById("status").options[0].selected=true;
} 
function addIDCode(){
	frmGo.action="doCheckInfo.do?method=initInsert";
	frmGo.submit();
}
function updateStatusEnable(id){
	if(confirm("ȷ�����ø�APK��")){
		frmGo.action="doCheckInfo.do?method=updateStatus&status=0&id="+id;
		frmGo.submit();
	}
}
function updateStatusDisable(id){
	if(confirm("ȷ�����ø�APK��")){
		frmGo.action="doCheckInfo.do?method=updateStatus&status=1&id="+id;
		frmGo.submit();
	}
}
function uploadApk(){
	frmGo.action="doCheckInfo.do?method=uploadCheckInfo";
	frmGo.submit();
}
function updateRemarks(id){
	frmGo.action="doCheckInfo.do?method=initUpdateRemarks&id="+id;
	frmGo.submit();
}
function updateUpUser(id){
	frmGo.action="doCheckInfo.do?method=initUpdateUpUser&id="+id;
	frmGo.submit();
}
function downloadApk(path,type,code){
	var obj = path.split(",");
	
	frmGo.action="doCheckInfo.do?method=downloadApk&download="+obj[0]+"&versionType="+obj[1]+"&IDCode="+obj[2];
   	frmGo.submit();
}
function del(id){
		if(confirm("ȷ��ɾ����?"))
		{
			frmGo.action = "doCheckInfo.do?method=deleteCheckInfo&id="+id+" ";
			frmGo.submit();
		}
}
</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post"
			action="doCheckInfo.do?method=queryCheckInfo">
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="13" nowrap="nowrap" align="left">
                APK������Ϣ
                <input name="addDevice" type="button" class="but_1" accesskey="a"
							tabindex="a" value="���ʶ����" onclick="addIDCode()">
				<input name="addDevice" type="button" class="but_1" accesskey="a"
							tabindex="a" value="�ϴ�APK" onclick="uploadApk()">
                </th>
                </tr>
                 <tr class="title_3">
                       <td colspan="13">
					  �ϴ�ʱ��
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>						
						�汾��
						    <input id="versionCode" name="versionCode" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"versionCode");%>" size="9">
						��Ŀ
							<%String belongProject = (String)request.getAttribute("belongProject"); %>
							<select id="belongProject" name="belongProject">
								<option value="">ȫ��</option>
								<logic:iterate id="pro" name="project">
									<bean:define id="projectId" name="pro" property="id" type="java.lang.Integer" />																	
									<option value='<%=projectId %>' <%=String.valueOf(projectId).equals(belongProject)? "selected" : "" %>><bean:write name="pro" property="project_name"/></option>
								</logic:iterate>
							</select>
						��������
							<%String upType = (String)request.getAttribute("upType"); %>
							<select id="upType" name="upType">
								<option value="">ȫ��</option>
								<option value="0" <%if(upType != null && upType.equals("0")){out.print("selected");} %> >����</option>
								<option value="1" <%if(upType != null && upType.equals("1")){out.print("selected");} %> >ǿ��</option>
								<option value="2" <%if(upType != null && upType.equals("2")){out.print("selected");} %> >����</option>
							</select>
						�汾����
							<%String versionType = (String)request.getAttribute("versionType"); %>
							<select id="versionType" name="versionType">
								<option value="">ȫ��</option>
								<option value="0" <%if(versionType != null && versionType.equals("0")){out.print("selected");} %> >�ڲ�</option>
								<option value="1" <%if(versionType != null && versionType.equals("1")){out.print("selected");} %>>�ⲿ</option>
							</select>
						״̬
							<%String status = (String)request.getAttribute("status"); %>
							<select id="status" name="status">
								<option value="">ȫ��</option>
								<option value="0" <%if(status != null && status.equals("0")){out.print("selected");} %> >����</option>
								<option value="1" <%if(status != null && status.equals("1")){out.print("selected");} %> >����</option>
							</select>
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr> 
				<%int i=1; %>
                  <tr class="title_2"> 
                  	<td width="8%" >ʶ����</td> 
                  	<td width="6%" >��Ŀ</td> 
                  	<td width="6%" >�汾����</td>
                  	<td width="5%" >�汾��</td>                  	                  	                                   	                 	
                  	<!-- <td width="10%" >����</td> -->
                  	<td width="7%" >�汾˵��</td>
                  	<td width="6%" >��������</td>
                  	<td width="6%" >�汾����</td>
                  	<td width="5%" >��ά��</td>
                  	<td width="6%" >�ϴ�ƽ̨</td>
                  	<td width="7%" >�ϴ�ʱ��</td>
                  	<td width="6%" >״̬</td>
                  	<td width="7%" >��ע</td>
                  	<td width="9%" >����</td>
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >						
						<td>
						<logic:empty name="element" property="ID_code" >��</logic:empty>
						<logic:notEmpty name="element" property="ID_code">
						<bean:write name="element" property="ID_code" />
						</logic:notEmpty>
						</td>
						<td>
						<logic:empty name="element" property="project_name" >��</logic:empty>
						<bean:write name="element" property="project_name" />
						</td>
						<td><bean:write name="element" property="version_name" /></td>
						<td><bean:write name="element" property="version_code" /></td>
												
						<!-- <td><bean:write name="element" property="package_name" /></td> -->
						<td>
						<logic:empty name="element" property="function_cap">��</logic:empty>
							<logic:notEmpty name="element" property="function_cap">
								<bean:write name="element" property="function_cap" />
							</logic:notEmpty>
						</td>			
						
						<td>
							<logic:equal name="element" property="up_type" value="0">����</logic:equal>
							<logic:equal name="element" property="up_type" value="1">ǿ��</logic:equal>
							<logic:equal name="element" property="up_type" value="2">����</logic:equal>
						</td>
						<td>
							<logic:equal name="element" property="version_type" value="0">�ڲ�</logic:equal>
							<logic:equal name="element" property="version_type" value="1">�ⲿ</logic:equal>
							<logic:equal name="element" property="version_type" value="2">����</logic:equal>
						</td>
						<td>
							<logic:equal name="element" property="er_weima" value="0">��</logic:equal>
							<logic:equal name="element" property="er_weima" value="1">��</logic:equal>
							<logic:empty name="element" property="er_weima">��</logic:empty>
						</td>
						<td>
							<logic:equal name="element" property="up_platform" value="0">��׿</logic:equal>
						</td>
						
						<td><bean:write name="element" property="upload_time" format="yyyy-MM-dd HH:mm:ss"/></td>
						<td>
							<logic:equal name="element" property="status" value="0"><font style="color:blue;">����</font></logic:equal>
							<logic:equal name="element" property="status" value="1"><font style="color:green;">����</font></logic:equal>
						</td>
						<td>
						<logic:empty name="element" property="remarks" >��</logic:empty>
						<logic:notEmpty name="element" property="remarks">
						<bean:write name="element" property="remarks" />
						</logic:notEmpty>
						</td>											
						<td>
							<logic:equal name="element" property="status" value="1"><a href=# onclick="updateStatusEnable('<bean:write name="element" property="id" />')" style="color:#0000FF" > �����á�</a></logic:equal>					
							<logic:equal name="element" property="status" value="0"><a href=# onclick="updateStatusDisable('<bean:write name="element" property="id" />')" style="color:green" > �����á�</a></logic:equal>
							<a href=# onclick="updateRemarks('<bean:write name="element" property="id" />')" style="color:#0000FF" > ����ע��</a>
							<logic:equal name="element" property="version_type" value="0">
							<a href=# onclick="updateUpUser('<bean:write name="element" property="id" />')" style="color:#0000FF" > �����á�</a>
							</logic:equal>
							<a href="#" onclick="downloadApk('<bean:write name="element" property="download_path" />,<bean:write name="element" property="version_type" />,<bean:write name="element" property="ID_code_id" />')" style="color:#0000FF" >�����ء�</a>
							<%-- <a href=# onclick="del('<bean:write name="element" property="id" />')" style="color:#0000FF" > ��ɾ����</a> --%>
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
