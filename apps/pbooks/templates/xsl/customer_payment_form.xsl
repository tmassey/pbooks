<!--
Program: PBooks
Component: customer_payment_form.xsl
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

		<xsl:variable name="account_business_objects"
		select="/_R_/account_business_objects/account_business_objects" />
		<xsl:variable name="get_journal_entry"
		select="/_R_/get_journal_entry/get_journal_entry" />
		<xsl:variable name="business_object_get_metadata"
		select="/_R_/business_object_get_metadata/business_object_get_metadata" />


<h2>
	<span id="i18n-customer_payments">Customer Payments</span>
</h2>

<form action="{$link_prefix}customer-payment-submit&amp;entry_id={/_R_/_get/entry_id}"
method="post" onSubmit="return validateStandard(this, 'myerror');">

	<input type="hidden" name="customer_payment" value="true"/>
	<input type="hidden" name="entry_id" value="{/_R_/_get/entry_id}"/>
	<input type="hidden" name="fiscal_period_id" value="{$get_journal_entry/fiscal_period_id}"/>
	<input type="hidden" name="payment_account_id" value="{//runtime/payment_account_id}"/>
	<div id="business_object_slip">
		<div id="payment_date">
			<span id="i18n-date">Date</span>:
			<input type="text" name="entry_datetime"
			style="width: 6em;" value="{$get_journal_entry/entry_date}"/>
		</div>
		<div id="payment_memo">
			<span id="i18n-memo">Memorandum</span>:
			<input type="text" name="memorandum" style="width: 20em;"
			value="{$get_journal_entry/memorandum}"/>
		</div>
		<div id="payment_payee">
			<table border="0" id="payment_form_table">
				<tr>
					<td>
						<span id="i18n-amount">Amount</span>
					</td>
					<td />
					<td>
						<!--
						<xsl:value-of select="$i18n/outstanding_invoices"/>
						-->
					</td>
					<td>
						<span id="i18n-customer">Customer</span>
					</td>
				</tr>
				<xsl:for-each select="$get_journal_entry[entry_type_id='Credit']">
					<xsl:variable name="my_entry_amount_id" select="entry_amount_id"/>
					<tr id="ea_{$my_entry_amount_id}">
						<td>
							<input type="text" name="entry_amount[]" style="width: 60px;"
							value="{$get_journal_entry[entry_amount_id=$my_entry_amount_id]/entry_amount}"/>
						</td>
						<!-- Additional payment line items. -->
						<td>
							<xsl:if test="position() &gt; 1">
								<a href="{$link_prefix}journal_entry_amount_delete&amp;entry_amount_id={entry_amount_id}"
								onclick="journal_entry_amount_delete({entry_amount_id}); return false;">
									<img src="{$path_prefix}{/_R_/runtime/icon_set}delete.png" />
								</a>
							</xsl:if>
						</td>
						<!-- OUTSTANDING INVOICES DROP DOWN LIST HERE -->
						<!--
						<td>
							<select name="from_account_id" required="0" exclude="-1" err="{$i18n/error_select_credit}">
								<option value="0">
									<xsl:value-of select="$i18n/not_applicable"/>
								</option>
								<xsl:for-each select="/_R_/get_some_business_objects/get_some_business_objects">
									<xsl:variable name="my_new_entry_id">
										<xsl:value-of select="entry_id"/>
									</xsl:variable>
									<xsl:variable name="my_customer_id">
										<xsl:value-of select="customer_id"/>
									</xsl:variable>

									<option value="{id}">
										<xsl:if test="id=//metadata/metadata/account_id and not(/_R_/_get/transaction_id)">
											<xsl:attribute name="selected">selected</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="$business_object_get_metadata[meta_key='invoice_number' and entry_id=$my_new_entry_id]/meta_value"/>, 
										<xsl:value-of select="substring(/_R_/get_all_accounts/get_all_accounts[id=$my_customer_id]/name,0,12)"/>

										<xsl:value-of select="name"/>
									</option>
								</xsl:for-each>
							</select>
						</td>
						-->
						<td />
						<td>
							<!-- Customer -->
							<select name="revenue_account_id" required="1" exclude="-1" err="Error">
								<xsl:for-each select="/_R_/get_all_accounts/get_all_accounts[accounts_receivable_account='on']">
									<option value="{id}" id="ra_{id}">
										<xsl:if test="id=$get_journal_entry/account_id and not(/_R_/_get/transaction_id)">
											<xsl:attribute name="selected">selected</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="substring(name,0,16)"/>
									</option>
								</xsl:for-each>
							</select>
						</td>
					</tr>
				</xsl:for-each>
			</table>
			<!-- Link to journal entry form. -->
			<div style="float: right">
				<a href="{$link_prefix}journal-entry&amp;entry_id={/_R_/_get/entry_id}">
					<span id="i18n-edit_journal_entry">Edit Journal Entry</span>
				</a>
			</div>
		</div>
	</div>
	<input type="submit" id="submit-me"/>
</form>


	</xsl:template>
</xsl:stylesheet>