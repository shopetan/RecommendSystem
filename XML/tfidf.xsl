<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" />

<xsl:template match="/">
  <html>
     <body>
				<xsl:apply-templates select="books/item">
				</xsl:apply-templates>
		</body>
	</html>
</xsl:template>

<xsl:template match="item">
	<xsl:value-of select="description"/>
</xsl:template>

</xsl:stylesheet>
