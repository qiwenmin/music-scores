.PHONY: pdfs midis clean

ABC_FILES:=$(wildcard */*.abc)
NAMES:=$(basename $(ABC_FILES))
PDFS:=$(NAMES:=.pdf)
MIDIS:=$(NAMES:=.mid)

.PRECIOUS: %.ps

pdfs: $(PDFS)

midis: $(MIDIS)

%.pdf: %.ps
	ps2pdf $< $@

%.ps: %.abc
	abcm2ps $< -O- > $@

%.mid: %.abc
	abc2midi $< -o $@

clean:
	rm -f $(PDFS) $(MIDIS) $(NAMES:=.ps)
