.PHONY: init zip update updatezip
init:
	if [ -d "paper" ]; then echo "Pas besoin de cloner le papier"; else git clone git@framagit.org:dez/debruijn.git paper; fi
	if [ -d "coq" ]; then echo "Pas besoin de cloner la formalisation coq"; else git clone git@github.com:amblafont/binding-debruijn.git coq; fi
	if [ -d "hol" ]; then echo "Pas besoin de cloner la formalisation hol"; else git clone git@github.com:maggesi/dbmonad.git hol; fi

update:
	cd paper; git pull
	cd coq; git pull
	cd hol; git fetch origin; git checkout POPL2022; git merge origin/POPL2022
zip:
	@echo "Creation du zip db.zip a la racine"
	zip -r db.zip zip -x "*/.*"

updatezip: update zip
