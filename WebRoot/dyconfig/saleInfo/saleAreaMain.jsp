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
	long total = 0; 
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
		frmGo.submit();
	}
	function c(){
   		document.all.userName.value="";   
	} 

	</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doSaleInfo.do?method=querySaleAreaInfo">						
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="14" nowrap="nowrap" align="left">
                                            �����������
                </th>
                </tr>            
                <!--  <tr class="title_3">
                       <td colspan="14">					
						�û���				
						    <input id="userName" name="userName" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"userName");%>" size="9">
						
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr>  -->
				<logic:iterate id="element" name="pageList">
			 <bean:define id="sale_counts" name="element" property="id" 
			    type="java.lang.Long" />
			   <%
			       total=total+sale_counts;
			   %>
			 </logic:iterate>
                  <tr class="title_2">     
                  	<td width="10%">ʡ��</td> 
                  	<td width="10%" >ע���û���</td>           	
                  	<td width="10%" >����ٷְ�</td> 
                  	<td width="10%" ></td>                 	                           						 
				</tr>
 				<tr class="title_4">
 					<td><strong>�ܼ�</strong></td>
 					<td><strong><%=total %></strong></td>
 					<td>100%</td>
 					<td></td>
 				</tr>
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >
						<bean:define id="sale_count" name="element" property="id" 
			    			type="java.lang.Long" />
						<td><bean:write name="element" property="province"/></td>						
						<td><bean:write name="element" property="id"/></td>
						<td>
							 <%
						   float ss = (float)sale_count/total;
						   NumberFormat nf =  NumberFormat.getPercentInstance();
						   nf.setMinimumFractionDigits(2);
						   %>	
						   <%=nf.format(ss)%>
						</td>
						<td></td>																							 						
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