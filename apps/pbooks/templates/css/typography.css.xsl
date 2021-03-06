<!--
Program: PBooks
Component: typography.css.xsl
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
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:template name="typography">

body {
  font: small sans-serif;
  text-align: center;
}

h2 {
  font-size: 18px;
  margin: .8em 0 .2em 0;
}

h3 {
  font-size: 14px;
  margin: .8em 0 .2em 0;
}

.journal-table tbody tr td {
  white-space: nowrap;
}

.page-title {
  font-size: 2.6em;
  line-height: 1.4em;
  text-indent: .5em;
  font-family: serif;
}

#journal-entry-form table {
   font-size: 11px;
}
table.tablesorter {
   font-size: 11px !important;
}
#footer {
  font-size: .82em;
  line-height: 2.2em;
  text-align: center;
}


.menu-sub-selected {
	font-weight: bold;
}
.menu-sub-selected, .menu-sub {
	text-indent: .5em;
	white-space: nowrap;
}


.journal-data-wrap td {
	white-space: normal;
  font-size: 11px;
}

a, a:visited {
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

.journal-table {
  font-size: 11px;
}

.journal-table thead th {
  font-weight: bold;
}

</xsl:template>
</xsl:stylesheet>