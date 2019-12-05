all:

	/Users/esraonal/hfst/bin/hfst-lexc pazar.laz.lexc -o laz.lexc.hfst
	/Users/esraonal/hfst/bin/hfst-twolc pazar.laz.twol -o laz.twol.hfst
	/Users/esraonal/hfst/bin/hfst-compose-intersect -1 pazar.laz.lexc.hfst -2 pazar.laz.twol.hfst -o pazar.laz.gen.hfst
	/Users/esraonal/hfst/bin/hfst-fst2strings -X obey-flags pazar.laz.gen.hfst 
	 
	
