<!-- 
Program: PBooks
Component: reports.xsl
Copyright 2003-2007, Albert L. Lash, IV
Savonix Corporation
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:import href="date_select.xsl"/>
<xsl:include href="accounting_menu.xsl"/>
<xsl:template name="content">
<!-- Main reports -->
<h2><xsl:value-of select="//label[key='report_type']/value"/></h2>
<form method="get">
<input type="hidden" name="nid" value="{/__ROOT__/_get/nid}-build"/>
<table>
	<tr>
		<td><xsl:value-of select="//label[key='report_type']/value"/>:</td>
		<td> <select name="report_type_id">
				<xsl:for-each select="//report_types/report_type">
                    <xsl:variable name="mykey"><xsl:value-of select="@key"/></xsl:variable>
					<option value="{@id}"><xsl:value-of select="//label[key=$mykey]/value"/></option>
				</xsl:for-each>
			</select>
		</td>
	</tr>
	<tr>
		<td valign="top"><xsl:value-of select="//label[key='period']/value"/>:</td>
		<td>
		<xsl:call-template name="date_select">
            <xsl:with-param name="my_from_date"><xsl:value-of select="//fiscal_start"/></xsl:with-param>
        </xsl:call-template>
		</td>
	</tr>
</table>
<div style="text-align: center; margin-top: 20px;">
    <input type="submit" value="{//label[key='build_report']/value}" name="submit" />
</div>

<!-- Saved reports -->
<h2><xsl:value-of select="//label[key='saved_reports']/value"/></h2>
<ul style="big">
    <li><a href="{//link_prefix}reports-build&amp;report_type_id=3&amp;from_date=2007-01-01&amp;to_date=2007-12-31&amp;submit=Build+Report">2007 Balance Sheet</a></li>
    <li><a href="{//link_prefix}reports-build&amp;report_type_id=1&amp;from_date=2007-01-01&amp;to_date=2007-12-31&amp;submit=Build+Report">2007 Cash Flow Statement</a></li>
    <li><a href="{//link_prefix}reports-build&amp;report_type_id=2&amp;from_date=2007-01-01&amp;to_date=2007-12-31&amp;submit=Build+Report">2007 Profit and Loss Statement</a></li>
</ul>

<!-- Additional reports -->
<h2><xsl:value-of select="//label[key='additional_reports']/value"/></h2>
<ul style="big">
    <li><a href="{//link_prefix}reports-simple-cash-flow"><xsl:value-of select="//label[key='simple_monthly_cash_flow']/value"/></a></li>
</ul>
</form>	
</xsl:template>
</xsl:stylesheet>