<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="FormData" select="$RtnDoc/Form8866AttachmentsStatement"/>
		 <!--  - Form 8866 displays as - IRS Form 8866 Attachments Statement - -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$FormData"/>
    </xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template name="ShowTable">
    <table id="DataTbl" class="styDepTbl" style="border:none;">
        <tr>
          <td class="styDepTblCell" style="border:none;text-align:left">            
            <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$FormData/MediumExplanationTxt"/>
			</xsl:call-template>             
          </td>                      
        </tr>
    </table>
  </xsl:template>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Polina Zhuravlev"/>
         <meta name="Description" content="{$depDocTitle}"/>        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>    
          <style type="text/css">
            <xsl:if test="not($Print) or $Print=''">
              <xsl:call-template name="AddOnStyle"/>    
            </xsl:if>
          </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head> 
      <body class="styBodyClass">    
        <xsl:call-template name="DocumentHeaderDependency"/>        
        <div class="styDepTitleLine">
        <span class="styDepTitle"  style="padding-right:2mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>        
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>    
        <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl">
            <b>Explanation: </b>
          </div> 
          <xsl:call-template name="ShowTable"/>
        </div>        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>