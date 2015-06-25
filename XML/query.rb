#!/Users/shopetan/.rvm/rubies/ruby-2.1.4/bin/ruby
# encoding: utf-8

require 'cgi'
require 'xml/xslt'

xslt = XML::XSLT.new()
cgi = CGI.new
xslt.xml = "data0511.xml"
xslt.xsl = "query.xsl"

xslt.parameters = {"title" => cgi["title"],
									 "creator" => cgi["creator"],}
out = xslt.serve()
print cgi.header("text/html; charset=UTF-8")
print out
