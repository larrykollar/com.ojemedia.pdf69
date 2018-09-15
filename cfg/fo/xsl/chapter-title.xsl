<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">

<!-- revamp the chapter heading...
     all we're doing is taking the block wrapper out from the chap/app number -->

<xsl:template match="*" mode="insertChapterFirstpageStaticContent">
     <xsl:param name="type" as="xs:string"/>
     <fo:block>
         <xsl:attribute name="id">
             <xsl:call-template name="generate-toc-id"/>
         </xsl:attribute>
         <xsl:choose>
            <xsl:when test="$type = 'chapter'">
                 <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                     <xsl:call-template name="getVariable">
                         <xsl:with-param name="id" select="'Chapter with number'"/>
                         <xsl:with-param name="params">
                             <number>
                                <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                             </number>
                         </xsl:with-param>
                     </xsl:call-template>
                 </fo:block>
             </xsl:when>
             <xsl:when test="$type = 'appendix'">
               <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Appendix with number'"/>
                       <xsl:with-param name="params">
                          <number>
                            <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                          </number>
                       </xsl:with-param>
                  </xsl:call-template>
               </fo:block>
             </xsl:when>
           <xsl:when test="$type = 'appendices'">
             <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
               <xsl:call-template name="getVariable">
                 <xsl:with-param name="id" select="'Appendix with number'"/>
                 <xsl:with-param name="params">
                   <number>
                      <xsl:text>&#xA0;</xsl:text>
                   </number>
                 </xsl:with-param>
               </xsl:call-template>
             </fo:block>
           </xsl:when>
             <xsl:when test="$type = 'part'">
                     <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                         <xsl:call-template name="getVariable">
                             <xsl:with-param name="id" select="'Part with number'"/>
                             <xsl:with-param name="params">
                                 <number>
                                    <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                 </number>
                             </xsl:with-param>
                         </xsl:call-template>
                     </fo:block>
             </xsl:when>
             <xsl:when test="$type = 'preface'">
                     <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                         <xsl:call-template name="getVariable">
                             <xsl:with-param name="id" select="'Preface title'"/>
                         </xsl:call-template>
                     </fo:block>
             </xsl:when>
             <xsl:when test="$type = 'notices'">
                     <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                         <xsl:call-template name="getVariable">
                             <xsl:with-param name="id" select="'Notices title'"/>
                         </xsl:call-template>
                     </fo:block>
             </xsl:when>
         </xsl:choose>
     </fo:block>
 </xsl:template>

</xsl:stylesheet>
