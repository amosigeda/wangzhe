/**
  ʹ��˵����
  ��ʹ��ҳ��<head>���ּ��ϣ�
  <script language="javascript" src="g_js.js"></script>
  ��ҪӦ�õı�Ԫ�������ñ�����֧�ֵļ������ԣ���<input type="text" title="����˵������">

  ����˵����
  ��������ʾ�����ı�����������������ͣ�<input type="text"> <input type="password"> <textarea></textarea>
  ��Ԫ�ش���<input type=...> <select>

  ����1��
  ���ñ�Ԫ�ص�title���ԣ�һ��Ϊ��Ԫ�ص�˵�����֣�����Ԫ�صõ�����ʱ���Ҳ���ʾ�����֣�ʧȥ����ʱ���ء�
  ʾ����
  �ʺţ�<input type="text" title="��¼ʱ��ID��">

  ����2��
  �����ı����maxlen���ԣ������ı������ݵ��ֽڳ��ȣ�-- �����ַ���2���ֽڣ�Ӣ���ַ���1���ֽڼ��㣩�����û���������ݳ���ʱ���Զ���ȡ��
  �ı��������к�����ʾ�����������ռ��������󳤶ȵİٷֱȡ�
  ʾ����
  <input type="text" maxlen="6">

  ����3:
  �����ı����regExp���ԣ��ı���Ҫ���ϵ�������ʽ����regExpErrorInfo�����ݲ�����������ʽʱ����ʾ��Ϣ�������������ı���ı��ύʱ(onsubmit)��
  ��ʼ��֤�ı����������Ч�ԣ���������ϣ���ȡ���ύ���۽������ı�����ʾ�����Ϣ��
  Ҳ��������allowEmpty���ԣ��Ƿ�����Ϊ�ա���ֵΪtrueʱ�������Ϊ����ֱ��ͨ����֤����ֵΪfalseʱ�������Ϊ����ֱ�Ӳ�ͨ����֤��
  ����������������֤������������������ʽ��ȷ���Ƿ�ͨ����֤����
  ��������allowEmpty����ֵΪ"false"�ҵ�ǰ����Ϊ��ʱ����֤��ͨ����
  ��ʱ���������emptyErrorInfo������ʾ����Ϣ��
  ʾ����
  <form>
  ������<input type="text" regExp="[1-9][0-9]{0,3}" regExpErrorInfo="����Ϊ1��9999֮�������"><br>
  ������<input type="text" allowEmpty="false" emptyErroInfo="��������Ϊ��"><br>
  <input type="submit">
  </form>


*/

/**
  ��������
*/

//��Ϊtrue�Ż�֧���Զ����title��������
window.showTitleEnabled = true;

//��Ϊtrue�Ż�֧���Զ����regExp/regExpErrorInfo/allowEmpty/emptyErrorInfo��������
window.validateInputEnabled = true;
  //��Ϊtrue�Ż����ı�������ʾ���߱�������ݳ���
  window.validateInputLenShowProgressEnabled = false;

//��Ϊtrue�Ż�֧���Զ����maxlen����
window.limitInputLenEnabled = true;


//*********************************************************************************************************************
//**********************************----------------------------------------------------------------------------------
//�����Ǵ������ģ�ʹ���߲��ù��ġ�
//**********************************----------------------------------------------------------------------------------
//***********************************************************************************************************************



/**
* ȥ���ַ�������β�ո��tab�ַ�
* @return ȥ����β�ո���ַ���
* �÷� " abc ".trim()  -- ����ֵΪ"abc"
*/
String.prototype.trim = function()
{
  return this.replace(/(^\s+)|(\s+$)/g,"");
}

/**
* ȡ��һ���ַ������ֽڳ��ȣ��������ַ�ռ2���ֽڣ�Ӣ��1���ֽڼ��㣩
* @return ���ַ������ֽڳ���
* �÷� "abc�й�".len() -- ����ֵΪ7
*/
String.prototype.len = function()
{
  return this.replace(/[\u00FF-\uFFFF]/g,"aa").length;
}

/**
* ����һ���ַ���ǰ��ָ���ֽ��������ַ������������ַ�ռ2���ֽڣ�Ӣ��1���ֽڼ��㣩
* @return �ص������ַ���
* �÷� "abc�й�".head(4) -- ����"abc"
*      "abc�й�".head(5) -- ����"abc��"
*/
String.prototype.head = function(maxlen)
{
  var result = this;
  for(var i=this.length-1;i>=0;i--)
  {
    result = this.substring(0,i);
	if(result.len()<=maxlen)
	{
	  return result;
	}
  }
  return result;
}


