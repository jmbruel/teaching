#-----------------------------------------------------
DZSLIDES=../../asciidoctor-backends/slim/dzslides
#STYLE=../POO/COO/stylesheets/golo-jmb.css
STYLE=../asciidoctor-stylesheet-factory/stylesheets/jmb.css
#ASCIIDOCTOR=asciidoctor
ASCIIDOCTOR=asciidoctor -a icons=font 
EXT=asc
OUTPUT=.
SITE=../jmbruel.github.io/teaching
#THEME=colony
THEME=riak
#-----------------------------------------------------

all: $(OUTPUT)/$(MAIN).html $(OUTPUT)/$(MAIN).slides.html

$(OUTPUT)/%.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate HTML'
	$(ASCIIDOCTOR) -b html5 \
		-a stylesheet=jmb.css \
		-a numbered \
		-a source-highlighter=highlightjs \
		-a data-uri \
		-a toc2 \
		-r asciidoctor-diagram \
		-o $@ $<

$(OUTPUT)/%.slides.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate Deckjs'
	$(ASCIIDOCTOR) -b dzslides \
		-a stylesheet=../../font-awesome-4.5.0/css/font-awesome.min.css \
		-T $(DZSLIDES) -E slim \
		-a slides \
		-r asciidoctor-diagram \
		-a data-uri \
		-o $@ $<

deploy:
	cp $(MAIN).html $(SITE)/MobileModeling.html
	cd $(SITE)

clean:
	rm *.cache
	rm images/*.cache
