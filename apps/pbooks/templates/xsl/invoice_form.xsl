<!--
Program: PBooks
Component: invoice_form.xsl
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:include href="accounting_menu.xsl"/>
<xsl:include href="date_select.xsl"/>
<xsl:template name="content">
<!-- include calendar js and css -->
<xsl:call-template name="calendar-inc"/>
<!-- Add / delete items -->
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/jquery.js">&#160;</script>
<script type="text/javascript">
    function journal_entry_amount_delete(entry_amount_id,row) {
            $.post("<xsl:value-of select="//link_prefix"/>journal-entry-amount-delete", 
            {
                'entry_amount_id': entry_amount_id
            }, 
            function (data){
            });
            myTable = document.getElementById("invoice_form_table");
            myTable.deleteRow(row);
    }
    function journal_entry_amount_create(entry_type_id,entry_id,entry_date) {
            $.post("<xsl:value-of select="//link_prefix"/>journal-entry-new-"+entry_type_id+"&amp;entry_id="+entry_id, 
            {
                'entry_id': entry_id,
                'entry_datetime': entry_date
            }, 
            function (data){
                setTimeout('window.location.reload()',200);
            });
    }
</script>

<h2><xsl:value-of select="/__ROOT__/i18n/labels/label[key='new_invoice']/value"/>:</h2> 
<form method="POST" action="{/__ROOT__/runtime/link_prefix}invoices-submit&amp;entry_id={/__ROOT__/_get/entry_id}&amp;view_flow=true">
<input type="hidden" name="entry_id" value="{/__ROOT__/_get/entry_id}"/>
<table border="0" id="invoice_form_table">
    <tbody>
        <tr>
            <td><xsl:value-of select="//label[key='date']/value"/>:</td><td colspan="8"><input type="text" name="entry_datetime" id="invoice_date" value="{//get_journal_entry/entry_date}"/></td>
        </tr>
        <tr>
            <td><xsl:value-of select="//label[key='customer']/value"/>:</td>
            <td>
            <select name="debit_account_id">
            <xsl:for-each select="/__ROOT__/get_all_accounts[accounts_receivable_account='on']">
                <option value="{id}"><xsl:if test="id=//get_some_business_objects/customer_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="name"/></option>
            </xsl:for-each>
            </select>&#160;
            </td>
            <td colspan="7">
            </td>
        </tr>
        <tr>
            <td><xsl:value-of select="/__ROOT__/i18n/labels/label[key='invoice_number']/value"/>:</td><td colspan="8"><input type="text" name="invoice_number" value="{//get_some_business_objects/invoice_number|//get_last_meta_id}"/></td>
        </tr>
        <tr>
            <td><xsl:value-of select="//label[key='due_date']/value"/>:</td><td colspan="8"><input type="text" name="due_date" value="{//get_some_business_objects/due_date}"/></td>
        </tr>
        <tr>
            <td><xsl:value-of select="//label[key='paid_status']/value"/>:</td>
			<td colspan="8">
	   			<input type="radio" name="paid_status" value="paid_in_full"/><xsl:value-of select="__ROOT__/i18n/labels/label[key='paid_in_full']/value"/><br/>
				<input type="radio" name="paid_status" value="paid"/><xsl:value-of select="__ROOT__/i18n/labels/label[key='paid']/value"/><br/>
				<input type="radio" name="paid_status" value="unpaid">
                    <xsl:if test="not(//get_some_business_objects/paid_status)">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                </input><xsl:value-of select="__ROOT__/i18n/labels/label[key='unpaid']/value"/><br/>
		</td>
		
	</tr>
    </tbody>
    <tbody>
        <tr>
            <td colspan="8"><xsl:value-of select="__ROOT__/i18n/labels/label[key='billable_items']/value"/>:</td>
        </tr>
        <tr>
            <td>ID</td>
            <td><xsl:value-of select="__ROOT__/i18n/labels/label[key='revenue']/value"/></td>
            <td><xsl:value-of select="__ROOT__/i18n/labels/label[key='desc']/value"/></td>
            <td width="240"></td>
            <td><xsl:value-of select="__ROOT__/i18n/labels/label[key='quantity']/value"/></td>
            <td><xsl:value-of select="__ROOT__/i18n/labels/label[key='price']/value"/></td>
            <td><xsl:value-of select="__ROOT__/i18n/labels/label[key='total']/value"/></td>
            <td><xsl:value-of select="__ROOT__/i18n/labels/label[key='edit']/value"/></td>
        </tr>
        
        <!-- INVOICE LINE ITEM ROWS -->
        <xsl:for-each select="//get_journal_entry[entry_type_id='Credit']">
        <xsl:variable name="my_entry_amount_id"><xsl:value-of select="entry_amount_id"/></xsl:variable>
        <tr id="i-{entry_amount_id}">
            <td><xsl:value-of select="entry_amount_id"/></td>
            <td>
                <select name="credit_account_1[]">
                    <option><xsl:value-of select="//label[key='select_one']/value"/></option>
                    <xsl:for-each select="/__ROOT__/get_all_accounts[account_type_id=40000]">
                        <xsl:variable name="my_account_id"><xsl:value-of select="id"/></xsl:variable>
                        <option value="{$my_account_id}"><xsl:if test="/__ROOT__/invoices_get_amounts[entry_amount_id=$my_entry_amount_id]/account_id=$my_account_id">
						<xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="name"/></option>
                    </xsl:for-each>
                </select>
            </td>
            <td colspan="2"><input type="text" name="memorandum[]" size="40" value="{/__ROOT__/ invoices_get_amounts[entry_amount_id=$my_entry_amount_id]/memorandum}"/></td>
            <td><input type="text" name="quantity" size="4"/></td>
            <td><input type="text" name="price" size="4"/></td>
            <td><input type="text" name="credit_amount_1[]" size="6" value="{/__ROOT__/ invoices_get_amounts[entry_amount_id=$my_entry_amount_id]/entry_amount}"/></td>
            <td>
                <xsl:if test="position() &gt; 1">
                <a href="{//link_prefix}journal_entry_amount_delete&amp;entry_amount_id={entry_amount_id}" 
                onclick="journal_entry_amount_delete({entry_amount_id},this.parentNode.parentNode.rowIndex); return false;">
                <img src="{//path_prefix}{//icon_set}delete.png" border="0" /></a>
                </xsl:if>
            </td>
        </tr>
        </xsl:for-each>
        <!-- END LINE ITEMS -->
        
        
        <tr>
            <td colspan="7"></td>
            <td><a href="{//link_prefix}journal-entry-new-credit&amp;entry_id={//_get/entry_id}">
    <img onclick="journal_entry_amount_create('credit',{//_get/entry_id}); return false;" src="{//path_prefix}{//icon_set}add.png" border="0"/></a></td>
        </tr>
        <tr>
            <td colspan="7"><input type="submit"/></td>
        </tr>
    </tbody>
</table>
</form>

<script type="text/javascript">
    Calendar.setup({
        inputField     :    "invoice_date",   // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false
    });
</script>
</xsl:template> 
</xsl:stylesheet>