/**
���´��빦�ܣ�
    �ı����ֽ����޳���Ӣ���ַ���1���ֽڣ����İ�2���ֽڼ��㡣

�÷�����ҳ���head���֣�����
    <script language="javascript" src="g_js.js"></script>

	��Ҫ���õ��ı�������maxlen���ԣ�����ֵΪ�����ֽ���������
<input type=text maxlen="6">
<input type=password maxlen="7">
<textarea maxlen="6"></textarea>

*/

/**�õ�һ��Ԫ�صľ�������ͳ���ֵ,��λ����
*@return һ���ṹ��
					left	���������xֵ
					top	���������yֵ
					width	Ԫ�صĿ��
					heigth	Ԫ�صĳ���
*/
function getAbsolutePos(obj)
{
  var left = obj.offsetLeft;
  var top = obj.offsetTop;
  var ele = obj;
  while((ele=ele.offsetParent)!=null)
  {
	left += ele.offsetLeft;
	top += ele.offsetTop;
  }

  return {
	  left:left,
	  top:top,
	  width:obj.offsetWidth,
	  height:obj.offsetHeight
	};
}

/**
* ��һ��Ԫ�ص�valueֵ�ص�ָ�����Ⱥ��沿��(Ӣ���ַ���1�������ַ���2����)
* @param theUniqueID Ԫ�ص�uniqueID
* @param maxlen ָ������󳤶�
*/
function trimValue(theUniqueID,maxlen)
{
  var obj = document.getElementById(theUniqueID);
  if(typeof(obj)=="undefined")return;
  if(obj.value.len()<=maxlen)return;
  var str = obj.value.head(maxlen);
  obj.value = str;

}

/**
* �ı����onpropertychange�¼�������
*/
function text_propertychange()
{
    if(event.propertyName!="value")return;
       var input = event.srcElement;
	var maxlen = input.getAttribute("maxlen");
	if(maxlen==null)return;
	maxlen = parseInt(maxlen);
	if(isNaN(maxlen))return;

	if(input.value.len()>maxlen)
	{
	  //alert("������ô��������" );
	  //input.value = input.value.head(maxlen);
	  input.blur();
	  input.focus();
	  setTimeout("trimValue('"+input.uniqueID+"',"+maxlen+")",1);

	}

    if(window.validateInputLenShowProgressEnabled)
		showProgress(input,input.value.len(),maxlen);
}

/**
* ���ı�������ʾ���ý�����
*/
function showProgress(input,curlen,maxlen)
{   var inputpos = getAbsolutePos(input);
    if(!input.progress)
    {
      var progress = document.createElement("<hr style='position:absolute;color:#FF0000'>");
	  document.body.insertBefore(progress);
	  input.progress = progress;
	  progress.style.left = inputpos.left;
      progress.style.top = inputpos.top + inputpos.height - 2;
	}

	var progress = input.progress;

    progress.style.width = (inputpos.width * curlen / maxlen) ;
}

/**
* ��ҳ��������������maxlen���Ե��ı���attach�¼�onpropertychange������valueֵ����ʱ�յ��¼�֪ͨ
*/


function limitTextLength()
{
  //��<input type=text maxlen="6">�� <input type=password maxlen="7">
  var inputs = document.all.tags("INPUT");
  if(typeof(inputs)!="undefined" && inputs!=null && inputs.length!=0)
  {
    for(var i=0;i<inputs.length;i++)
    {
      var input = inputs[i];
      var type = input.type;
      if(typeof(type)=="undefined" || type==null)continue;
      if(type=="text" || type=="password")
      {
        var maxlen = input.getAttribute("maxlen");
        if(typeof(maxlen)=="undefined")continue;
        maxlen = parseInt(maxlen);
        if(isNaN(maxlen))continue;
        input.attachEvent("onpropertychange",text_propertychange);
      }//end if
    }//end for
  }//end if

  //����textarea�޳�
  var inputs = document.all.tags("TEXTAREA");
  if(typeof(inputs)!="undefined" && inputs!=null && inputs.length!=0)
  {
    for(var i=0;i<inputs.length;i++)
    {
      var input = inputs[i];
      var maxlen = input.getAttribute("maxlen");
	  if(typeof(maxlen)=="undefined")continue;
	  maxlen = parseInt(maxlen);
	  if(isNaN(maxlen))continue;
	  input.attachEvent("onpropertychange",text_propertychange);
    }
	//end for
  }//end if
}//end function

//��ҳ��load���ʱִ��limitTextLength����
if(window.limitInputLenEnabled)
  window.attachEvent("onload",limitTextLength);


