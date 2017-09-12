#-----------------------------------------------------
DZSLIDES=../../asciidoctor-backends/slim/dzslides
DECKJS=../..asciidoctor-deck.js/templates/haml/
DECK=swiss
#DECK=neon
#DECK=beamer
#STYLE=../POO/COO/stylesheets/golo-jmb.css
STYLE=../../asciidoctor-stylesheet-factory/stylesheets/jmb.css
#ASCIIDOCTOR=asciidoctor  -a icons=font -a linkcss! -a data-uri
ASCIIDOCTOR=asciidoctor -a icons=font -a data-uri
EXT=adoc
OUTPUT=.
SITE=../jmbruel.github.io/teaching
#THEME=colony
THEME=riak
#The valid options are coderay, highlightjs, prettify, and pygments.
HIGHLIGHT=pygments
MAIN=testingCI

#-----------------------------------------------------

all: $(OUTPUT)/$(MAIN).html $(OUTPUT)/$(MAIN).dzslides.html $(OUTPUT)/$(MAIN).teacher.html

support: $(MAIN).adoc
	@echo '==> Compiling asciidoc files to generate HTML'
	$(ASCIIDOCTOR) -b html5 \
		-a numbered \
		-a data-uri -a linkcss \
		-a toc2 \
		-r asciidoctor-diagram \
		-a source-highlighter=$(HIGHLIGHT) \
		-o $@ $<

$(OUTPUT)/%.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate HTML'
	$(ASCIIDOCTOR) -b html5 \
		-a numbered \
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
		-a styledir=. \
		-a stylesheet=$(STYLE) \
		-a source-highlighter=$(HIGHLIGHT) \
		-o $@ $<

$(OUTPUT)/%.test.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate Dzslides'
	$(ASCIIDOCTOR) -b dzslides \
		-T $(DZSLIDES) -E slim \
		-a slides -a dzslides \
		-r asciidoctor-diagram \
		-a styledir=. \
		-a source-highlighter=$(HIGHLIGHT) \
		-o $@ $<

$(OUTPUT)/%.deckjs.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate Deckjs'
	$(ASCIIDOCTOR) -b deckjs \
		-T ../../asciidoctor-deck.js/templates/haml/ \
		-a slides \
		-a deckjs_theme=$(DECK) \
		-a prof \
		-o $@ $<

$(OUTPUT)/%.teacher.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate HTML'
	$(ASCIIDOCTOR) -b html5 \
		-a prof \
		-a numbered \
		-a toc2 \
		-r asciidoctor-diagram \
		-a source-highlighter=$(HIGHLIGHT) \
		-o $@ $<

$(OUTPUT)/%.sujet.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate subject for student'
	$(ASCIIDOCTOR) -b html5 \
		-a numbered \
		-r asciidoctor-diagram \
		-a source-highlighter=$(HIGHLIGHT) \
		-o $@ $<

deploy:
	cp $(MAIN).html $(SITE)/MobileModeling.html
	cd $(SITE)

clean:
	rm *.cache
	rm images/*.cache
