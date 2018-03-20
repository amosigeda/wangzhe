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
function add(){
	frmGo.action = "doCompanyInfo.do?method=initInsert";
	frmGo.submit();
}
function c(){
    document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.companyName.value="";
    document.getElementById("com_status").options[0].selected = true;
} 
function update(id){
	frmGo.action="doCompanyInfo.do?method=initCompanyUpdate&id="+id;
	frmGo.submit();
}

function changeCompany(obj){
	$.ajax({
		type:"get",
		url:"doProjectInfo.do?method=getProjectByCompanyId",
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


</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doCompanyInfo.do?method=queryCompanyInfo">
			
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="12" nowrap="nowrap" align="left">
                                               �ͻ���Ϣ
                     <input name="addCompany" type="button" class="but_1" accesskey="a"
							tabindex="a" value="�� ��" onclick="add()">
                </th>
                </tr>
                 <tr class="title_3">
                       <td colspan="13">
					  ����ʱ��
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>
					<%if((Boolean)request.getAttribute("showCompany")){ %>			
						��˾����	
						<%String company_id = (String)request.getAttribute("company_id"); %>			
							<select id="company_id" name="company_id" onchange="changeCompany(this.value)">
								<option value="">ȫ��</option>
								<logic:iterate id="com" name="company">
									<bean:define id="company" name="com" property="id" type="java.lang.Integer" />																	
									<option value='<%=company %>' <%=String.valueOf(company).equals(company_id)? "selected" : "" %>>
										<bean:write name="com" property="company_name"/>
									</option>
								</logic:iterate>
							</select>
					<%} %>			
						��Ӫ״̬
						<%if(request.getAttribute("com_status")!=null && !"".equals(request.getAttribute("com_status"))){ %>
						<%=request.getAttribute("com_status")%>
						<%}else{%>
						<select id="com_status" name="com_status">
							<option value="">ȫ��</option>
							<option value="0">��ͣ</option>
							<option value="1">����</option>	
					   </select>
					   <%}%>	
							
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr> 
				<%int i=1; %>
                  <tr class="title_2">
                  	
					<td width="10%">
						��˾���
					</td>
					<td width="10%">
						��˾����
					</td>
					<!-- <td width="10%">
						�ƹ�����
					</td> -->
					<td width="6%">
						��Ŀ��
					</td>
					<td width="6%">
						��Ӫ״̬
					</td>
					<td width="10%">
						����ʱ��
					</td>
					<td width="10%">
						��ע
					</td>
					  <td width="10%">
					   ����ʱ��
					</td>
					  <td width="10%">
						������
					</td>
					
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"'
						onmouseout='this.className="tr_5"'>
						
						<td>							
							<bean:write name="element" property="company_no" />
						</td>
						<td>							
							<bean:write name="element" property="company_name" />
						</td>
						<td>
							<logic:empty name="element" property="count_id">0</logic:empty>
							<a style="color: #0000FF" href="../projectInfo/doProjectInfo.do?method=queryProjectInfo&companyId=
								<bean:write name="element" property="id"/>">
								<bean:write name="element" property="count_id"/>
							</a>							
						</td>
						
						<td>
						   <logic:empty name="element" property="status">��</logic:empty>							
							<logic:equal name="element" property="status" value="0"><font color="red">��ͣ</font></logic:equal>							
							<logic:equal name="element" property="status" value="1"><font color="green">����</font></logic:equal>
						</td>
						<td>							
							<bean:write name="element" property="add_time" format="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>							
							<logic:empty name="element" property="remark">��</logic:empty>
							<logic:notEmpty name="element" property="remark">			
							<bean:write name="element" property="remark" />
							</logic:notEmpty>
						</td>	
						<td>
						<logic:empty name="element" property="update_time">��</logic:empty>
							<logic:notEmpty name="element" property="update_time">			
							<bean:write name="element" property="update_time" format="yyyy-MM-dd HH:mm:ss"/>
							</logic:notEmpty>							
							
						</td>
						 <td>
							<a href=# onclick="update('<bean:write name="element" property="id" />')" style="color:#0000FF">�����á�</a>
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