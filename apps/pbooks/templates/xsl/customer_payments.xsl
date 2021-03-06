<!--
Program: PBooks
Component: customer_payments.xsl
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


<script type="text/javascript"
src="{$link_prefix}x-tablesorter-setup-js&amp;selector=my_payments" />

<script type="text/javascript"
src="{$link_prefix}x-page-js&amp;selector=%23my_payments%20tbody%20tr&amp;function=setup_rows" />

<div class="generic-button" style="float: right;">
  <a href="{$link_prefix}customer-payment-create" id="customer-payment-create">
    <img src="{$path_prefix}{/_R_/runtime/icon_set}/page_edit.gif"/>
    <span class="i18n-new_payment">New Payment</span>
  </a>
</div>
<div class="tableframe">
<table class="tablesorter" id="my_payments">
  <thead>
    <tr>
      <th>
        <span class="i18n-date">Date</span>
      </th>
      <th>
        <span class="i18n-customer">Customer</span>
      </th>
      <th>
        <span class="i18n-memo">Memorandum</span>
      </th>
      <th>
        <span class="i18n-amount">Amount</span>
      </th>
      <th>
        <span class="i18n-id">ID</span>
      </th>
    </tr>
  </thead>
  <tbody>
  <!-- START LOOP -->
  <xsl:for-each select="/_R_/get_some_business_objects/get_some_business_objects">
    <xsl:variable name="my_customer_id" select="account_id"/>
    <tr>
      <td>
        <xsl:value-of select="entry_datetime"/>
      </td>
      <td>
        <a href="{$link_prefix}ledger&amp;account_id={$my_customer_id}">
          <xsl:value-of select="substring(/_R_/get_all_accounts/get_all_accounts[id=$my_customer_id]/name,0,24)"/>
        </a>
      </td>
      <td>
        <a href="{$link_prefix}customer-payment-edit&amp;entry_id={entry_id}">
          <xsl:value-of select="memorandum"/>
        </a>
      </td>
      <td>
        <xsl:value-of select="entry_amount"/>
      </td>
      <td>
        <a href="{$link_prefix}customer-payment-edit&amp;entry_id={entry_id}">
          <xsl:value-of select="entry_id"/>
        </a>
      </td>
    </tr>
  </xsl:for-each>
  <!-- END LOOP -->
  </tbody>
</table>
</div>
<div class="table_controls">
<xsl:call-template name="pager">
  <xsl:with-param name="my-table">my_payments</xsl:with-param>
</xsl:call-template>
</div>


  </xsl:template>
</xsl:stylesheet>