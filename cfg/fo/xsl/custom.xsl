<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">

    <!-- front cover processing -->
    <xsl:import href="front-cover.xsl"/>
    <xsl:import href="chapter-title.xsl"/>

    <!-- header processing (commons.xsl, static-content.xsl) -->

    <!-- get header variables -->
    <xsl:template name="getHeaderVars">
      <xsl:param name="arg"/>

      <xsl:variable name="topicType" as="xs:string">
        <xsl:call-template name="determineTopicType"/>
      </xsl:variable>

      <xsl:call-template name="getVariable">
        <xsl:with-param name="id" select="$arg"/>
        <xsl:with-param name="params">
          <topictype>
            <xsl:choose>
              <!-- TODO: make these en.xml variables to facilitate translation -->
              <xsl:when test="$topicType = 'topicChapter'">Chapter</xsl:when>
              <xsl:when test="$topicType = 'topicAppendix'">Appendix</xsl:when>
              <xsl:when test="$topicType = 'topicAppendices'">Appendix</xsl:when>
            </xsl:choose>
          </topictype>
          <prodname>
            <xsl:value-of select="$productName"/>
          </prodname>
          <heading>
            <fo:inline>
              <fo:retrieve-marker retrieve-class-name="current-header"/>
            </fo:inline>
          </heading>
          <number>
            <fo:inline>
              <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
            </fo:inline>
          </number>
          <pagenum>
            <fo:inline xsl:use-attribute-sets="__body__odd__header__pagenum">
              <fo:page-number/>
            </fo:inline>
          </pagenum>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:template>

    <xsl:template name="insertBodyOddHeader">
      <fo:static-content flow-name="odd-body-header">
          <fo:block xsl:use-attribute-sets="__body__odd__header">
            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
              <xsl:call-template name="getHeaderVars">
                <xsl:with-param name="arg" select="'Body odd header inner'"/>
              </xsl:call-template>
            </fo:inline>
            <fo:leader leader-pattern="space"/>
            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
              <xsl:call-template name="getHeaderVars">
                <xsl:with-param name="arg" select="'Body odd header'"/>
              </xsl:call-template>
            </fo:inline>
          </fo:block>
      </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <fo:block xsl:use-attribute-sets="__body__even__header">
              <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                <xsl:call-template name="getHeaderVars">
                  <xsl:with-param name="arg" select="'Body even header'"/>
                </xsl:call-template>
              </fo:inline>
              <fo:leader leader-pattern="space"/>
              <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                <xsl:call-template name="getHeaderVars">
                  <xsl:with-param name="arg" select="'Body even header inner'"/>
                </xsl:call-template>
              </fo:inline>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <fo:block xsl:use-attribute-sets="__body__first__header">
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <!-- duplicate even header -->
    <xsl:template name="insertBodyLastHeader">
        <fo:static-content flow-name="last-body-header">
          <fo:block xsl:use-attribute-sets="__body__even__header">
            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
              <xsl:call-template name="getHeaderVars">
                <xsl:with-param name="arg" select="'Body even header'"/>
              </xsl:call-template>
            </fo:inline>
            <fo:leader leader-pattern="space"/>
            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
              <xsl:call-template name="getHeaderVars">
                <xsl:with-param name="arg" select="'Body even header inner'"/>
              </xsl:call-template>
            </fo:inline>
          </fo:block>
        </fo:static-content>
    </xsl:template>

</xsl:stylesheet>
