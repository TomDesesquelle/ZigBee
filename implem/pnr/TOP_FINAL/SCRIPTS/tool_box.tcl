proc create_gds { name } { 
	streamOut $name -mapFile gdsII.map -libName DesignLib -units 1000 -mode ALL
}
