<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" />
<xsl:param name="title"/>
<xsl:param name="creator"/>
<xsl:param name="publisher"/>
<xsl:param name="year"/>
<xsl:param name="description"/>
<xsl:param name="keyword"/>


<xsl:template match="/">
    <html>
	     <body>
					<xsl:value-of select="concat('Title : ', $title)"/>,
					<xsl:value-of select="concat('Creator : ', $creator)"/>,
					<xsl:value-of select="concat('Publisher : ', $publisher)"/>,
					<xsl:value-of select="concat('Year : ', $year)"/>,
					<xsl:value-of select="concat('Description : ', $description)"/>,
					<xsl:value-of select="concat('Keyword : ', $keyword)"/>

				<table border="1">
					<tr>
						<th>ISBN</th>
						<th>タイトル</th>
					</tr>

				<xsl:apply-templates select="books/item[contains(title,$title) and contains(creator,$creator) and contains(publisher,$publisher) and contains(date/year,$year) and contains(description,$description) and contains(keywords/keyword[1],$keyword) and contains(keywords/keyword[2],$keyword) and contains(keywords/keyword[3],$keyword)]">
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
        <xsl:attribute name="href"><xsl:value-of select="concat('detail/',@no,'.html')"/></xsl:attribute>
				<xsl:value-of select="title" />
			</a></td>
		</tr>
		</xsl:template>

</xsl:stylesheet>
