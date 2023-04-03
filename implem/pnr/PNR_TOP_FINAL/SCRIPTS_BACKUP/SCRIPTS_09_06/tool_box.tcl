proc create_gds { name } { 
	streamOut $name -mapFile streamOut.map -libName DesignLib -units 1000 -mode ALL
}
