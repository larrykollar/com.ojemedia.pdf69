<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">

    <!-- front cover -->
    <xsl:import href="front-cover-attr.xsl"/>

    <!-- page layout (basic-settings.xsl) -->
    <xsl:variable name="page-width">6in</xsl:variable>
    <xsl:variable name="page-height">9in</xsl:variable>

    <xsl:variable name="page-margin-inside">0.75in</xsl:variable>
    <xsl:variable name="page-margin-outside">0.5in</xsl:variable>
    <xsl:variable name="page-margin-top">0.75in</xsl:variable>
    <xsl:variable name="page-margin-bottom">0.5in</xsl:variable>
    <xsl:variable name="mirror-page-margins" select="true()"/>
    <xsl:variable name="side-col-width">0pt</xsl:variable>

    <xsl:variable name="default-font-size">11pt</xsl:variable>
    <xsl:variable name="default-line-height">13pt</xsl:variable>
    <xsl:variable name="monospace-font-size">11pt</xsl:variable>

    <xsl:attribute-set name="common.block">
      <xsl:attribute name="space-before">0.6em</xsl:attribute>
      <xsl:attribute name="space-after">0.6em</xsl:attribute>
      <xsl:attribute name="text-align">justify</xsl:attribute>
      <xsl:attribute name="widows">2</xsl:attribute>
      <xsl:attribute name="orphans">2</xsl:attribute>
      <xsl:attribute name="hyphenate">true</xsl:attribute>
      <xsl:attribute name="font-family">Serif</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="common.title">
      <xsl:attribute name="font-family">Sans</xsl:attribute>
      <xsl:attribute name="color">#444444</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="common.border__top">
      <xsl:attribute name="border-before-style">solid</xsl:attribute>
      <xsl:attribute name="border-before-width">1pt</xsl:attribute>
      <xsl:attribute name="border-before-color">black</xsl:attribute>
      <xsl:attribute name="border-color">#444444</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="common.border__bottom">
      <xsl:attribute name="border-after-style">solid</xsl:attribute>
      <xsl:attribute name="border-after-width">1pt</xsl:attribute>
      <xsl:attribute name="border-after-color">#444444</xsl:attribute>
      <xsl:attribute name="border-color">#444444</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="common.border__right">
      <xsl:attribute name="border-end-style">solid</xsl:attribute>
      <xsl:attribute name="border-end-width">1pt</xsl:attribute>
      <xsl:attribute name="border-end-color">black</xsl:attribute>
      <xsl:attribute name="border-color">#444444</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="common.border__left">
      <xsl:attribute name="border-start-style">solid</xsl:attribute>
      <xsl:attribute name="border-start-width">1pt</xsl:attribute>
      <xsl:attribute name="border-start-color">black</xsl:attribute>
      <xsl:attribute name="border-color">#444444</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic__shortdesc" use-attribute-sets="body common.block">
    </xsl:attribute-set>


    <!-- header and footer attributes (static-content-attr.xsl) -->
    <xsl:attribute-set name="ojemedia.header.common" use-attribute-sets="common.border__bottom">
      <xsl:attribute name="space-before">0.375in</xsl:attribute>
      <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">3pt</xsl:attribute>
      <xsl:attribute name="text-align">justify</xsl:attribute>
      <xsl:attribute name="text-align-last">justify</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="odd__header" use-attribute-sets="ojemedia.header.common">
      <xsl:attribute name="start-indent"><xsl:value-of select="$page-margin-inside"/></xsl:attribute>
      <xsl:attribute name="end-indent"><xsl:value-of select="$page-margin-outside"/></xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="even__header" use-attribute-sets="ojemedia.header.common">
      <xsl:attribute name="start-indent"><xsl:value-of select="$page-margin-outside"/></xsl:attribute>
      <xsl:attribute name="end-indent"><xsl:value-of select="$page-margin-inside"/></xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__header">
      <xsl:attribute name="border-after-style">none</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__odd__header">
      <xsl:attribute name="border-after-style">none</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__even__header">
      <xsl:attribute name="border-after-style">none</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="pagenum">
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__odd__header__heading">
      <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__header__heading">
      <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <!-- blockquotes (topic-attr.xsl) -->
    <xsl:attribute-set name="lq" use-attribute-sets="common.block">
      <xsl:attribute name="margin-left">0.25in</xsl:attribute>
      <xsl:attribute name="margin-right">0.25in</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="lq_simple" use-attribute-sets="common.block lq">
    </xsl:attribute-set>

    <!-- list items (lists-attr.xsl) -->
    <xsl:attribute-set name="ul.li">
        <xsl:attribute name="space-after">0.6em</xsl:attribute>
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
        <xsl:attribute name="relative-align">baseline</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol.li">
        <xsl:attribute name="space-after">0.6em</xsl:attribute>
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
        <xsl:attribute name="relative-align">baseline</xsl:attribute>
    </xsl:attribute-set>

    <!-- monospace bits (pr-domain-attr.xsl, topic-attr.xsl) -->
    <xsl:attribute-set name="codeph">
      <xsl:attribute name="font-family">monospace</xsl:attribute>
      <xsl:attribute name="font-size"><xsl:value-of select="$monospace-font-size"/></xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="pre" use-attribute-sets="base-font common.block">
        <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
        <xsl:attribute name="white-space-collapse">false</xsl:attribute>
        <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="font-family">monospace</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$monospace-font-size"/></xsl:attribute>
        <xsl:attribute name="line-height">110%</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

    <!-- chapter heading -->
    <xsl:attribute-set name="__chapter__frontmatter__name__container" use-attribute-sets="common.title">
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="padding-top">1in</xsl:attribute>
        <xsl:attribute name="space-after">0em</xsl:attribute>
        <xsl:attribute name="border-before-style">none</xsl:attribute>
        <xsl:attribute name="border-after-style">none</xsl:attribute>
    </xsl:attribute-set>

    <!-- chapter title -->
    <xsl:attribute-set name="topic.title" use-attribute-sets="common.title common.border__bottom">
      <xsl:attribute name="space-before">0em</xsl:attribute>
      <xsl:attribute name="space-after">1em</xsl:attribute>
      <xsl:attribute name="font-size">18pt</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
      <xsl:attribute name="border-before-style">none</xsl:attribute>
      <xsl:attribute name="padding-bottom">3pt</xsl:attribute>
    </xsl:attribute-set>

    <!-- TOC chapter (toc-attr.xsl) -->
    <xsl:attribute-set name="__toc__chapter__content" use-attribute-sets="__toc__topic__content">
      <xsl:attribute name="font-size">14pt</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="padding-top">20pt</xsl:attribute>
      <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    </xsl:attribute-set>


</xsl:stylesheet>
