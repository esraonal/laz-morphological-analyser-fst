all:

	$ hfst-lexc pazar.laz.lexc -o laz.lexc.hfst
	$ hfst-twolc pazar.laz.twol -o laz.twol.hfst
	$ hfst-compose-intersect -1 pazar.laz.lexc.hfst -2 pazar.laz.twol.hfst -o pazar.laz.gen.hfst
	$ hfst-fst2strings -X obey-flags pazar.laz.gen.hfst 
	 
	
