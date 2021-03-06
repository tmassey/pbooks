<!--
Program: PBooks
Component: customer_accounts.xsl
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
  <xsl:include href="account_row.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:variable name="all_accounts"
    select="/_R_/get_all_accounts/get_all_accounts" />


<script type="text/javascript"
src="{$link_prefix}x-tablesorter-setup-js&amp;selector=accounts_table" />
<script type="text/javascript"
src="{$link_prefix}x-page-js&amp;selector=%23customers_table_body%20tr&amp;function=setup_rows" />

<!-- buttons on the right hand side -->
<div class="generic-button" style="float: right;">
  <xsl:if test="/_R_/runtime/show_all_accounts">
    <a href="{$link_prefix}customer-accounts&amp;show_all_accounts=off">
      <span id="i18n-hide_accounts">Hide Accounts</span>
    </a>
  </xsl:if>

  <xsl:if test="not(/_R_/runtime/show_all_accounts)">
    <a href="{$link_prefix}customer-accounts&amp;show_all_accounts=on">
      <span id="i18n-show_accounts">Customer Accounts</span>
    </a>
  </xsl:if>

  <a href="{$link_prefix}customer-edit" class="generic-button">
    <img src="{$path_prefix}{/_R_/runtime/icon_set}/folder_new.gif"/>
    <span id="i18n-new_customer">New Customer</span>
  </a>
</div>

<br/>
<br/>

<form method="post">
<div class="tableframe">
  <table class="tablesorter" id="accounts_table">
    <thead>
      <tr>
        <xsl:if test="/_R_/_get/show_all_accounts='on'">
          <th>
            <input type="checkbox"/>
          </th>
        </xsl:if>
        <th>
          <span id="i18n-number">Number</span>
        </th>
        <th>
          <span id="i18n-customer_name">Customer Name</span>
        </th>
        <th>
          <span id="i18n-balance">Balance</span>
        </th>
        <th>
          <span id="i18n-statement">Statement</span>
        </th>
        <th class="{{sorter: false}}">
          <span id="i18n-edit">Edit</span>
        </th>
        <th class="{{sorter: false}}">
          <span id="i18n-delete">Delete</span>
        </th>
      </tr>
    </thead>
    <tbody id="customers_table_body">

      <!--
      These are the account table rows.
      The tests are to decide how the table should be displayed,
      i.e. whether or not an account type is selected, or whether
      the account balance should be displayed.
      See account_row.xsl for the actual row data.
      -->

      <xsl:for-each select="$all_accounts[accounts_receivable_account='on']">
        <xsl:sort select="account_number"/>
        <xsl:call-template name="account-row">
          <xsl:with-param name="link_prefix" select="$link_prefix"/>
        </xsl:call-template>
      </xsl:for-each>

    </tbody>
  </table>
  <xsl:if test="/_R_/_get/show_all_accounts='on'">
    <input type="submit" name="submit" value="Submit"/>
  </xsl:if>
  </div>
</form>


  </xsl:template>
</xsl:stylesheet>
