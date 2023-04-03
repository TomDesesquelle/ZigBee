
setEdit -layer_horizontal {MET1}
setEdit -layer_horizontal {MET3}
setEdit -layer_vertical  {MET2} 
setEdit -layer_vertical  {MET4}

setEdit -spacing 0.45 -layer MET1
setEdit -spacing 0.5 -layer MET2
setEdit -spacing 0.6 -layer MET3
setEdit -spacing 0.6 -layer MET4


setMetalFill -gapSpacing 0.45 	-layer MET1
setMetalFill -gapSpacing 0.5 	-layer MET2
setMetalFill -gapSpacing 0.6	-layer MET3
setMetalFill -gapSpacing 0.6	-layer MET4


setFillerMode -core {FILLANT1 FILLANT2 FILLANT5 FILLANT10 FILLANT25} -preserveUserOrder true

addFiller -cell FILL25 FILL10 FILL5 FILL2 FILL1 -prefix FILLER -fitGap

amsFillperi

