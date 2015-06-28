<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="/">
	<html>
		<body>
			全文書の説明欄に含まれるキーワードから，特徴量を抽出した結果を示しています．
			各リンク先はそのキーワードで検索をした結果を示しています．
			<table border="1">
				<tr>
					<th>キーワード</th>
					<th>特徴量</th>
				</tr>

			</table>

		</body>
	</html>

				<xsl:apply-templates select="tags">
				</xsl:apply-templates>
</xsl:template>

<xsl:template match="tags">
	<tr>
		<td>
		<a>
			<xsl:attribute name="href"><xsl:value-of select=""/></xsl:attribute>
			<xsl:value-of select="tag" />
		</a></td>
		<td><xsl:value-of select="feature" /></td>
	</tr>

</xsl:template>

</xsl:stylesheet>
