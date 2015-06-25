<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" />
<xsl:param name="title"/>

<xsl:template match="/">
    <html>
	     <body>
				<table border="1">
					<tr>
						<th>ISBN</th>
						<th>タイトル</th>
						<th>著者</th>
						<th>出版社</th>
						<th>年 - 月 - 日</th>
						<th>キーワード</th>
					</tr>
				<memo><xsl:value-of select="concat('Search Title : ', $title)"/></memo>
				<xsl:apply-templates select="books/item[title=$title]">
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
  		<td><xsl:value-of select="title" /></td>
  		<td><xsl:value-of select="creator" /></td>
			<td><xsl:value-of select="publisher" /></td>
  		<td><xsl:value-of select="date/year" />-<xsl:value-of select="date/month" />-<xsl:value-of select="date/day" /></td>
			<td><xsl:value-of select="keywords/keyword" /></td>
		</tr>

</xsl:template>


</xsl:stylesheet>
