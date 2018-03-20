// ** I18N

// Calendar big5-utf8 language
// Author: Gary Fu, <gary@garyfu.idv.tw>
// Encoding: utf8
// Distributed under the same terms as the calendar itself.

// For translators: please use UTF-8 if possible.  We strongly believe that
// Unicode is the answer to a real internationalized world.  Also please
// include your contact information in the header, as can be seen above.
	
// full day names
Calendar._DN = new Array
("������",
 "����һ",
 "���ڶ�",
 "������",
 "������",
 "������",
 "������",
 "������");

// Please note that the following array of short day names (and the same goes
// for short month names, _SMN) isn't absolutely necessary.  We give it here
// for exemplification on how one can customize the short day names, but if
// they are simply the first N letters of the full name you can simply say:
//
//   Calendar._SDN_len = N; // short day name length
//   Calendar._SMN_len = N; // short month name length
//
// If N = 3 then this is not needed either since we assume a value of 3 if not
// present, to be compatible with translation files that were written before
// this feature.

// short day names
Calendar._SDN = new Array
("��",
 "һ",
 "��",
 "��",
 "��",
 "��",
 "��",
 "��");

// full month names
Calendar._MN = new Array
("һ��",
 "����",
 "����",
 "����",
 "����",
 "����",
 "����",
 "����",
 "����",
 "ʮ��",
 "ʮһ��",
 "ʮ����");

// short month names
Calendar._SMN = new Array
("һ��",
 "����",
 "����",
 "����",
 "����",
 "����",
 "����",
 "����",
 "����",
 "ʮ��",
 "ʮһ��",
 "ʮ����");

// tooltips
Calendar._TT = {};
Calendar._TT["INFO"] = "�P�";

Calendar._TT["ABOUT"] =
"DHTML Date/Time Selector\n" +
"(c) dynarch.com 2002-2005 / Author: Mihai Bazon\n" + // don't translate this this ;-)
"For latest version visit: http://www.dynarch.com/projects/calendar/\n" +
"Distributed under GNU LGPL.  See http://gnu.org/licenses/lgpl.html for details." +
"\n\n" +
"�����x�񷽷�:\n" +
"- ʹ�� \xab, \xbb ���o���x�����\n" +
"- ʹ�� " + String.fromCharCode(0x2039) + ", " + String.fromCharCode(0x203a) + " ���o���x���·�\n" +
"- ��ס����İ��o���Լӿ��xȡ";
Calendar._TT["ABOUT_TIME"] = "\n\n" +
"�r�g�x�񷽷�:\n" +
"- �c���κεĕr�g���ݿ�������ֵ\n" +
"- ͬ�r��Shift�I���c���ɜp����ֵ\n" +
"- �c��K��ҷ�ɼӿ��׃��ֵ";

Calendar._TT["PREV_YEAR"] = "��һ�� (��ס�x��)";
Calendar._TT["PREV_MONTH"] = "��һ�� (��ס�x��)";
Calendar._TT["GO_TODAY"] = "������";
Calendar._TT["NEXT_MONTH"] = "��һ�� (��ס�x��)";
Calendar._TT["NEXT_YEAR"] = "��һ�� (��ס�x��)";
Calendar._TT["SEL_DATE"] = "�x������";
Calendar._TT["DRAG_TO_MOVE"] = "��ҷ";
Calendar._TT["PART_TODAY"] = " (����)";

// the following is to inform that "%s" is to be the first day of week
// %s will be replaced with the day name.
Calendar._TT["DAY_FIRST"] = "�� %s �@ʾ��ǰ";

// This may be locale-dependent.  It specifies the week-end days, as an array
// of comma-separated numbers.  The numbers are from 0 to 6: 0 means Sunday, 1
// means Monday, etc.
Calendar._TT["WEEKEND"] = "0,6";

Calendar._TT["CLOSE"] = "�P�]";
Calendar._TT["TODAY"] = "����";
Calendar._TT["TIME_PART"] = "�c��or��ҷ�ɸ�׃�r�g(ͬ�r��Shift��p)";

// date formats
Calendar._TT["DEF_DATE_FORMAT"] = "%Y-%m-%d";
Calendar._TT["TT_DATE_FORMAT"] = "%a, %b %e";

Calendar._TT["WK"] = "�L";
Calendar._TT["TIME"] = "Time:";
