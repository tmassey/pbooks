<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" encoding="UTF-8" omit-xml-declaration="no" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:template match="/">
<html>
<head>
	 <title><xsl:value-of select="/__ROOT__/i18n/labels/label[key='default_page_title']/value"/></title>
     <meta name="generator" content="Nexista" /> 
     <link rel="stylesheet" type="text/css" href="{//link_prefix}themed-css" ></link>
<xsl:for-each select="//in_head">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>
</head>
<body>
<xsl:for-each select="//pre_body_content">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>
<xsl:if test="/__ROOT__/_get/print='true'">
    <div onclick="window.location.href='{substring-before(//request_uri,'&amp;print=true')}';" 
    style="padding: 20px; width: 600px;">
    <xsl:call-template name="content"/>
    </div>
</xsl:if>
<xsl:if test="not(/__ROOT__/_get/print='true')">
    <xsl:call-template name="default"/>
</xsl:if>
</body>
</html>
</xsl:template>

<xsl:template name="default">

<div id="container">
<div id="capsule">
<div id="leftcol">
    <a href="index.php?nid=welcome"><img src="{/__ROOT__/runtime/top_left_logo}" border="0" alt="PBooks Logo"/></a>
    <xsl:if test="not(//_get/nid='login') 
    and not(//_get/nid='logout') 
    and not(//_get/nid='development-data-generator') 
    and not(contains(//_get/nid,'user'))
    and not(//_get/nid='group')
    and not(//_get/nid='group/edit')
    and not(contains(//_get/nid,'role'))">
    <xsl:call-template name="accounting-menu"/>
    </xsl:if>
</div>
<div id="header">
    <div id="top-block">&#160;
    
        <div id="company-name"><xsl:value-of select="//company_name"/></div>
        <div id="print-button"></div>
        
        <h1 class="page-title"><xsl:value-of select="/__ROOT__/i18n/labels/label[key=//_get/nid]/value"/></h1>
    
    </div>
    <!-- This is where the page content appears -->
    <xsl:comment>page content</xsl:comment>
    <div id="content">
    <xsl:call-template name="content"/>
    </div>
    <xsl:comment>end page content</xsl:comment>
</div>
</div>
<div id="foot">
<xsl:comment>You must keep this copyright notice intact.</xsl:comment>
    <a href="http://www.pbooks.org/" target="_blank" style="color: #FFF;">PBooks</a> version <xsl:value-of select="//pbooks_code_version"/>, DB Version: <xsl:value-of select="/__ROOT__/runtime/db_version"/>, Copyright <a href="http://www.savonix.com" target="_blank" style="color: #FFF;">Savonix</a>, all rights reserved. License: <a style="color: #FFF;" href="{/__ROOT__/runtime/link_prefix}license">AGPL v3</a>. <a style="color: #FFF;" href="http://www.pbooks.org/blog/download/">Download source</a>.
    <!-- Link to download source, as required by AGPL --></div>
</div>
<script type="text/javascript" src="{/__ROOT__/runtime/path_prefix}s/js/jsval.js"> &#160; </script>
<xsl:comment> footer code from plugins  </xsl:comment>
<xsl:for-each select="//footer">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>