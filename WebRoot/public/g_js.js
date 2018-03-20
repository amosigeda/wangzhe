/**
���ļ����ڴ�Ź��õ�js
*/
function getCookie(name)
{
  var arr = document.cookie.split(/;/g);
  if(!arr)return "";
  for(var i=0;i<arr.length;i++)
  {
        var aCookie = arr[i];
	var aArr = aCookie.split(/=/g);
	if(!aArr)continue;
	if(aArr.length!=2)continue;
	if(aArr[0].trim()==name)return aArr[1];
  }

  return "";
}
function setCookie(name,value)
{
	var d = new Date();
	d.setTime(d.getTime() + 365*24*60*60*1000);
	document.cookie = name + "=" + value + ";expires=" + d.toGMTString();
}

//�л��ؼ��Ŀɼ�/���ɼ���ʽ
function toggleDisplay(obj)
{
	if(obj.style.display == "none")
		obj.style.display = "";
	else
		obj.style.display = "none";
}

//�����ַ���str���ֽ�����������������֣��򷵻�ԭ���ȣ����򷵻س��ȵĶ���
function strlen(str)
{
	//����Ƿ��������
	var containsWideChar = false;
	for(var i=0;i<str.length;i++)
		if(str.charCodeAt(i)>255)
		{
			containsWideChar = true;
			break;
		}

	if(containsWideChar)
		return str.length*2;
	else
		return str.length;

}

//�Ƿ���ں���
String.prototype.isStrCN=function(){
	for(var i=0;i<this.length;i++)
		if(this.charCodeAt(i)>255)
		{
			return true;
		}
	return false;
}

String.prototype.trim = function()
{
  return this.replace(/(^\s+)|(\s+$)/g,"");
}

String.prototype.len = function()
{
  return this.replace(/[\u00FF-\uFFFF]/g,"aa").length;
}

function myover()
{
    for(var i=0;i<this.cells.length;i++)
    {
      var aCell = this.cells[i];
      aCell.style.backgroundColor = "#CCCCCC";
    }
}
function myout()
{
    for(var i=0;i<this.cells.length;i++)
    {
      var aCell = this.cells[i];
      aCell.style.backgroundColor = "";
    }

}

/**
* ����appendHandler("window.onload",myonload);
* ���ǰ�myonload�����ҽӵ�window.onload�¼��С��������window.onload��ǰ���ù������������ᶪʧ��
*
*/
function appendHandler(eventDesc,handler)
{
   var myevent = eval(eventDesc);
   var oldhandler = myevent;
   if(myevent)
   {
     var cmd = eventDesc + "=function(){oldhandler();handler();}";
     eval(cmd);
   }else
   {
     var cmd = eventDesc + "=handler";
   }
}

window.onload = function()
{
  //������ʽ
  var tbls = document.all.tags("TABLE");
  if(typeof(tbls)=="undefined" || tbls == null || tbls.length==0)return;
  for(var i=0;i<tbls.length;i++)
  {
	  var tbl = tbls[i];
	  if(tbl.className!="queryResult")continue;
	  var tbody = tbl.tBodies[0];
	  if(typeof(tbody)=="undefined" || tbody==null)continue;
	  for(var j=0;j<tbody.rows.length;j++)
	  {
		  var row = tbody.rows[j];
                  if(row.className!="")continue;
		  row.onmouseover = myover;
		  row.onmouseout = myout;
	  }
  }

  //��ť�ı������ʽ<input type=text> <input type=button>
  var inputs = document.all.tags("INPUT");
  if(typeof(inputs)!="undefined" && inputs!=null && inputs.length!=0)
  {
    for(var i=0;i<inputs.length;i++)
    {
      var input = inputs[i];
      var type = input.type;
      if(typeof(type)=="undefined" || type==null)continue;
      if(type=="text" || type=="password" || type=="file" )
      {
        input.className = "myINPUT";
      }else if(type=="button" || type=="submit" || type=="reset")
      {
        input.className = "myButton";
      }
    }
  }

}
