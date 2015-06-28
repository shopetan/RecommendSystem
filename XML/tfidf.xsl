<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" />

<xsl:template match="/">
	<html>
		<body>
			<h2>全文書の説明欄に含まれるキーワードから，特徴量を抽出した結果を示しています．</h2>
			<p>各リンク先はそのキーワードで検索をした結果を示しています．</p>
			<table border="1">
				<tr>
					<th>キーワード</th>
					<th>特徴量</th>
				</tr>
				<xsl:apply-templates select="page/tags">
				</xsl:apply-templates>
			</table>

		</body>
	</html>
</xsl:template>

<xsl:template match="tags">
	<tr>
		<td>
		<a>
			<xsl:attribute name="href">http://localhost/~shopetan/markuplang/2015_0615/query.rb?title=&amp;creator=&amp;publisher=&amp;year=&amp;description=&amp;keyword=<xsl:value-of select="tag"/></xsl:attribute>
			<xsl:value-of select="tag" />
		</a></td>
		<td><xsl:value-of select="feature" /></td>
	</tr>

</xsl:template>

</xsl:stylesheet>
