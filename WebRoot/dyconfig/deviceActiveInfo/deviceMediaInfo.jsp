<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ page autoFlush="true"%>
<%
	/*ҳ������*/
	PagePys pys = (PagePys) request.getAttribute("PagePys");
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
			src="<%=request.getContextPath()%>/js/jquery.js"></script>
	</head>
<script language="javascript">
function finds(){
	frmGo.submit();
}
	function onView1(download){
		if(download.length == 0){
			alert("û��ͷ���ļ����޷����أ�");
			return false;
		}
		frmGo.action="doDeviceActiveInfo.do?method=downloadImg&download="+download;
	   	frmGo.submit();
	}
</script>
	<body>

		<form name="frmGo" method="post"
			action="doDeviceActiveInfo.do?method=queryMediaInfo">
			<table width="100%" class="table" >
               <tr>
                   <th colspan="13" nowrap="nowrap" align="left">��ɫ 
                  <!--  <input name="inset" type="button" class="but_1" accesskey="a"
							tabindex="a" value="��ӽ�ɫ" onclick="insert()"> --></th>
                </tr>         
                  <tr class="title_2">
								
					<td width="10%">
						�û�id
					</td>
					
					<td width="10%">
					    �����û�id
					</td>
					<td width="10%" >
					   �����û�id
					   </td>
					   <td width="10%" >
					   ��������
					   </td>
					   <td width="10%" >
					   ����ʱ��
					   </td>
					   <td width="10%" >
					   ״̬
					   </td>
					      <td width="10%" >
					   ����ʱ��
					   </td>
					   	<td width="10%">
						��Ϣ����
					</td>
				</tr>
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >
						<td>
							<bean:write name="element" property="id" />
						</td>
						
						<td>
							<bean:write name="element" property="from_id" />
						</td>
						<td>
							<bean:write name="element" property="to_id" />
						</td>
						<td>
						<logic:equal name="element" property="send_type" value="0">��Ϣ</logic:equal>
					<logic:equal name="element" property="send_type" value="1">�ļ�</logic:equal>
						</td>
						<td>
								<logic:empty name="element" property="send_time">��</logic:empty>
							<logic:notEmpty name="element" property="send_time">			
							<bean:write name="element" property="send_time" />
							</logic:notEmpty>
						</td>
						<td>
								<logic:empty name="element" property="status">��</logic:empty>
							<logic:notEmpty name="element" property="status">			
								<logic:equal name="element" property="status" value="0">���ͳɹ�</logic:equal>
					<logic:equal name="element" property="status" value="1">����ʧ��</logic:equal>	
							</logic:notEmpty>
					</td>
							<td>
							<bean:write name="element" property="time_length" />
						</td>
						<td>
							<logic:equal name="element" property="msg_content" value="0">��</logic:equal>
							<logic:notEqual name="element" property="msg_content" value="0">
								<a href=# onclick="onView1('<bean:write name="element" property="msg_content"/>')" style="color:#0000FF">����</a>
							</logic:notEqual>	
						</td>
					</tr>
				</logic:iterate>
			 	<tr class="title_3">
					<td colspan="8" align="left" >
						<%
							pys.printGoPage(response, "frmGo");
						%>
					</td>
				</tr>  
			</table>
		</form>
	</body>
</html>
