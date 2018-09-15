<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">

    <xsl:template name="createFrontCoverContents">
      <!-- set the title -->
      <fo:block xsl:use-attribute-sets="__frontmatter__title">
        <xsl:choose>
          <xsl:when test="$map/*[contains(@class,' topic/title ')][1]">
            <xsl:apply-templates select="$map/*[contains(@class,' topic/title ')][1]"/>
          </xsl:when>
          <xsl:when test="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]">
            <xsl:apply-templates select="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]"/>
          </xsl:when>
          <xsl:when test="//*[contains(@class, ' map/map ')]/@title">
            <xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')]"/>
          </xsl:otherwise>
        </xsl:choose>
      </fo:block>
      <!-- set the subtitle -->
      <xsl:apply-templates select="$map//*[contains(@class,' bookmap/booktitlealt ')]"/>

      <!-- extract whatever metadata we're going to use -->
      <fo:block xsl:use-attribute-sets="__frontmatter__owner">
        <xsl:apply-templates select="$map//*[contains(@class,' bookmap/bookmeta ')]"/>
      </fo:block>

      <!-- logo -->
      <fo:block-container xsl:use-attribute-sets="__oje_frontmatter_logo_container">
        <fo:block>
          <fo:external-graphic xsl:use-attribute-sets="__oje_frontmatter_logo"
            src="url('Customization/OpenTopic/common/artwork/logo.png')"/>
        </fo:block>
      </fo:block-container>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' bookmap/bookmeta ')]">
        <fo:block>
          <xsl:apply-templates select="*[contains(@class,' topic/author')]" mode="oje-bookauthor"/>
        </fo:block>
        <fo:block>
          <xsl:apply-templates select="*[contains(@class,' bookmap/bookrights ')]"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class,' topic/author ')]" mode="oje-bookauthor">
      <fo:block xsl:use-attribute-sets="__frontmatter__owner__oje__author">
        <xsl:apply-templates/>
      </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class,' bookmap/bookrights ')]">
      <xsl:if test="*[contains(@class, ' bookmap/copyrfirst ')]">
        <fo:block xsl:use-attribute-sets="__frontmatter__owner__oje__author">
          <xsl:text>Copyright © </xsl:text>
          <xsl:value-of select="*[contains(@class,' bookmap/copyrfirst ')][1]/*[contains(@class, ' bookmap/year ')][1]"/>
          <xsl:if test="*[contains(@class, ' bookmap/copyrlast')]">
            <xsl:text>– </xsl:text>
            <xsl:value-of select="*[contains(@class,' bookmap/copyrlast ')][1]/*[contains(@class, ' bookmap/year ')][1]"/>
          </xsl:if>
          <xsl:if test="*[contains(@class,' bookmap/bookowner ')]">
            <xsl:text> </xsl:text>
            <xsl:value-of select="*[contains(@class,' bookmap/bookowner ')][1]/*[contains(@class, 'bookmap/person ')][1]"/><xsl:text>.</xsl:text>
            <xsl:if test="*[contains(@class,' bookmap/bookrestriction ')]">
              <xsl:text> </xsl:text>
              <!-- TODO: if @href is present, make this a link. -->
              <xsl:value-of select="*[contains(@class,' bookmap/bookrestriction ')][1]/@value"/><xsl:text>.</xsl:text>
            </xsl:if>
          </xsl:if>
        </fo:block>
      </xsl:if>
    </xsl:template>

</xsl:stylesheet>
