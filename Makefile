#-----------------------------------------------------
# Some usefull instructions...
#
BIBLIO=biblio.bib
#-----------------------------------------------------

index.html: 
	@echo '==> Generating index'
	asciidoctor master.adoc -o index.html 

clean:
	hugo mod clean
	hugo mod get -u ./...