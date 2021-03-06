<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="/">
				<xsl:apply-templates select="books/item">
				</xsl:apply-templates>
</xsl:template>

<xsl:template match="item"><xsl:value-of select="keywords/keyword[1]" />,<xsl:value-of select="keywords/keyword[2]" />,<xsl:value-of select="keywords/keyword[3]" /></xsl:template>

</xsl:stylesheet>
