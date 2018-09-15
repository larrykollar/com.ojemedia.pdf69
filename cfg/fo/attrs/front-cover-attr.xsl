<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">

    <xsl:attribute-set name="__frontmatter">
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__subtitle" use-attribute-sets="common.title">
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">140%</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner__container_content">
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner__oje__author" use-attribute-sets="common.title">
      <xsl:attribute name="space-before">0.6em</xsl:attribute>
      <xsl:attribute name="font-size">11pt</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
      <xsl:attribute name="line-height">130%</xsl:attribute>
    </xsl:attribute-set>

    <!-- note for future reference:
         absolute position is relative to top of page and left margin -->
    <xsl:attribute-set name="__oje_frontmatter_logo_container">
      <xsl:attribute name="position">absolute</xsl:attribute>
      <xsl:attribute name="top">6.5in</xsl:attribute>
      <xsl:attribute name="left">0in</xsl:attribute>
      <xsl:attribute name="bottom">8in</xsl:attribute>
      <xsl:attribute name="right">2in</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__oje_frontmatter_logo">
      <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
      <xsl:attribute name="max-width">1.25in</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
