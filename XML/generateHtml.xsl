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
						<th>著者</th>
						<th>出版社</th>
            <th>価格</th>
						<th>年 - 月 - 日</th>
            <th>キーワード</th>
            <th>説明</th>
					</tr>
				<xsl:apply-templates select="books/item">
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
        <xsl:attribute name="href"><xsl:value-of select="url/@resource"/></xsl:attribute>
				<xsl:value-of select="title" />
			</a></td>
  		<td><xsl:value-of select="creator" /></td>
      <td><xsl:value-of select="publisher" /></td>
      <td><xsl:value-of select="price" /></td>
  		<td><xsl:value-of select="date/year" />-<xsl:value-of select="date/month" />-<xsl:value-of select="date/day" /></td>
      <td><xsl:value-of select="keywords/keyword" /></td>
      <td><xsl:value-of select="description" /></td>
		</tr>
</xsl:template>


</xsl:stylesheet>
