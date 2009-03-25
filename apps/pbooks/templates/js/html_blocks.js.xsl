<!--
Program: PBooks
Component: html_blocks.js.xsl
Copyright: Savonix Corporation
Author: Albert L. Lash, IV
License: Gnu Affero Public License version 3
http://www.gnu.org/licenses

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
	<xsl:template match="/">
			<![CDATA[
/*
news=document.createElement("div");
newtext=document.createTextNode("first");
news.setAttribute("id","notitle");
news.appendChild(newtext);
*/
var html2dom_root = document.createElement('div');
html2dom_root_1_div = document.createElement("div");
html2dom_root_1_div.setAttribute("style", "background: orange");
html2dom_root_1_div_1_text = document.createTextNode("DOM me!");
html2dom_root_1_div.appendChild(html2dom_root_1_div_1_text);
html2dom_root_1_div_2_comment = document.createComment("i'm just a comment");
html2dom_root_1_div.appendChild(html2dom_root_1_div_2_comment);
html2dom_root.appendChild(html2dom_root_1_div);

$(document).ready(function() {
		$("#notitle").replaceWith(html2dom_root);
});

			]]>
<!-- The test
var text = "<div/>";
var parser=new DOMParser();
xmlDoc=parser.parseFromString(text,"text/xml");
newel=xmlDoc.createElement("div");
var choice = "dm";
var iterations = 4500;

if (choice == "dom") {
	var i=0;
	for (i=0;i<=iterations;i++)
	{
		news=xmlDoc.createElement("span");
		newel.appendChild(news);
		newtext=xmlDoc.createTextNode("first");
		news.appendChild(newtext);
	}
} else {
	var mypostbutton = '<div>';
	for (i=0;i<=iterations;i++)
	{
		mypostbutton = mypostbutton + '<span>first</span>';
	}
	newel = mypostbutton + '</div>';
}
$(document).ready(function() {
		$("#notitle").replaceWith(newel);
});
-->
	</xsl:template>
</xsl:stylesheet>