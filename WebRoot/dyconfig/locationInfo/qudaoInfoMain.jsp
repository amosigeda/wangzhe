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
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet"
	type="text/css">
<script language="JavaScript"
	src="<%=request.getContextPath()%>/public/public.js"></script>
<!-- ���ô˷��� -->
<script language="JavaScript"
	src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>
</head>
<script language="javascript">
function finds(){
   /*  var st = new Date(frmGo.startTime.value.replace(/-/g,'/'));
	var et = new Date(frmGo.endTime.value.replace(/-/g,'/'));
	if(Date.parse(st) - Date.parse(et)>0){
		alert("��ʼʱ�䲻�ܴ��ڽ���ʱ��!");
		return false;
	} */
	   frmGo.submit();
}
function c(){
    document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.gamename.value="";
    document.all.qudaonumber.value="";
  /*   document.all.locationType.options[0].selected=true;
    document.all.statusSelect.options[0].selected=true;
    document.all.projectId.value=""; */
} 

function del(id){
	if(confirm("ȷ��ɾ����?"))
	{
		frmGo.action = "doLocationInfo.do?method=deleteQuDaoInfo&id="+id+" ";
		frmGo.submit();
	}
}

function add(){
	frmGo.action = "doLocationInfo.do?method=initInsert";
	frmGo.submit();
}

