
module msk_modulator_1_DW01_inc_0 ( A, SUM );
  input [19:0] A;
  output [19:0] SUM;

  wire   [19:2] carry;

  ADD22 U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADD22 U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADD22 U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADD22 U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADD22 U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADD22 U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADD22 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADD22 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADD22 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADD22 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADD22 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADD22 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD22 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD22 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD22 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD22 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD22 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD22 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(carry[19]), .B(A[19]), .Q(SUM[19]) );
endmodule


module msk_modulator_1_DW01_inc_1 ( A, SUM );
  input [19:0] A;
  output [19:0] SUM;

  wire   [19:2] carry;

  ADD22 U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADD22 U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADD22 U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADD22 U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADD22 U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADD22 U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADD22 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADD22 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADD22 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADD22 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADD22 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADD22 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD22 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD22 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD22 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD22 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD22 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD22 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(carry[19]), .B(A[19]), .Q(SUM[19]) );
endmodule


module msk_modulator_1_DW01_inc_2 ( A, SUM );
  input [19:0] A;
  output [19:0] SUM;

  wire   [19:2] carry;

  ADD22 U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADD22 U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADD22 U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADD22 U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADD22 U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADD22 U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADD22 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADD22 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADD22 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADD22 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADD22 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADD22 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD22 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD22 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD22 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD22 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD22 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD22 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(carry[19]), .B(A[19]), .Q(SUM[19]) );
endmodule