/**
* ����onsubmit������
* ��֤���еİ���regExp���Ե��ı�����������ϣ��۽�ѡ������ı��򣬲���ʾregExpErrorInfo�����趨��ֵ,�粻�裬��û����ʾ��
* ���������allowEmpty="true"�Ļ�������ı������ݿգ���ֱ����֤ͨ����
* ʾ���� 1.<input type="text" regExp="/^(13|8613)[0135-9][0-9]{8}$/g" regExpErrorInfo="��������Ч���ֻ�����">
        2.<input type="text" regExp="^(13|8613)[0135-9][0-9]{8}$" allowEmpty="true">
		�����������ݲ�����Ч���ֻ��ţ������ύʱ�Զ�ȡ���ύ��������1������ʾ��������Ч���ֻ����롣
*/
function form_submit()
{
  var form = event.srcElement;
  for(var i=0;i<form.elements.length;i++)
  {
	  var element = form.elements[i];
      if(element.type=="text" || element.type=="password" || element.type=="textarea")
	  {
         var regExp = element.getAttribute("regExp");
		 if(regExp==null || regExp=="")
			 continue;
		 try{
			var value = element.value;

			var allowEmpty = element.getAttribute("allowEmpty");

			//�����ȷ��ʾ����Ϊ�ն��ҵ�ǰֵΪ�յĻ�����ֱ��ͨ��
			if(allowEmpty=="true" && value=="")continue;

			//�����ȷ��ʾ������Ϊ���ҵ�ǰֵΪ�յĻ�����ֱ�ӽ�ֹ
			if(allowEmpty=="false" &&value=="")
			{
				element.focus();
				element.select();

				var emptyInfo = element.getAttribute("emptyInfo");
				if(emptyInfo!=null)
					alert(emptyInfo);

				return false;
			}

			//��֤������ʽ
			var reg = null;
			if(regExp.charAt(0)=="/")
				reg = eval(regExp);
			else
				reg = new RegExp(regExp,"g");
			var matched = value.match(reg);
			if(!matched)
			{
			  element.focus();
			  element.select();

			  var regExpErrorInfo = element.getAttribute("regExpErrorInfo");
			  if(regExpErrorInfo==null)continue;
			  alert(regExpErrorInfo);
			  return false;
			}
		 }catch(ex)
		  {

		  }

	  }

  }
}

function window_onload1()
{
  if(!document.forms)return;
  for(var i=0;i<document.forms.length;i++)
  {
	  var form = document.forms[i];
	  form.attachEvent("onsubmit",form_submit);
  }
}

if(window.validateInputEnabled)
  window.attachEvent("onload",window_onload1);



function getInfoPanel()
{
  if(!window.infoPanel)
  {
      var infoPanel = document.createElement("<div style='position:absolute;z-index:2;height:2px;border:solid 1px;background-color:#FCFCFC'></div>");
	  document.body.insertBefore(infoPanel);
	  window.infoPanel = infoPanel;
  }

  return window.infoPanel;
}
/**
* ����title���Եı�Ԫ�صõ�����ʱ�Ĵ�����
* ����<input type="text" title="��һ��">
*/
function element_onfocus()
{
  var element = event.srcElement;

  var title = element.getAttribute("title");

  var objpos = getAbsolutePos(element);
  var infoPanel = getInfoPanel();
  infoPanel.style.left = objpos.left + objpos.width + 2;
  infoPanel.style.top = objpos.top;
  infoPanel.innerText = title;
  infoPanel.style.display = "";
}

function element_onblur()
{
  var infoPanel = getInfoPanel();
  infoPanel.style.display = "none";
}

function window_onload2()
{
  var inputs = document.all.tags("INPUT");
  if(typeof(inputs)!="undefined" && inputs!=null && inputs.length!=0)
  {
    for(var i=0;i<inputs.length;i++)
    {
      var input = inputs[i];
      var type = input.type;
      if(typeof(type)=="undefined" || type==null)continue;
      var title = input.getAttribute("title");
	  if(title==null || title=="")continue;
	  input.attachEvent("onfocus",element_onfocus);
	  input.attachEvent("onblur",element_onblur);
    }//end for
  }//end if
/*  //�������ڿ���TEXTAREA����궨λ
  var inputs = document.all.tags("TEXTAREA");
  if(typeof(inputs)!="undefined" && inputs!=null && inputs.length!=0)
  {
    for(var i=0;i<inputs.length;i++)
    {
      var input = inputs[i];
      var title = input.getAttribute("title");
	  if(title==null)continue;
	  input.attachEvent("onfocus",element_onfocus);
	  input.attachEvent("onblur",element_onblur);
    }//end for
  }*///end if}
}

if(window.showTitleEnabled)
  window.attachEvent("onload",window_onload2);
