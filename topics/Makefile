#-----------------------------------------------------
DZSLIDES=../../asciidoctor-backends/slim/dzslides
DECKJS=../..asciidoctor-deck.js/templates/haml/
#STYLE=../POO/COO/stylesheets/golo-jmb.css
STYLE=../../asciidoctor-stylesheet-factory/stylesheets/jmb.css
#ASCIIDOCTOR=asciidoctor
ASCIIDOCTOR=asciidoctor -a icons=font -a linkcss --trace
EXT=adoc
OUTPUT=.
SITE=../jmbruel.github.io/teaching
#THEME=colony
THEME=riak
#The valid options are coderay, highlightjs, prettify, and pygments.
HIGHLIGHT=pygments


#-----------------------------------------------------

all: $(OUTPUT)/$(MAIN).html $(OUTPUT)/$(MAIN).slides.html

$(OUTPUT)/%.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate HTML'
	$(ASCIIDOCTOR) -b html5 \
		-a numbered \
		-a data-uri \
		-a toc2 \
		-r asciidoctor-diagram \
		-a source-highlighter=$(HIGHLIGHT) \
		-o $@ $<

$(OUTPUT)/%.dzslides.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate Dzslides'
	$(ASCIIDOCTOR) -b dzslides \
		-T $(DZSLIDES) -E slim \
		-a slides -a dzslides \
		-r asciidoctor-diagram \
		-a data-uri \
		-a styledir=. \
		-a stylesheet=$(STYLE) \
		-a source-highlighter=$(HIGHLIGHT) \
		-o $@ $<

$(OUTPUT)/%.slides.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate Deckjs'
	$(ASCIIDOCTOR) -b deckjs \
	-a stylesheet=../../font-awesome-4.5.0/css/font-awesome.min.css \
		-T $(DECKJS) \
		-a slides -a deckjslides \
		-r asciidoctor-diagram \
		-a data-uri \
		-a source-highlighter=$(HIGHLIGHT) \
		-o $@ $<

deploy:
	cp $(MAIN).html $(SITE)/MobileModeling.html
	cd $(SITE)

clean:
	rm *.cache
	rm images/*.cache
