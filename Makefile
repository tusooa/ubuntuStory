
SOURCE = ubuntu-story-docbook.xml
XHTML_XSL = /usr/share/sgml/docbook/xsl-stylesheets/xhtml-1_1/docbook.xsl
CHUNK_XSL = /usr/share/sgml/docbook/xsl-stylesheets/xhtml-1_1/chunk.xsl
.PHONY : site html

html : build/ubuntu-story.html
build/ubuntu-story.html : ${SOURCE} ${XHTML_XSL}
	mkdir -pv build && cd build && xsltproc ${XHTML_XSL} ../ubuntu-story-docbook.xml > ubuntu-story.html

site : build/index.html
build/index.html : ${SOURCE} ${CHUNK_XSL}
	mkdir -pv build && cd build && xsltproc ${CHUNK_XSL} ../ubuntu-story-docbook.xml

