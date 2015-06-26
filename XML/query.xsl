<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" />
<xsl:param name="title"/>
<xsl:param name="creator"/>

<xsl:template match="/">
    <html>
	     <body>
				<xsl:value-of select="concat('Search Title : ', $title)"/>,
				<xsl:value-of select="concat('Search Creator : ', $creator)"/>

				<table border="1">
					<tr>
						<th>ISBN</th>
						<th>タイトル</th>
					</tr>

				<xsl:apply-templates select="books/item[contains(title,$title)] or books/item[contains(creator,$creator)]">
					<xsl:sort select="date/year" data-type="number" order="descending"/>
					<xsl:sort select="date/month" data-type="number" order="descending"/>
					<xsl:sort select="date/day" data-type="number" order="descending"/>
				</xsl:apply-templates>

				<xsl:apply-templates select="books/item[contains(creator,$creator)]">
					<xsl:sort select="date/year" data-type="number" order="descending"/>
					<xsl:sort select="date/month" data-type="number" order="descending"/>
					<xsl:sort select="date/day" data-type="number" order="descending"/>
					</xsl:apply-templates>

				</table>

				</body>
	    </html>
			</xsl:template>

<xsl:template match="item">

		<tr>
			<td><xsl:value-of select="isbn" /></td>
			<td>
			<a>
        <xsl:attribute name="href"><xsl:value-of select="concat('/~shopetan/markuplang/2015_0615/detail/',@no,'.html')"/></xsl:attribute>
				<xsl:value-of select="title" />
			</a></td>
		</tr>
		</xsl:template>

</xsl:stylesheet>
