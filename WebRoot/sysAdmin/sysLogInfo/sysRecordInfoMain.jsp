<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ page import="com.care.common.lang.*"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
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
			src="<%=request.getContextPath()%>/js/jquery-1.8.2.js"></script> 
        <script language="JavaScript"
			src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>
	</head>
	<script language="javascript">
function finds(){
	if((frmGo.startTime.value.trim() != '')||(frmGo.endTime.value.trim() != '')){
	    if(frmGo.startTime.value.trim() == ''){
			alert("��ʼʱ�䲻��Ϊ�գ�");
			frmGo.tmBt0.focus();
			return false;			 
		}
		if(frmGo.endTime.value.trim() == ''){
			alert("����ʱ�䲻��Ϊ�գ�");
			frmGo.tmBt1.focus();
			return false;			 
		}
		var st = new Date(frmGo.startTime.value.replace(/-/g,'/'));
		var et = new Date(frmGo.endTime.value.replace(/-/g,'/'));
		if(Date.parse(st) - Date.parse(et)>0){
			alert("��ʼʱ�䲻�ܴ��ڽ���ʱ��!!����������");
			return false;
		}
	
	    frmGo.submit();
	}else{
		  frmGo.submit();
	}
}

function querySwitch(){
     frmGo.submit();
}
function del(){
	if(countBox()>0){
		if(confirm("ȷ��ɾ���𣬴˲������ɻָ�"))
		{
			frmGo.action = "doSysLogInfo.do?method=deleteSysLogInfo";
			frmGo.submit();
		}
	}else{alert("û��ѡ���¼");}
}
function c(){
	document.all.userName.value="";
	/* document.all.logs.value=""; */
	document.all.endTime.value="";
    document.all.startTime.value="";

}
function selectAll(){
   if(document.getElementById('allrow').checked){
   
   }else{
      if(document.all) {
        document.getElementById('allrow').click(); 
      } else { 
        var evt = document.createEvent("MouseEvents"); 
        evt.initEvent("click", true, true);
        document.getElementById('allrow').dispatchEvent(evt); 
      }
      document.getElementById('allrow').checked = true;          //���ں���
   }
    
}

function selectCanAll(){
    if(document.getElementById('allrow').checked){
      if(document.all) {
        document.getElementById('allrow').click(); 
       } else { 
        var evt = document.createEvent("MouseEvents"); 
        evt.initEvent("click", true, true);
        document.getElementById('allrow').dispatchEvent(evt); 
       }
         document.getElementById('allrow').checked = false;          //���ں���
   }else{
   
   } 
}
function ondel(uni,tag){
   if(uni != ''){
      if(confirm("ȷ��ɾ���𣬴˲������ɻָ�")){
         frmGo.action="doSysLogInfo.do?method=deleteSysLogInfo&uni="+uni+"&tag="+tag;
         frmGo.submit();
      }
   }else{
      if(countBox()>0){
		if(confirm("ȷ��ɾ���𣬴˲������ɻָ�"))
		{
            frmGo.action="doSysLogInfo.do?method=deleteSysLogInfo&uni="+uni+"&tag="+tag;
            frmGo.submit();
        }
	  }else{alert("û��ѡ���¼");}
   }  
}
</script>
	<body>
		<form name="frmGo" method="post" action="doSysLogInfo.do?method=querySysRecord">
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
                                                                     ��½��¼
                        <!-- <input name="" class="but_1" type="button" accesskey="" value="�����������־" onclick="location.href='doSysLogInfo.do?method=queryBeifenRecord'";>  -->                                             
                   </th>
                 </tr>
				<tr class="title_3">
					<td colspan="5">
					  ʱ�䷶Χ
					  <input name="startTime" type="text"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								size="15" class="Wdate" readonly> -
							<input name="endTime" type="text" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								size="15" class="Wdate" readonly>
                     <%-- <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly> --%>
						��¼�˺�
					    <%if(request.getAttribute("store")!=null){ %>
							<input name="userName" type="text" class="txt_1" id="userName"
								value="<%=request.getAttribute("store")%>" size="10">
						<%}else{%>
							<input id="userName" name="userName" type="text" class="txt_1"
								value="" size="10">
							<%}%>
					<%-- 	����
					    <%if(request.getAttribute("store2")!=null){ %>
							<input name="logs" type="text" class="txt_1" id="logs"
								value="<%=request.getAttribute("store2")%>" size="10">
						<%}else{%>
									<input id="logs" name="logs" type="text" class="txt_1" id="logs"
								value="" size="10">
							<%}%> --%>
					  
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
						 <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
					</td>
				</tr>
				<tr class="title_2">
					<!-- <td align="center" width="10%">&nbsp; 
					 <input name="allrow" type="checkbox" id="allrow" value="checkbox"
							onClick="selectAllRow();" style="display:none">
					</td> -->
					<td width="15%"> 
						�˺�
					</td>
					<td width="15%">  
						��½ʱ��
					</td>
					<td width="15%">
					    �˳�ʱ��
					</td>
					<!-- <td width="40%" align="left">
						����
					</td>   -->                
				</tr>
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >
						<%-- <td align="center" > 
						 <input name="crow" type="checkbox" id="crow" onclick="selectRow();"
								value='<bean:write name="element" property="id" />'>
					    </td> --%>
						<td >
						    <bean:write name="element" property="userName" />
						</td>
						<td >						  
							<bean:write name="element" property="logDate"
								format="yyyy-MM-dd HH:mm:ss" />
						</td>
                        <td>
                          	<bean:write name="element" property="outDate"
								format="yyyy-MM-dd HH:mm:ss" />
							<logic:empty name="element" property="outDate">��</logic:empty>	
                        </td>
						<%-- <td align="left" id="wrap" >
							<bean:write name="element" property="logs" />
						</td> --%>					
					</tr>
				</logic:iterate>
                <tr class="title_3">
                	<!-- <td align="left" colspan="2">
						<a href=# onClick="selectAll();" style="color:#0000FF;text-align:left">ȫѡ</a>/
						<a href=# onClick="selectCanAll();" style="color:#0000FF;text-align:left">ȡ��ȫѡ</a>-
					    <a href="#" onclick="ondel('',1)" style="color:#0000FF;text-align:left;">����ɾ��</a>
					</td> -->
					<td colspan="5" align="left" >
						<%
							pys.printGoPage(response, "frmGo");
						%>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
