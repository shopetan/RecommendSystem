<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" />
<xsl:param name="no"/>

<xsl:template match="/">
<html>
   <body>
    <table border="1">
      <tr>
        <th>ISBN</th>
        <th>タイトル</th>
        <th>著者</th>
        <th>出版社</th>
        <th>価格</th>
        <th>年 - 月 - 日</th>
        <th>キーワード1</th>
        <th>キーワード2</th>
        <th>キーワード3</th>
        <th>説明</th>
      </tr>

    <xsl:apply-templates select="books/item[@no = $no]">
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
  <xsl:call-template name="keywords">
    <xsl:with-param name="number" select="1"/>
  </xsl:call-template>
  <td><xsl:value-of select="description" /></td>
</tr>
</xsl:template>


<xsl:template name="keywords">
  <xsl:param name="number"/>
  <xsl:choose>
    <xsl:when test="$number &gt; 3">
    </xsl:when>
    <xsl:otherwise>
      <td><xsl:value-of select="keywords/keyword[$number]" /></td>
      <xsl:call-template name="keywords">
        <xsl:with-param name="number" select="$number + 1"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