function update(id){
	frmGo.action="doLocationInfo.do?method=initQuDaoInfoUpdate&id="+id;
	frmGo.submit();
}
function watermark(settings) {

    //Ĭ������
    var defaultSettings={
        watermark_txt:"text",
        watermark_x:30,//ˮӡ��ʼλ��x������
        watermark_y:75,//ˮӡ��ʼλ��Y������
        watermark_rows:8,//ˮӡ����
        watermark_cols:8,//ˮӡ����
        watermark_x_space:10,//ˮӡx����
        watermark_y_space:20,//ˮӡy����
        watermark_color:'#000000',//ˮӡ������ɫ
        watermark_alpha:0.3,//ˮӡ͸����
        watermark_fontsize:'13px',//ˮӡ�����С
        watermark_font:'΢���ź�',//ˮӡ����
        watermark_width:190,//ˮӡ���
        watermark_height:120,//ˮӡ����
        watermark_angle:38//ˮӡ��б����
    };
    //�����������滻Ĭ��ֵ����������jquery.extend
    if(arguments.length===1&&typeof arguments[0] ==="object" )
    {
        var src=arguments[0]||{};
        for(key in src)
        {
            if(src[key]&&defaultSettings[key]&&src[key]===defaultSettings[key])
                continue;
            else if(src[key])
                defaultSettings[key]=src[key];
        }
    }

    var oTemp = document.createDocumentFragment();

    //��ȡҳ�������
    var page_width = Math.max(document.body.scrollWidth,document.body.clientWidth);
    //��ȡҳ����󳤶�
    var page_height = Math.max(document.body.scrollHeight,document.body.clientHeight);

    //�����ˮӡ��������Ϊ0����ˮӡ�������ù��󣬳���ҳ������ȣ������¼���ˮӡ������ˮӡx����
    if (defaultSettings.watermark_cols == 0 ||
 ��������(parseInt(defaultSettings.watermark_x 
��������+ defaultSettings.watermark_width *defaultSettings.watermark_cols 
��������+ defaultSettings.watermark_x_space * (defaultSettings.watermark_cols - 1)) 
��������> page_width)) {
        defaultSettings.watermark_cols = 
������������parseInt((page_width
��������������������-defaultSettings.watermark_x
��������������������+defaultSettings.watermark_x_space) 
��������������������/ (defaultSettings.watermark_width 
��������������������+ defaultSettings.watermark_x_space));
        defaultSettings.watermark_x_space = 
������������parseInt((page_width 
��������������������- defaultSettings.watermark_x 
��������������������- defaultSettings.watermark_width 
��������������������* defaultSettings.watermark_cols) 
��������������������/ (defaultSettings.watermark_cols - 1));
    }
    //�����ˮӡ��������Ϊ0����ˮӡ�������ù��󣬳���ҳ����󳤶ȣ������¼���ˮӡ������ˮӡy����
    if (defaultSettings.watermark_rows == 0 ||
 ��������(parseInt(defaultSettings.watermark_y 
��������+ defaultSettings.watermark_height * defaultSettings.watermark_rows 
��������+ defaultSettings.watermark_y_space * (defaultSettings.watermark_rows - 1)) 
��������> page_height)) {
        defaultSettings.watermark_rows = 
������������parseInt((defaultSettings.watermark_y_space 
����������������������+ page_height - defaultSettings.watermark_y) 
����������������������/ (defaultSettings.watermark_height + defaultSettings.watermark_y_space));
        defaultSettings.watermark_y_space = 
������������parseInt((page_height 
��������������������- defaultSettings.watermark_y 
��������������������- defaultSettings.watermark_height 
��������������������* defaultSettings.watermark_rows) 
������������������/ (defaultSettings.watermark_rows - 1));
    }
    var x;
    var y;
    for (var i = 0; i < defaultSettings.watermark_rows; i++) {
        y = defaultSettings.watermark_y + (defaultSettings.watermark_y_space + defaultSettings.watermark_height) * i;
        for (var j = 0; j < defaultSettings.watermark_cols; j++) {
            x = defaultSettings.watermark_x + (defaultSettings.watermark_width + defaultSettings.watermark_x_space) * j;

            var mask_div = document.createElement('div');
            mask_div.id = 'mask_div' + i + j;
            mask_div.appendChild(document.createTextNode(defaultSettings.watermark_txt));
            //����ˮӡdiv��б��ʾ
            mask_div.style.webkitTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
            mask_div.style.MozTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
            mask_div.style.msTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
            mask_div.style.OTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
            mask_div.style.transform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
            mask_div.style.visibility = "";
            mask_div.style.position = "absolute";
            mask_div.style.left = x + 'px';
            mask_div.style.top = y + 'px';
            mask_div.style.overflow = "hidden";
            mask_div.style.zIndex = "9999";
            //mask_div.style.border="solid #eee 1px";
            mask_div.style.opacity = defaultSettings.watermark_alpha;
            mask_div.style.fontSize = defaultSettings.watermark_fontsize;
            mask_div.style.fontFamily = defaultSettings.watermark_font;
            mask_div.style.color = defaultSettings.watermark_color;
            mask_div.style.textAlign = "center";
            mask_div.style.width = defaultSettings.watermark_width + 'px';
            mask_div.style.height = defaultSettings.watermark_height + 'px';
            mask_div.style.display = "block";
            oTemp.appendChild(mask_div);
        };
    };
    document.body.appendChild(oTemp);
}

</script>
<body>

<script type="text/javascript">  
watermark({ watermark_txt: "Mwtx4v9CJLi3sWu9rddtcw==" })//���붯̬ˮӡ����24  13

//onloadʱ����ˮӡ����
//window.onload=function(){
//watermark({ watermark_txt: "����ˮӡ" });
//};

