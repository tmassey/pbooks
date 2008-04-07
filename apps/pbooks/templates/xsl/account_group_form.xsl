<!--
Program: PBooks
Component: account_group_form.xsl
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
<xsl:include href="main.xsl"/>
<xsl:include href="accounting_menu.xsl"/>
<xsl:template name="content">
<form method="post" onSubmit="return validateStandard(this, 'myerror');">
<xsl:if test="//_get/id">
<input type="hidden" name="my_action" value="update"/>
<input type="hidden" value="{//_get/id}" name="id"/>
</xsl:if>
<xsl:if test="not(//_get/id)">
<input type="hidden" name="my_action" value="create"/>
</xsl:if>
<table class="form-table" cellpadding="10" cellspacing="0" border="0" align="center">
	<tr>
		<td>
            <xsl:value-of select="__ROOT__/i18n/labels/label[key='group_name']/value"/>:
        </td>
		<td>
            <input type="text" name="name" value="{//get_account_group_by_id/name|//_post/name}"
                required="1" err="{//error[key='missing_account_name']/value}"/>
        </td>
	</tr>
	<tr>
        <td>
            <xsl:value-of select="__ROOT__/i18n/labels/label[key='desc']/value"/>
        </td>
        <td>
            <textarea name="description" cols="40" rows="6">
                <xsl:value-of select="//get_account_group_by_id/description|//_post/description"/>
                &#160;
            </textarea>
        </td>
	</tr>
	<tr>
		<td>
            <xsl:value-of select="__ROOT__/i18n/labels/label[key='parent_group']/value"/>
        </td>
        <td>
        <select multiple="multiple" name="account_group_parents[]">
        <xsl:for-each 
        select="/__ROOT__/get_account_groups[not(//_get/id=id)]">
            <xsl:variable name="my_group_id"><xsl:value-of select="id"/></xsl:variable>
            <option value="{id}"><xsl:if test="/__ROOT__/get_account_group_by_id/parent_group_id=id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
            <xsl:if test="contains(//group[group_id=//_get/id],$my_group_id) and not(/__ROOT__/get_account_group_by_id/parent_group_id=id)"><xsl:attribute name="disabled">disabled</xsl:attribute></xsl:if><xsl:value-of select="name"/></option>
        </xsl:for-each>
        </select>
        </td>
	</tr>
	<tr>
		<td>
            <xsl:value-of select="__ROOT__/i18n/labels/label[key='sub_group']/value"/>
        </td>
        <td>
        <textarea readonly="readonly" cols="30" rows="8">
        <xsl:for-each select="//account_sub_groups/groups/group[not(.=//_get/id)]">
            <xsl:variable name="my_group_id"><xsl:value-of select="."/></xsl:variable>
            <xsl:value-of select="/__ROOT__/get_account_groups[id=$my_group_id]/name"/>
            <!-- This is a newline character -->
            <xsl:text>&#10;</xsl:text> 
        </xsl:for-each>
        </textarea>
        </td>
	</tr>
	<tr>
		<td><xsl:value-of select="__ROOT__/i18n/titles/title[key='accounts-edit']/value"/></td>
        <td>
        <xsl:for-each select="//account_groups_get_accounts">
            <a href="{/__ROOT__/runtime/link_prefix}accounts-edit&amp;id={id}" id="{account_number}-e"><xsl:value-of select="name"/></a><br/>
        </xsl:for-each>
        </td>
	</tr>
</table>
<table cellpadding="5" align="center">
	<tr>
		<td>
            <input type="submit" value="Save" name="submit"/>
        </td>
		<td>
            <input type="button" value="Cancel"
                onclick="window.location.href='{__ROOT__/runtime/link_prefix}account-groups'"/>
        </td>
	</tr>
</table>
</form>
</xsl:template>
</xsl:stylesheet>