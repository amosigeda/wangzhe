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
	frmGo.action = "doDynamicInfo.do?method=initInsert";
	frmGo.submit();
}
function c(){
    document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.menuLeave.value="";
} 
function update(id){
	frmGo.action="doDynamicInfo.do?method=initDynamicInfoUpdate&id="+id;
	frmGo.submit();
}
function deleteDynamicInfo(id){
	if(confirm("ȷ��ɾ����")){
		frmGo.action="doDynamicInfo.do?method=deleteDynamicInfo&id="+id+" ";
		frmGo.submit();
	}
}
</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doDynamicInfo.do?method=queryDynamicInfo">
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="12" nowrap="nowrap" align="left">
                                              ��̬�˵�����
                     <input name="addDynamic" type="button" class="but_1" accesskey="a"
							tabindex="a" value="�� ��" onclick="add()">
                </th>
                </tr>
                 <tr class="title_3">
                       <td colspan="13">
                       �˵��ȼ�<%if(request.getAttribute("menuLeave") != null && !"".equals(request.getAttribute("menuLeave"))){%>
						<%=request.getAttribute("menuLeave")%>
						<%}else{ %>
						<select id="menuLeave" name="menuLeave">
							<option value="">ȫ��</option>
							<option value="1">һ���˵�</option>
							<option value="2">�����˵�</option>
						</select>
						<%} %>
					 ���ʱ��
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>
					
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr> 
				<%int i=1; %>
                  <tr class="title_2">
					<td width="4%">
						�˵�ID
					</td>
					<td width="5%">
						�˵�����
					</td>
					<td width="5%">
						Ӣ������
					</td>					
					<td width="5%">
						�ϼ��˵�����
					</td>
					<td width="5%">
						�˵��ȼ�
					</td>
					<td width="5%">
						�˵�����
					</td>
					<!-- <td width="5%">
						�Ӳ˵����� -->
					</td>
					<td width="5%">
						�Ƿ���Ч
					</td>
					<td width="5%">
						���ʱ��
					</td>
					<td width="6%">
						����
					</td>
					<td width="6%">
						����
					</td>
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"'
						onmouseout='this.className="tr_5"'>
						<td>							
							<bean:write name="element" property="id" />
						</td>
						<td>							
							<bean:write name="element" property="nc_name" />
						</td>
						<td>							
							<bean:write name="element" property="mName" />
						</td>						
						<td>							
							<bean:write name="element" property="superId" />
						</td>
						<td>							
								<logic:equal name="element" property="menuLeave" value="1"><font color="red">һ���˵�</font></logic:equal>							
							<logic:equal name="element" property="menuLeave" value="2"><font color="green">�����˵�</font></logic:equal>
							<logic:equal name="element" property="menuLeave" value="0">����ǩ</font></logic:equal>
							
						</td>
						<td>							
							<bean:write name="element" property="menuRank"/>
						</td>
						<%-- <td>							
							<bean:write name="element" property="submenuNumber"/>
						</td> --%>
						<td>							
							<logic:equal name="element" property="effect" value="0"><font color="red">����Ч</font></logic:equal>							
							<logic:equal name="element" property="effect" value="1"><font color="green">��Ч</font></logic:equal>
						</td>
						<td>							
							<bean:write name="element" property="add_time" format="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>							
							<logic:empty name="element" property="m_describe">��</logic:empty>
							<logic:notEmpty name="element" property="m_describe">
								<bean:write name="element" property="m_describe" />
							</logic:notEmpty>
						</td>										 						
						 <td>
							<a href=# onclick="update('<bean:write name="element" property="id" />')" style="color:#0000FF">�����á�</a>
						     <a href=# onclick="deleteDynamicInfo('<bean:write name="element" property="id" />')" style="color:#0000FF" > ��ɾ����</a> 
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