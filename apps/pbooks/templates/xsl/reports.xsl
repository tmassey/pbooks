<!--
Program: PBooks
Component: reports.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">
	<xsl:include href="html_main.xsl"/>
	<xsl:template name="content">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>


<!-- Main reports -->
<h2>
	<span class="i18n-report_type">Report Type</span>
</h2>
<form method="get">
	<input type="hidden" name="nid" value="{/_R_/_get/nid}-build"/>
	<table>
		<tr>
			<td>
				<span class="i18n-report_type">Report Type</span>:
			</td>
			<td>
				<select name="report_type_id">
					<xsl:for-each select="//report_types/report_type">
						<xsl:variable name="mykey" select="@key"/>
						<option value="{@id}">
							<xsl:value-of select="//i18n/*[local-name()=$mykey]"/>
						</option>
					</xsl:for-each>
				</select>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<span class="i18n-period">Period</span>:
			</td>
			<td>
				<xsl:call-template name="date_select">
					<xsl:with-param name="my_from_date">
						<xsl:value-of select="substring(/_R_/runtime/prev_from_date,0,5)"/>-<xsl:value-of select="//fiscal_start"/>
					</xsl:with-param>
				</xsl:call-template>
			</td>
		</tr>
	</table>
	<div style="text-align: center; margin-top:2em;">
		<input type="submit" value="Build Report" name="submit" />
	</div>

	<!-- Saved reports -->
	<h2>
		<span class="i18n-saved_reports">Saved Reports</span>
	</h2>
	<ul style="big">
		<xsl:for-each select="//reports_saved/report">
			<li>
				<a href="{$link_prefix}reports-build&amp;{link}">
					<xsl:value-of select="label"/>
				</a>
			</li>
		</xsl:for-each>
	</ul>

	<!-- Additional reports -->
	<h2>
		<span class="i18n-additional_reports">Additional Reports</span>
	</h2>
	<ul style="big">
		<li>
			<a href="{$link_prefix}accounts">
				<span id="i18n_trial-balance">Trial Balance</span>
			</a>
		</li>
		<li>
			<a href="{$link_prefix}reports-simple-cash-flow">
				<span class="i18n-simple_monthly_cash_flow">Simple Monthly Cash Flow</span>
			</a>
		</li>
		<li>
			<a href="{$link_prefix}reports-group-cash-flow">
				<span class="i18n-group_monthly_cash_flow">Account Group Monthly Cash Flow</span>
			</a>
		</li>
		<li>
			<a href="{$link_prefix}reports-invoices">
				<span class="i18n-report_invoices">Invoices Report</span>
			</a>
		</li>
	</ul>
</form>


	</xsl:template>
</xsl:stylesheet>