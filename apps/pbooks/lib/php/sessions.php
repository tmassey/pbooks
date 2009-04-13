<?php
/* <!--
Program: PBooks
Component: sessions.php
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
*/

$_SESSION['company_name']     = Nexista_Path::get('//option_get_company_name/option_get_company_name/company_name','flow');
$_SESSION['fiscal_period_id'] = Nexista_Path::get('//option_get_company_name/option_get_company_name/fiscal_period_id','flow');
$_SESSION['books_mode']       = Nexista_Path::get('//option_get_company_name/option_get_company_name/books_mode','flow');

?>