//onresizeʱ����ˮӡ����
//window.onresize = function () {
//watermark({ watermark_txt: "����ˮӡ",watermark_width:50 }) 
//};
    </script>  
	<span class="title_1"></span>
	<form name="frmGo" method="post"
		action="doLocationInfo.do?method=queryQuDaoInfo">
		<table width="100%" class="table" border=0 cellpadding="0"
			cellspacing="1">
			<tr>
				<th colspan="25" nowrap="nowrap" align="left">������Ϣ <input
					type="button" class="but_1" accesskey="a" tabindex="a" value="�� ��"
					onclick="add()">

				</th>
			</tr>
			<tr class="title_3">
				<td colspan="25">
					<%-- ���� <input name="startTime" type="text"
					id="startTime" style="cursor:text"
					value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" size="15"
					class="Wdate" readonly> - <input name="endTime" type="text"
					id="endTime" style="cursor:text"
					value="<%CommUtils.printReqByAtt(request,response,"now_date");%>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" size="15"
					class="Wdate" readonly>  --%> ����<input id="startTime"
					name="startTime" type="text" class="txt_1"
					value="<%CommUtils.printReqByAtt(request,response,"startTime");%>"
					size="15"> �� <input id="endTime" name="endTime" type="text"
					class="txt_1"
					value="<%CommUtils.printReqByAtt(request,response,"endTime");%>"
					size="15"> ��Ϸ<input id="gamename" name="gamename"
					type="text" class="txt_1"
					value="<%CommUtils.printReqByAtt(request,response,"gamename");%>"
					size="20"> ������<input id="qudaonumber" name="qudaonumber"
					type="text" class="txt_1"
					value="<%CommUtils.printReqByAtt(request,response,"qudaonumber");%>"
					size="20"> <%-- 	��λ����<%if(request.getAttribute("locationType") != null && !"".equals(request.getAttribute("locationType"))){%>
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
							</select> --%> <input name="find1" type="button" class="but_1"
					accesskey="f" tabindex="f" value="��ѯ" onclick="javascript:finds()">
					<input name="clear" type="button" class="but_1" accesskey="c"
					tabindex="c" value="�������" onclick="c()">
			</tr>
			<%int i=1; %>
			<tr class="title_2">
				<td width="6%">����</td>
				<td width="6%">��Ϸ����</td>
				<td width="8%">������</td>
				<td width="6%">�����û�</td>
				<td width="6%">��Ծ�û�</td>
				<td width="6%">�����û�</td>
				<td width="6%">��Ӫ��ˮ(Ԫ)</td>
				<td width="6%">����ARPU</td>
				<td width="6%">��ԾARPU</td>
				<td width="6%">������</td>
				<td width="6%">����������</td>
				<td width="6%">����������</td>
				<td width="6%">����������</td>
				<td width="6%">����</td>
			</tr>

			<logic:iterate id="element" name="pageList">
				<tr class="tr_5" onmouseover='this.className="tr_4"'
					onmouseout='this.className="tr_5"'>
					<td><bean:write name="element" property="createtime" /></td>
					<td><bean:write name="element" property="gamename" /></td>
					
					<td style="vertical-align:middle">
					  <p style="margin:0px; padding:0px;"><bean:write name="element" property="qudaonumber" /></p>
                      <p style="margin:0px; padding:0px;">δ��������</p> 
					</td>
					
					<td><bean:write name="element" property="insertuser" /></td>
					<td><bean:write name="element" property="liveuser" /></td>
					<td><bean:write name="element" property="payuser" /></td>
					<td><bean:write name="element" property="runwater" /></td>
					<td><bean:write name="element" property="payarpu" /></td>
					<td><bean:write name="element" property="livearpu" /></td>

					<td><logic:empty name="element" property="payrate">-</logic:empty>
						<logic:notEmpty name="element" property="payrate">
							<bean:write name="element" property="payrate" />%
							</logic:notEmpty></td>

					<td><logic:empty name="element" property="erkeep">-</logic:empty>
						<logic:notEmpty name="element" property="erkeep">
							<bean:write name="element" property="erkeep" />%
							</logic:notEmpty></td>

					<td><logic:empty name="element" property="sankeep">-</logic:empty>
						<logic:notEmpty name="element" property="sankeep">
							<bean:write name="element" property="sankeep" />%
							</logic:notEmpty></td>

					<td><logic:empty name="element" property="qikeep">-</logic:empty>
						<logic:notEmpty name="element" property="qikeep">
							<bean:write name="element" property="qikeep" />%
							</logic:notEmpty></td>

					<td>
					<a href=# onclick="update('<bean:write name="element" property="id" />')" style="color:#0000FF">���ġ�</a>
					<a href=#
						onclick="del('<bean:write name="element" property="id" />')"
						style="color:#0000FF"> ��ɾ��</a></td>
				</tr>
			</logic:iterate>

			<tr class="title_3">
				<td colspan="25" align="left">
					<%
							pys.printGoPage(response, "frmGo");
						%>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>