module msk_modulator_1 ( clk, reset, i_empty, i_data, o_ready, o_sinI, o_sinQ
 );
  output [3:0] o_sinI;
  output [3:0] o_sinQ;
  input clk, reset, i_empty, i_data;
  output o_ready;
  wire   clk_10M, N459, N460, N461, N462, N463, N464, N465, N466, N467, N468,
         N469, N470, N471, N472, N473, N474, N475, N476, N477, stateI_0_,
         stateQ_0_, sin_was_positiveQ, old_i_data, N503, N504, N505, N506,
         N507, N508, N509, N510, N511, N512, N513, N514, N515, N516, N517,
         N518, N519, N520, N521, N522, N565, N693, N694, N695, N696, N697,
         N698, N699, N700, N701, N702, N703, N704, N705, N706, N707, N708,
         N709, N710, N711, N769, N770, N771, N772, N773, N774, N775, N776,
         N777, N778, N779, N780, N781, N782, N783, N784, N785, N786, N787,
         N788, N789, N790, N791, N792, N793, N794, N795, N796, N846, N975,
         N976, N977, N978, N979, N980, N981, N982, N983, N984, N985, N986,
         N987, N988, N989, N990, N991, N992, N993, N1050, N1051, N1052, N1053,
         N1054, N1055, N1056, N1057, N1058, N1059, N1060, N1061, N1062, N1063,
         N1064, N1065, N1066, N1067, N1068, N1069, N1070, N1071, N1072, N1073,
         N1074, N1075, N1076, N1077, N1078, N1079, N1080, N1081, N1082, N1083,
         N1091, N1092, N1098, n421, n422, n423, n427, n428, n429, n432, n433,
         n435, n436, n439, n440, n441, n442, n443, n444, n445, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n657, n658, n659, n660, n661, n662, n663,
         n664, n665, n666, n667, n668, n669, n670, n671, n672, n673, n674,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718,
         n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729,
         n730, n731, n732, n733, n734, n735, n736, n737, n738, n739, n740,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3;
  wire   [19:0] c;
  wire   [19:0] i;
  wire   [19:0] j;

  DF3 c_reg_0_ ( .D(N503), .C(clk), .Q(c[0]) );
  DF3 c_reg_1_ ( .D(N504), .C(clk), .Q(c[1]) );
  DF3 c_reg_2_ ( .D(N505), .C(clk), .Q(c[2]) );
  DF3 c_reg_3_ ( .D(N506), .C(clk), .Q(c[3]), .QN(n708) );
  DF3 c_reg_4_ ( .D(N507), .C(clk), .Q(c[4]) );
  DF3 c_reg_5_ ( .D(N508), .C(clk), .Q(c[5]) );
  DF3 c_reg_6_ ( .D(N509), .C(clk), .Q(c[6]) );
  DF3 c_reg_7_ ( .D(N510), .C(clk), .Q(c[7]) );
  DF3 c_reg_8_ ( .D(N511), .C(clk), .Q(c[8]), .QN(n423) );
  DF3 c_reg_9_ ( .D(N512), .C(clk), .Q(c[9]) );
  DF3 c_reg_10_ ( .D(N513), .C(clk), .Q(c[10]) );
  DF3 c_reg_11_ ( .D(N514), .C(clk), .Q(c[11]) );
  DF3 c_reg_12_ ( .D(N515), .C(clk), .Q(c[12]), .QN(n705) );
  DF3 c_reg_13_ ( .D(N516), .C(clk), .Q(c[13]), .QN(n703) );
  DF3 c_reg_14_ ( .D(N517), .C(clk), .Q(c[14]), .QN(n704) );
  DF3 c_reg_15_ ( .D(N518), .C(clk), .Q(c[15]) );
  DF3 c_reg_16_ ( .D(N519), .C(clk), .Q(c[16]) );
  DF3 c_reg_17_ ( .D(N520), .C(clk), .Q(c[17]) );
  DF3 c_reg_18_ ( .D(N521), .C(clk), .Q(c[18]), .QN(n706) );
  DF3 c_reg_19_ ( .D(N522), .C(clk), .Q(c[19]), .QN(n707) );
  DF3 clk_10M_reg ( .D(n726), .C(clk), .Q(clk_10M) );
  DF3 stateQ_reg_0_ ( .D(n444), .C(clk), .Q(stateQ_0_) );
  DF3 stateI_reg_0_ ( .D(n443), .C(clk), .Q(stateI_0_), .QN(n713) );
  OAI212 U346 ( .A(n786), .B(n633), .C(n634), .Q(n628) );
  OAI212 U365 ( .A(n710), .B(n759), .C(n756), .Q(N790) );
  OAI222 U454 ( .A(n711), .B(n752), .C(n685), .D(n710), .Q(n684) );
  OAI212 U461 ( .A(n711), .B(n752), .C(n810), .Q(n691) );
  OAI222 U463 ( .A(n441), .B(j[1]), .C(n439), .D(j[0]), .Q(n689) );
  OAI212 U475 ( .A(n746), .B(n710), .C(n663), .Q(N1072) );
  OAI212 U500 ( .A(n672), .B(j[0]), .C(j[3]), .Q(n697) );
  msk_modulator_1_DW01_inc_0 add_236 ( .A(j), .SUM({N993, N992, N991, N990, 
        N989, N988, N987, N986, N985, N984, N983, N982, N981, N980, N979, N978, 
        N977, N976, N975, SYNOPSYS_UNCONNECTED_1}) );
  msk_modulator_1_DW01_inc_1 add_173 ( .A(i), .SUM({N711, N710, N709, N708, 
        N707, N706, N705, N704, N703, N702, N701, N700, N699, N698, N697, N696, 
        N695, N694, N693, SYNOPSYS_UNCONNECTED_2}) );
  msk_modulator_1_DW01_inc_2 add_78 ( .A(c), .SUM({N477, N476, N475, N474, 
        N473, N472, N471, N470, N469, N468, N467, N466, N465, N464, N463, N462, 
        N461, N460, N459, SYNOPSYS_UNCONNECTED_3}) );
  DFE1 next_stateQ_reg_0_ ( .D(n445), .E(N1098), .C(clk), .QN(n432) );
  DFE1 next_stateI_reg_0_ ( .D(N1091), .E(N1092), .C(clk), .QN(n433) );
  DFE1 sin_was_positiveI_reg ( .D(N565), .E(n760), .C(clk), .QN(n715) );
  DFE1 sin_was_positiveQ_reg ( .D(N846), .E(n748), .C(clk), .Q(
        sin_was_positiveQ) );
  DFE1 isPositiveQ_reg ( .D(N1078), .E(N1077), .C(clk), .Q(n429), .QN(n711) );
  DFE1 isPositiveI_reg ( .D(N796), .E(N795), .C(clk), .Q(n428), .QN(n712) );
  DFE1 is9_reg ( .D(n753), .E(N1083), .C(clk), .Q(n427), .QN(n710) );
  DFE1 old_i_data_reg ( .D(N1080), .E(N1079), .C(clk), .Q(old_i_data) );
  DFE1 j_reg_15_ ( .D(N1067), .E(N1051), .C(clk), .Q(j[15]) );
  DFE1 i_reg_15_ ( .D(N785), .E(N769), .C(clk), .Q(i[15]) );
  DFE1 j_reg_18_ ( .D(N1070), .E(N1051), .C(clk), .Q(j[18]) );
  DFE1 i_reg_18_ ( .D(N788), .E(N769), .C(clk), .Q(i[18]) );
  DFE1 j_reg_16_ ( .D(N1068), .E(N1051), .C(clk), .Q(j[16]) );
  DFE1 j_reg_17_ ( .D(N1069), .E(n721), .C(clk), .Q(j[17]) );
  DFE1 i_reg_16_ ( .D(N786), .E(N769), .C(clk), .Q(i[16]) );
  DFE1 i_reg_17_ ( .D(N787), .E(n725), .C(clk), .Q(i[17]) );
  DFE1 j_reg_19_ ( .D(N1071), .E(n721), .C(clk), .Q(j[19]) );
  DFE1 i_reg_19_ ( .D(N789), .E(n725), .C(clk), .Q(i[19]) );
  DFE1 my_clk_10M_reg ( .D(clk_10M), .E(reset), .C(clk), .Q(n422), .QN(n709)
         );
  DFE1 IorQ_reg ( .D(N1082), .E(N1081), .C(clk), .Q(n421), .QN(n714) );
  DFE1 j_reg_12_ ( .D(N1064), .E(n721), .C(clk), .Q(j[12]) );
  DFE1 i_reg_12_ ( .D(N782), .E(n725), .C(clk), .Q(i[12]) );
  DFE1 j_reg_14_ ( .D(N1066), .E(n721), .C(clk), .Q(j[14]) );
  DFE1 i_reg_14_ ( .D(N784), .E(n725), .C(clk), .Q(i[14]) );
  DFE1 j_reg_13_ ( .D(N1065), .E(N1051), .C(clk), .Q(j[13]) );
  DFE1 i_reg_13_ ( .D(N783), .E(N769), .C(clk), .Q(i[13]) );
  DFE1 j_reg_11_ ( .D(N1063), .E(n721), .C(clk), .Q(j[11]) );
  DFE1 i_reg_11_ ( .D(N781), .E(n725), .C(clk), .Q(i[11]) );
  DFE1 j_reg_9_ ( .D(N1061), .E(n721), .C(clk), .Q(j[9]) );
  DFE1 j_reg_10_ ( .D(N1062), .E(N1051), .C(clk), .Q(j[10]) );
  DFE1 i_reg_9_ ( .D(N779), .E(n725), .C(clk), .Q(i[9]) );
  DFE1 i_reg_10_ ( .D(N780), .E(N769), .C(clk), .Q(i[10]) );
  DFE1 j_reg_8_ ( .D(N1060), .E(N1051), .C(clk), .Q(j[8]) );
  DFE1 i_reg_8_ ( .D(N778), .E(N769), .C(clk), .Q(i[8]) );
  DFE1 j_reg_7_ ( .D(N1059), .E(N1051), .C(clk), .Q(j[7]) );
  DFE1 i_reg_7_ ( .D(N777), .E(N769), .C(clk), .Q(i[7]) );
  DFE1 j_reg_6_ ( .D(N1058), .E(n721), .C(clk), .Q(j[6]) );
  DFE1 i_reg_6_ ( .D(N776), .E(n725), .C(clk), .Q(i[6]) );
  DFE1 j_reg_3_ ( .D(N1055), .E(n721), .C(clk), .Q(j[3]), .QN(n439) );
  DFE1 i_reg_3_ ( .D(N773), .E(n725), .C(clk), .Q(i[3]), .QN(n435) );
  DFE1 j_reg_4_ ( .D(N1056), .E(n721), .C(clk), .Q(j[4]) );
  DFE1 j_reg_5_ ( .D(N1057), .E(N1051), .C(clk), .Q(j[5]) );
  DFE1 i_reg_4_ ( .D(N774), .E(n725), .C(clk), .Q(i[4]) );
  DFE1 i_reg_5_ ( .D(N775), .E(N769), .C(clk), .Q(i[5]) );
  DFE1 j_reg_1_ ( .D(N1053), .E(n721), .C(clk), .Q(j[1]), .QN(n440) );
  DFE1 j_reg_2_ ( .D(N1054), .E(N1051), .C(clk), .Q(j[2]), .QN(n441) );
  DFE1 i_reg_1_ ( .D(N771), .E(n725), .C(clk), .Q(i[1]), .QN(n436) );
  DFE1 i_reg_2_ ( .D(N772), .E(N769), .C(clk), .Q(i[2]) );
  DFE1 j_reg_0_ ( .D(N1052), .E(N1051), .C(clk), .Q(j[0]), .QN(n442) );
  DFE1 i_reg_0_ ( .D(N770), .E(N769), .C(clk), .Q(i[0]) );
  DFE1 o_sinI_reg_0_ ( .D(N791), .E(N790), .C(clk), .Q(o_sinI[0]) );
  DFE1 o_sinQ_reg_0_ ( .D(N1073), .E(N1072), .C(clk), .Q(o_sinQ[0]) );
  DFE1 o_ready_reg ( .D(N1050), .E(n747), .C(clk), .Q(o_ready) );
  DFE1 o_sinI_reg_2_ ( .D(N793), .E(N790), .C(clk), .Q(o_sinI[2]) );
  DFE1 o_sinQ_reg_2_ ( .D(N1075), .E(N1072), .C(clk), .Q(o_sinQ[2]) );
  DFE1 o_sinQ_reg_1_ ( .D(N1074), .E(N1072), .C(clk), .Q(o_sinQ[1]) );
  DFE1 o_sinI_reg_1_ ( .D(N792), .E(N790), .C(clk), .Q(o_sinI[1]) );
  DFE1 o_sinI_reg_3_ ( .D(N794), .E(N790), .C(clk), .Q(o_sinI[3]) );
  DFE1 o_sinQ_reg_3_ ( .D(N1076), .E(N1072), .C(clk), .Q(o_sinQ[3]) );
  INV3 U610 ( .A(n625), .Q(n754) );
  NOR21 U611 ( .A(n644), .B(n756), .Q(n625) );
  NOR21 U612 ( .A(n785), .B(n756), .Q(n620) );
  NOR21 U613 ( .A(n756), .B(n807), .Q(n668) );
  INV3 U614 ( .A(n642), .Q(n756) );
  INV3 U615 ( .A(n641), .Q(n786) );
  NAND22 U616 ( .A(n722), .B(n649), .Q(N769) );
  NAND22 U617 ( .A(n722), .B(n649), .Q(n725) );
  NAND22 U618 ( .A(n717), .B(n623), .Q(N1051) );
  NAND22 U619 ( .A(n719), .B(n623), .Q(n721) );
  BUF2 U620 ( .A(n648), .Q(n723) );
  INV3 U621 ( .A(n661), .Q(n806) );
  NAND22 U622 ( .A(n643), .B(n645), .Q(n644) );
  BUF2 U623 ( .A(n648), .Q(n722) );
  BUF2 U624 ( .A(n648), .Q(n724) );
  BUF2 U625 ( .A(n716), .Q(n717) );
  BUF2 U626 ( .A(n716), .Q(n718) );
  INV3 U627 ( .A(n682), .Q(n752) );
  BUF2 U628 ( .A(n696), .Q(n719) );
  BUF2 U629 ( .A(n696), .Q(n720) );
  INV3 U630 ( .A(n645), .Q(n785) );
  INV3 U631 ( .A(n683), .Q(n750) );
  INV3 U632 ( .A(n643), .Q(n807) );
  INV3 U633 ( .A(n623), .Q(n748) );
  NAND22 U634 ( .A(n626), .B(n627), .Q(N794) );
  INV3 U635 ( .A(n686), .Q(n810) );
  INV3 U636 ( .A(n649), .Q(n760) );
  NOR21 U637 ( .A(n651), .B(n729), .Q(N520) );
  INV3 U638 ( .A(N475), .Q(n729) );
  NOR21 U639 ( .A(n724), .B(n789), .Q(N787) );
  INV3 U640 ( .A(N709), .Q(n789) );
  NOR21 U641 ( .A(n718), .B(n767), .Q(N1069) );
  INV3 U642 ( .A(N991), .Q(n767) );
  NOR21 U643 ( .A(n723), .B(n788), .Q(N788) );
  INV3 U644 ( .A(N710), .Q(n788) );
  NOR21 U645 ( .A(n717), .B(n766), .Q(N1070) );
  INV3 U646 ( .A(N992), .Q(n766) );
  NOR21 U647 ( .A(n651), .B(n728), .Q(N521) );
  INV3 U648 ( .A(N476), .Q(n728) );
  NOR21 U649 ( .A(n723), .B(n790), .Q(N786) );
  INV3 U650 ( .A(N708), .Q(n790) );
  NOR21 U651 ( .A(n719), .B(n768), .Q(N1068) );
  INV3 U652 ( .A(N990), .Q(n768) );
  NOR21 U653 ( .A(n651), .B(n730), .Q(N519) );
  INV3 U654 ( .A(N474), .Q(n730) );
  NOR21 U655 ( .A(n651), .B(n731), .Q(N518) );
  INV3 U656 ( .A(N473), .Q(n731) );
  NOR21 U657 ( .A(n723), .B(n792), .Q(N784) );
  INV3 U658 ( .A(N706), .Q(n792) );
  NOR21 U659 ( .A(n719), .B(n770), .Q(N1066) );
  INV3 U660 ( .A(N988), .Q(n770) );
  NOR21 U661 ( .A(n724), .B(n791), .Q(N785) );
  INV3 U662 ( .A(N707), .Q(n791) );
  NOR21 U663 ( .A(n720), .B(n769), .Q(N1067) );
  INV3 U664 ( .A(N989), .Q(n769) );
  NOR21 U665 ( .A(n724), .B(n793), .Q(N783) );
  INV3 U666 ( .A(N705), .Q(n793) );
  NOR21 U667 ( .A(n717), .B(n771), .Q(N1065) );
  INV3 U668 ( .A(N987), .Q(n771) );
  NOR21 U669 ( .A(n723), .B(n794), .Q(N782) );
  INV3 U670 ( .A(N704), .Q(n794) );
  NOR21 U671 ( .A(n718), .B(n772), .Q(N1064) );
  INV3 U672 ( .A(N986), .Q(n772) );
  NOR21 U673 ( .A(n651), .B(n732), .Q(N517) );
  INV3 U674 ( .A(N472), .Q(n732) );
  NOR21 U675 ( .A(n651), .B(n733), .Q(N516) );
  INV3 U676 ( .A(N471), .Q(n733) );
  NOR21 U677 ( .A(n651), .B(n734), .Q(N515) );
  INV3 U678 ( .A(N470), .Q(n734) );
  NOR21 U679 ( .A(n651), .B(n735), .Q(N514) );
  INV3 U680 ( .A(N469), .Q(n735) );
  NOR21 U681 ( .A(n651), .B(n737), .Q(N512) );
  INV3 U682 ( .A(N467), .Q(n737) );
  NOR21 U683 ( .A(n723), .B(n796), .Q(N780) );
  INV3 U684 ( .A(N702), .Q(n796) );
  NOR21 U685 ( .A(n724), .B(n797), .Q(N779) );
  INV3 U686 ( .A(N701), .Q(n797) );
  NOR21 U687 ( .A(n717), .B(n774), .Q(N1062) );
  INV3 U688 ( .A(N984), .Q(n774) );
  NOR21 U689 ( .A(n720), .B(n775), .Q(N1061) );
  INV3 U690 ( .A(N983), .Q(n775) );
  NOR21 U691 ( .A(n651), .B(n736), .Q(N513) );
  INV3 U692 ( .A(N468), .Q(n736) );
  NOR21 U693 ( .A(n724), .B(n795), .Q(N781) );
  INV3 U694 ( .A(N703), .Q(n795) );
  NOR21 U695 ( .A(n718), .B(n773), .Q(N1063) );
  INV3 U696 ( .A(N985), .Q(n773) );
  NOR21 U697 ( .A(n723), .B(n800), .Q(N776) );
  INV3 U698 ( .A(N698), .Q(n800) );
  NOR21 U699 ( .A(n724), .B(n799), .Q(N777) );
  INV3 U700 ( .A(N699), .Q(n799) );
  NOR21 U701 ( .A(n719), .B(n778), .Q(N1058) );
  INV3 U702 ( .A(N980), .Q(n778) );
  NOR21 U703 ( .A(n720), .B(n777), .Q(N1059) );
  INV3 U704 ( .A(N981), .Q(n777) );
  NOR21 U705 ( .A(n651), .B(n740), .Q(N509) );
  INV3 U706 ( .A(N464), .Q(n740) );
  NOR21 U707 ( .A(n651), .B(n739), .Q(N510) );
  INV3 U708 ( .A(N465), .Q(n739) );
  NOR21 U709 ( .A(n723), .B(n798), .Q(N778) );
  INV3 U710 ( .A(N700), .Q(n798) );
  NOR21 U711 ( .A(n717), .B(n776), .Q(N1060) );
  INV3 U712 ( .A(N982), .Q(n776) );
  NOR21 U713 ( .A(n651), .B(n738), .Q(N511) );
  INV3 U714 ( .A(N466), .Q(n738) );
  NAND31 U715 ( .A(n751), .B(n808), .C(n692), .Q(n677) );
  NAND31 U716 ( .A(n764), .B(j[0]), .C(n808), .Q(n660) );
  INV3 U717 ( .A(n672), .Q(n764) );
  NOR21 U718 ( .A(n761), .B(n445), .Q(n623) );
  AOI211 U719 ( .A(n808), .B(n692), .C(n663), .Q(n682) );
  NOR31 U720 ( .A(j[0]), .B(n672), .C(j[3]), .Q(n692) );
  NOR21 U721 ( .A(n713), .B(n709), .Q(n642) );
  NAND31 U722 ( .A(n644), .B(n712), .C(n642), .Q(n631) );
  AOI211 U723 ( .A(n633), .B(n635), .C(n757), .Q(n626) );
  INV3 U724 ( .A(n631), .Q(n757) );
  NAND31 U725 ( .A(n642), .B(n809), .C(n650), .Q(n648) );
  AOI211 U726 ( .A(n786), .B(i[3]), .C(n806), .Q(n650) );
  OAI2111 U727 ( .A(n679), .B(n672), .C(n680), .D(n681), .Q(N1075) );
  NAND22 U728 ( .A(n684), .B(n672), .Q(n680) );
  AOI311 U729 ( .A(n711), .B(j[3]), .C(n682), .D(n683), .Q(n681) );
  OAI2111 U730 ( .A(n626), .B(n636), .C(n637), .D(n627), .Q(N792) );
  AOI2111 U731 ( .A(n643), .B(n641), .C(i[1]), .D(n806), .Q(n636) );
  OAI2111 U732 ( .A(i[2]), .B(n807), .C(n639), .D(n640), .Q(n637) );
  NAND31 U733 ( .A(i[2]), .B(i[0]), .C(i[1]), .Q(n639) );
  OAI2111 U734 ( .A(n755), .B(n628), .C(n627), .D(n629), .Q(N793) );
  INV3 U735 ( .A(n635), .Q(n755) );
  AOI211 U736 ( .A(n758), .B(n786), .C(n630), .Q(n629) );
  OAI2111 U737 ( .A(n679), .B(n687), .C(n688), .D(n750), .Q(N1074) );
  AOI2111 U738 ( .A(j[3]), .B(j[0]), .C(j[1]), .D(n692), .Q(n687) );
  OAI311 U739 ( .A(n689), .B(n784), .C(n690), .D(n691), .Q(n688) );
  INV3 U740 ( .A(n666), .Q(n784) );
  NAND31 U741 ( .A(n808), .B(n697), .C(n751), .Q(n696) );
  NAND31 U742 ( .A(n808), .B(n697), .C(n751), .Q(n716) );
  NAND22 U743 ( .A(n625), .B(n624), .Q(n627) );
  NOR21 U744 ( .A(i[2]), .B(i[1]), .Q(n641) );
  NOR21 U745 ( .A(i[0]), .B(i[3]), .Q(n643) );
  AOI221 U746 ( .A(n632), .B(n633), .C(n806), .D(n641), .Q(n640) );
  INV3 U747 ( .A(n663), .Q(n751) );
  NAND22 U748 ( .A(i[0]), .B(i[3]), .Q(n661) );
  NOR21 U749 ( .A(n669), .B(n786), .Q(n645) );
  NOR21 U750 ( .A(n710), .B(n625), .Q(n635) );
  NOR21 U751 ( .A(n677), .B(n678), .Q(n683) );
  INV3 U752 ( .A(n669), .Q(n809) );
  NOR21 U753 ( .A(n670), .B(n763), .Q(N1080) );
  NOR21 U754 ( .A(n624), .B(n754), .Q(N796) );
  NOR21 U755 ( .A(j[0]), .B(n720), .Q(N1052) );
  NOR21 U756 ( .A(n762), .B(n677), .Q(N1078) );
  INV3 U757 ( .A(n678), .Q(n762) );
  NAND22 U758 ( .A(n679), .B(n750), .Q(N1076) );
  NOR21 U759 ( .A(i[0]), .B(n723), .Q(N770) );
  NOR21 U760 ( .A(n722), .B(n801), .Q(N775) );
  INV3 U761 ( .A(N697), .Q(n801) );
  NOR21 U762 ( .A(n722), .B(n802), .Q(N774) );
  INV3 U763 ( .A(N696), .Q(n802) );
  NOR21 U764 ( .A(n722), .B(n803), .Q(N773) );
  INV3 U765 ( .A(N695), .Q(n803) );
  NOR21 U766 ( .A(n722), .B(n804), .Q(N772) );
  INV3 U767 ( .A(N694), .Q(n804) );
  NOR21 U768 ( .A(n722), .B(n805), .Q(N771) );
  INV3 U769 ( .A(N693), .Q(n805) );
  NOR21 U770 ( .A(n717), .B(n782), .Q(N1054) );
  INV3 U771 ( .A(N976), .Q(n782) );
  NOR21 U772 ( .A(n718), .B(n781), .Q(N1055) );
  INV3 U773 ( .A(N977), .Q(n781) );
  NOR21 U774 ( .A(n718), .B(n783), .Q(N1053) );
  INV3 U775 ( .A(N975), .Q(n783) );
  NOR21 U776 ( .A(n719), .B(n779), .Q(N1057) );
  INV3 U777 ( .A(N979), .Q(n779) );
  NOR21 U778 ( .A(n720), .B(n780), .Q(N1056) );
  INV3 U779 ( .A(N978), .Q(n780) );
  NOR21 U780 ( .A(n651), .B(n741), .Q(N508) );
  INV3 U781 ( .A(N463), .Q(n741) );
  NOR21 U782 ( .A(n651), .B(n743), .Q(N506) );
  INV3 U783 ( .A(N461), .Q(n743) );
  NOR21 U784 ( .A(n651), .B(n745), .Q(N504) );
  INV3 U785 ( .A(N459), .Q(n745) );
  NOR21 U786 ( .A(n651), .B(n742), .Q(N507) );
  INV3 U787 ( .A(N462), .Q(n742) );
  NOR21 U788 ( .A(n651), .B(n744), .Q(N505) );
  INV3 U789 ( .A(N460), .Q(n744) );
  NOR21 U790 ( .A(c[0]), .B(n651), .Q(N503) );
  NOR21 U791 ( .A(n761), .B(N1091), .Q(n649) );
  NOR21 U792 ( .A(n710), .B(n711), .Q(n686) );
  INV3 U793 ( .A(N1091), .Q(n759) );
  INV3 U794 ( .A(n445), .Q(n746) );
  NOR21 U795 ( .A(n686), .B(j[3]), .Q(n685) );
  NOR21 U796 ( .A(n746), .B(n711), .Q(N846) );
  NOR21 U797 ( .A(n712), .B(n759), .Q(N565) );
  INV3 U798 ( .A(n618), .Q(n726) );
  INV3 U799 ( .A(n632), .Q(n758) );
  NOR21 U800 ( .A(n724), .B(n787), .Q(N789) );
  INV3 U801 ( .A(N711), .Q(n787) );
  NOR21 U802 ( .A(n718), .B(n765), .Q(N1071) );
  INV3 U803 ( .A(N993), .Q(n765) );
  NOR21 U804 ( .A(n651), .B(n727), .Q(N522) );
  INV3 U805 ( .A(N477), .Q(n727) );
  AOI311 U806 ( .A(n427), .B(n810), .C(n677), .D(n693), .Q(n679) );
  NOR21 U807 ( .A(n752), .B(n429), .Q(n693) );
  NAND41 U808 ( .A(n673), .B(n674), .C(n675), .D(n676), .Q(n669) );
  NOR40 U809 ( .A(i[8]), .B(i[7]), .C(i[6]), .D(i[5]), .Q(n676) );
  NOR40 U810 ( .A(i[19]), .B(i[18]), .C(i[17]), .D(i[9]), .Q(n675) );
  NOR40 U811 ( .A(i[15]), .B(i[14]), .C(i[13]), .D(i[4]), .Q(n674) );
  NAND41 U812 ( .A(n652), .B(n653), .C(n654), .D(n655), .Q(n618) );
  NOR40 U813 ( .A(c[9]), .B(n656), .C(c[10]), .D(c[15]), .Q(n655) );
  NOR40 U814 ( .A(n657), .B(c[0]), .C(c[1]), .D(c[5]), .Q(n654) );
  NOR40 U815 ( .A(c[11]), .B(n658), .C(c[7]), .D(c[4]), .Q(n653) );
  NAND22 U816 ( .A(stateQ_0_), .B(n422), .Q(n663) );
  AOI311 U817 ( .A(n435), .B(i[0]), .C(n620), .D(n671), .Q(n670) );
  NOR31 U818 ( .A(n660), .B(n663), .C(j[3]), .Q(n671) );
  NAND22 U819 ( .A(n441), .B(n440), .Q(n672) );
  XNR21 U820 ( .A(old_i_data), .B(n763), .Q(n638) );
  XNR21 U821 ( .A(sin_was_positiveQ), .B(n638), .Q(n678) );
  NOR31 U822 ( .A(n421), .B(stateQ_0_), .C(i_empty), .Q(n445) );
  NOR40 U823 ( .A(i[12]), .B(i[11]), .C(i[10]), .D(i[16]), .Q(n673) );
  NOR40 U824 ( .A(j[12]), .B(j[11]), .C(j[10]), .D(j[16]), .Q(n699) );
  NOR40 U825 ( .A(c[17]), .B(n659), .C(c[16]), .D(c[6]), .Q(n652) );
  NAND22 U826 ( .A(n703), .B(n704), .Q(n659) );
  NOR40 U827 ( .A(j[15]), .B(j[14]), .C(j[13]), .D(j[4]), .Q(n700) );
  AOI2111 U828 ( .A(n440), .B(j[3]), .C(j[2]), .D(n442), .Q(n690) );
  NOR31 U829 ( .A(n663), .B(n439), .C(n660), .Q(n621) );
  INV3 U830 ( .A(n698), .Q(n808) );
  NAND41 U831 ( .A(n699), .B(n700), .C(n701), .D(n702), .Q(n698) );
  NOR40 U832 ( .A(j[8]), .B(j[7]), .C(j[6]), .D(j[5]), .Q(n702) );
  NOR40 U833 ( .A(j[19]), .B(j[18]), .C(j[17]), .D(j[9]), .Q(n701) );
  OAI311 U834 ( .A(n660), .B(n439), .C(n709), .D(stateQ_0_), .Q(N1098) );
  NAND31 U835 ( .A(n786), .B(n633), .C(n435), .Q(n634) );
  AOI211 U836 ( .A(n435), .B(n786), .C(n631), .Q(n630) );
  OAI311 U837 ( .A(n661), .B(n709), .C(n785), .D(stateI_0_), .Q(N1092) );
  NAND31 U838 ( .A(reset), .B(stateQ_0_), .C(n662), .Q(N1083) );
  AOI2111 U839 ( .A(n620), .B(n806), .C(n713), .D(n621), .Q(n662) );
  NAND22 U840 ( .A(n428), .B(n642), .Q(n632) );
  NAND22 U841 ( .A(n705), .B(n706), .Q(n658) );
  INV3 U842 ( .A(n664), .Q(n749) );
  OAI311 U843 ( .A(n665), .B(n666), .C(j[3]), .D(n667), .Q(n664) );
  NAND41 U844 ( .A(n436), .B(i[2]), .C(n809), .D(n668), .Q(n667) );
  NAND31 U845 ( .A(n808), .B(n440), .C(n751), .Q(n665) );
  NAND22 U846 ( .A(reset), .B(n618), .Q(n651) );
  NAND22 U847 ( .A(reset), .B(n677), .Q(N1077) );
  NOR21 U848 ( .A(n421), .B(n749), .Q(N1082) );
  NAND22 U849 ( .A(reset), .B(n754), .Q(N795) );
  NAND22 U850 ( .A(n749), .B(reset), .Q(N1081) );
  NAND22 U851 ( .A(n670), .B(reset), .Q(N1079) );
  INV3 U852 ( .A(n622), .Q(n747) );
  NOR40 U853 ( .A(N1091), .B(n748), .C(stateI_0_), .D(stateQ_0_), .Q(n622) );
  INV3 U854 ( .A(n619), .Q(n753) );
  AOI311 U855 ( .A(stateQ_0_), .B(n806), .C(n620), .D(n621), .Q(n619) );
  NOR31 U856 ( .A(i_empty), .B(stateI_0_), .C(n714), .Q(N1091) );
  XNR21 U857 ( .A(n715), .B(n638), .Q(n624) );
  NAND22 U858 ( .A(n428), .B(n427), .Q(n633) );
  NAND22 U859 ( .A(n442), .B(j[2]), .Q(n666) );
  AOI221 U860 ( .A(n646), .B(n435), .C(n710), .D(n756), .Q(N791) );
  NOR21 U861 ( .A(n436), .B(n647), .Q(n646) );
  XNR21 U862 ( .A(i[0]), .B(i[2]), .Q(n647) );
  AOI221 U863 ( .A(n694), .B(n439), .C(n710), .D(n663), .Q(N1073) );
  AOI211 U864 ( .A(n695), .B(n666), .C(n440), .Q(n694) );
  NAND22 U865 ( .A(n441), .B(j[0]), .Q(n695) );
  AOI211 U866 ( .A(n746), .B(n759), .C(stateQ_0_), .Q(N1050) );
  NAND22 U867 ( .A(n423), .B(c[2]), .Q(n656) );
  NAND22 U868 ( .A(n707), .B(n708), .Q(n657) );
  NOR21 U869 ( .A(n761), .B(n433), .Q(n443) );
  NOR21 U870 ( .A(n761), .B(n432), .Q(n444) );
  INV3 U871 ( .A(reset), .Q(n761) );
  INV3 U872 ( .A(i_data), .Q(n763) );
endmodule

