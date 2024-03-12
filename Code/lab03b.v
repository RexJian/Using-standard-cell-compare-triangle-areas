`timescale 1ns/1ps
module HALF_ADDER(a1, a2, p, c);
	input a1, a2;
	output p, c;
	XOR2D1BWP16P90 xor0(.A1(a1), .A2(a2), .Z(p));
	AN2D12BWP16P90 and0(.A1(a1), .A2(a2), .Z(c));
endmodule

module FULL_ADDER(a1, a2, c_in, p, c);
	input a1, a2, c_in;
	wire tmp1, tmp2, tmp3;
 	output p, c;
	XOR3D1BWP16P90 xor90(.A1(a1), .A2(a2), .A3(c_in), .Z(p));

	AN2D12BWP16P90 and0(.A1(a1), .A2(a2), .Z(tmp1));
	AN2D12BWP16P90 and1(.A1(a1), .A2(c_in), .Z(tmp2));
	AN2D12BWP16P90 and3(.A1(a2), .A2(c_in), .Z(tmp3));
	OR3D1BWP16P90 or0(.A1(tmp1), .A2(tmp2), .A3(tmp3), .Z(c));
enmodule

module BIT_MUL(one_bit, mul_arr, out_arr);
	input one_bit;
	input [8:0] mul_arr;
	input [8:0] out_arr;

	AN2D12BWP16P90 and0(.A1(one_bit), .A2(mul_arr[0]), .Z(out_arr[0]));
	AN2D12BWP16P90 and1(.A1(one_bit), .A2(mul_arr[1]), .Z(out_arr[1]));	
	AN2D12BWP16P90 and2(.A1(one_bit), .A2(mul_arr[2]), .Z(out_arr[2]));
	AN2D12BWP16P90 and3(.A1(one_bit), .A2(mul_arr[3]), .Z(out_arr[3]));
	AN2D12BWP16P90 and4(.A1(one_bit), .A2(mul_arr[4]), .Z(out_arr[4]));
	AN2D12BWP16P90 and5(.A1(one_bit), .A2(mul_arr[5]), .Z(out_arr[5]));
	AN2D12BWP16P90 and6(.A1(one_bit), .A2(mul_arr[6]), .Z(out_arr[6]));
	AN2D12BWP16P90 and7(.A1(one_bit), .A2(mul_arr[7]), .Z(out_arr[7]));
	AN2D12BWP16P90 and8(.A1(one_bit), .A2(mul_arr[8]), .Z(out_arr[8]));
endmodule

module CAL_PROD(p0, p1, p2, p3, p4, p5, p6, p7, p8, prod);
	input [8:0] p0, p1, p2, p3, p4, p5, p6, p7,p8;
	output [17:0] prod;
	wire carry1_buf;
	wire [1:0] carry2_buf;
	wire [2:0] carry3_buf;
	wire [3:0] carry4_buf;
	wire [4:0] carry5_buf;
	wire [5:0] carry6_buf;
	wire [6:0] carry7_buf;
	wire [7:0] carry8_buf;
	wire [7:0] carry9_buf;
	wire [6:0] carry10_buf;
	wire [5:0] carry11_buf;
	wire [4:0] carry12_buf;
	wire [3:0] carry13_buf;
	wire [2:0] carry14_buf;
	wire [1:0] carry15_buf;
	wire carry16_buf;

	wire sum2_buf;
	wire [1:0] sum3_buf;
	wire [2:0] sum4_buf;
	wire [3:0] sum5_buf;
	wire [4:0] sum6_buf;
	wire [5:0] sum7_buf;
	wire [6:0] sum8_buf;
	wire [6:0] sum9_buf;
	wire [5:0] sum10_buf;
	wire [4:0] sum11_buf;
	wire [3:0] sum12_buf;
	wire [2:0] sum13_buf;
	wire [1:0] sum14_buf;
	wire sum15_buf;
	
	BUFFD12BWP16P90 buf0_1(.I(p0[0]), .Z(prod[0]))

	HALF_ADDER half1_1(.a(p0[0]), .a2(p1[0]), .p(prod[1]), .c(carry1_buf));
	
	HALF_ADDER half2_1(.a(p0[2]), .a2(p1[1]), .p(sum2_buf), .c(carry2_buf[0]));
	FULL_ADDER full2_1(.a1(sum2_buf), .a2(p2[0]), .c_in(carry1_buf), .p(prod[2]), .c(carry2_buf[1]));
	
	HALF_ADDER half3_1(.a(p0[3]), .a2(p1[2]), .p(sum3_buf[0]), .c(carry3_buf[0]));
	FULL_ADDER full3_1(.a1(sum3_buf[0]), .a2(p2[1]), .c_in(carry2_buf[0]), .p(sum3_buf[1]), .c(carry3_buf[1]));
	FULL_ADDER full3_2(.a1(sum3_buf[1]), .a2(p3[0]), .c_in(carry2_buf[1]), .p(prod[3]), .c(carry3_buf[2]));
	

	HALF_ADDER half4_1(.a(p0[4]), .a2(p1[3]), .p(sum4_buf[0]), .c(carry4_buf[0]));
	FULL_ADDER full4_1(.a1(sum4_buf[0]), .a2(p2[2]), .c_in(carry3_buf[0]), .p(sum4_buf[1]), .c(carry4_buf[1]));
	FULL_ADDER full4_2(.a1(sum4_buf[1]), .a2(p3[1]), .c_in(carry3_buf[1]), .p(sum4_buf[2]), .c(carry4_buf[2]));
	FULL_ADDER full4_3(.a1(sum4_buf[2]), .a2(p4[0]), .c_in(carry3_buf[2]), .p(prod[4]), .c(carry4_buf[3]));


	HALF_ADDER half5_1(.a(p0[5]), .a2(p1[4]), .p(sum5_buf[0]), .c(carry5_buf[0]));
	FULL_ADDER full5_1(.a1(sum5_buf[0]), .a2(p2[3]), .c_in(carry4_buf[0]), .p(sum5_buf[1]), .c(carry5_buf[1]));
	FULL_ADDER full5_2(.a1(sum5_buf[1]), .a2(p3[2]), .c_in(carry4_buf[1]), .p(sum5_buf[2]), .c(carry5_buf[2]));
	FULL_ADDER full5_3(.a1(sum5_buf[2]), .a2(p4[1]), .c_in(carry4_buf[2]), .p(sum5_buf[3]), .c(carry5_buf[3]));
	FULL_ADDER full5_4(.a1(sum5_buf[3]), .a2(p5[0]), .c_in(carry4_buf[3]), .p(prod[5]), .c(carry5_buf[4]));


	HALF_ADDER half6_1(.a(p0[6]), .a2(p1[5]), .p(sum6_buf[0]), .c(carry6_buf[0]));
	FULL_ADDER full6_1(.a1(sum6_buf[0]), .a2(p2[4]), .c_in(carry5_buf[0]), .p(sum6_buf[1]), .c(carry6_buf[1]));
	FULL_ADDER full6_2(.a1(sum6_buf[1]), .a2(p3[3]), .c_in(carry5_buf[1]), .p(sum6_buf[2]), .c(carry6_buf[2]));
	FULL_ADDER full6_3(.a1(sum6_buf[2]), .a2(p4[2]), .c_in(carry5_buf[2]), .p(sum6_buf[3]), .c(carry6_buf[3]));
	FULL_ADDER full6_4(.a1(sum6_buf[3]), .a2(p5[1]), .c_in(carry5_buf[3]), .p(sum6_buf[4]), .c(carry6_buf[4]));
	FULL_ADDER full6_4(.a1(sum6_buf[4]), .a2(p6[0]), .c_in(carry5_buf[4]), .p(prod[6]), .c(carry6_buf[5]));


	HALF_ADDER half7_1(.a(p0[7]), .a2(p1[6]), .p(sum7_buf[0]), .c(carry7_buf[0]));
	FULL_ADDER full7_1(.a1(sum7_buf[0]), .a2(p2[5]), .c_in(carry6_buf[0]), .p(sum7_buf[1]), .c(carry7_buf[1]));
	FULL_ADDER full7_2(.a1(sum7_buf[1]), .a2(p3[4]), .c_in(carry6_buf[1]), .p(sum7_buf[2]), .c(carry7_buf[2]));
	FULL_ADDER full7_3(.a1(sum7_buf[2]), .a2(p4[3]), .c_in(carry6_buf[2]), .p(sum7_buf[3]), .c(carry7_buf[3]));
	FULL_ADDER full7_4(.a1(sum7_buf[3]), .a2(p5[2]), .c_in(carry6_buf[3]), .p(sum7_buf[4]), .c(carry7_buf[4]));
	FULL_ADDER full7_4(.a1(sum7_buf[4]), .a2(p6[1]), .c_in(carry6_buf[4]), .p(sum7_buf[5]), .c(carry7_buf[5]));
	FULL_ADDER full7_5(.a1(sum7_buf[5]), .a2(p7[0]), .c_in(carry6_buf[5]), .p(prod[7]), .c(carry7_buf[6]));

	
	HALF_ADDER half8_1(.a(p0[8]), .a2(p1[7]), .p(sum8_buf[0]), .c(carry8_buf[0]));
	FULL_ADDER full8_1(.a1(sum8_buf[0]), .a2(p2[6]), .c_in(carry8_buf[0]), .p(sum8_buf[1]), .c(carry8_buf[1]));
	FULL_ADDER full8_2(.a1(sum8_buf[1]), .a2(p3[5]), .c_in(carry8_buf[1]), .p(sum8_buf[2]), .c(carry8_buf[2]));
	FULL_ADDER full8_3(.a1(sum8_buf[2]), .a2(p4[4]), .c_in(carry8_buf[2]), .p(sum8_buf[3]), .c(carry8_buf[3]));
	FULL_ADDER full8_4(.a1(sum8_buf[3]), .a2(p5[3]), .c_in(carry8_buf[3]), .p(sum8_buf[4]), .c(carry8_buf[4]));
	FULL_ADDER full8_5(.a1(sum8_buf[4]), .a2(p6[2]), .c_in(carry8_buf[4]), .p(sum8_buf[5]), .c(carry8_buf[5]));
	FULL_ADDER full8_6(.a1(sum8_buf[5]), .a2(p7[1]), .c_in(carry8_buf[5]), .p(sum8_buf[6]), .c(carry8_buf[6]));
	FULL_ADDER full8_7(.a1(sum8_buf[6]), .a2(p8[0]), .c_in(carry8_buf[6]), .p(prod[8]), .c(carry8_buf[7]));


	FULL_ADDER full9_1(.al(p1[8]), .a2(p2[7]), .c_in(carry8_buf[0]), .p(sum9_buf[0]), .c(carry9_buf[0])); 
	FULL_ADDER full9_2(.al (sum9_buf[0]), .a2 (p3 [6]), .c_in(carry8_buf[1]), .p(sum9_buf[1]), .c(carry9_buf[1])); 
	FULL_ADDER full9_3(.al(sum9_buf[1]), .a2 (p4[5]), .c_in(carry8_buf[2]), .p(sum9_buf[2]), .c(carry9_buf[2])); 
	FULL_ADDER full9_4(.al(sum9_buf[2]), .a2(p5[4]), .c_in(carry8_buf[3]), .p(sum9_buf[3]), .c(carry9_buf[3]));
	FULL_ADDER full9_5(.al (sum9_buf[3]), .a2 (p6[3]), .c_in(carry8_buf[4]), .p(sum9_buf[4]), .c(carry9_buf[4]));
	FULL_ADDER full9_6(.al(sum9_buf[4]), .a2 (p7[2]), .c_in(carry8_buf[5]), .p(sum9_buf[5]), .c(carry9_buf[5]));
	FULL_ADDER full9_7(.al(sum9_buf[5]), .a2 (p8[1]), .c_in(carry8_buf[6]), .p(sum9_buf[6]), .c(carry9_buf[6])); 
	HALF_ADDER half9_1(.al(sum9_buf[6]), .a2(carry8_buf[7]), .p(prod [9]), .c(carry9_buf[7]));

	FULL_ADDER full10_1(.al(p2[8]), .a2(p3[7]), .c_in(carry9_buf[0]), .p(sum10_buf[0]), .c(carry10_buf[0])); 
	FULL_ADDER full10_2(.al(sum10_buf[0]), .a2(p4[6]), .c_in(carry9_buf[1]), .p(sum10_buf[1]), .c(carry10_buf[1]));
	FULL_ADDER full10_3(.al(sum10_buf[1]), .a2(p5[5]), .c_in(carry9_buf[2]), .p(sum10_buf[2]), .c(carry10_buf[2]));
	FULL_ADDER full10_4(.al(sum10_buf[2]), .a2(p6[4]), .c_in(carry9_buf[3]), .p(sum10_buf[3]), .c(carry10_buf[3]));
	FULL_ADDER full10_5(.al(sum10_buf[3]), .a2 (p7 [3]), .c_in (carry9_buf[4]), .p(sum10_buf[4]), .c(carry10_buf[4]));
	FULL_ADDER full10_6(.al (sum10_buf[4]), .a2 (p8 [2]), .c_in (carry9_buf[5]), .p(sum10_buf[5]), .c(carry10_buf[5])); 
	FULL_ADDER full10_7(.al(sum10_buf[5]), .a2(carry9_buf[6]), .c_in(carry9_buf[7]), .p(prod [10]), .c(carry10_buf[6])); 

	FULL_ADDER full11_1(.al(p3 [8]), .a2(p4[7]), .c_in(carry10_buf[0]), .p(sum11_buf[0]), .c(carry11_buf[0]));
	FULL_ADDER full11_2(.al(sum11_buf[0]), .a2 (p5[6]), .c_in(carry10_buf[1]), .p(sum11_buf[1]), .c(carryl1_buf[1]));
	FULL_ADDER full11_3(.al(sum11_buf[1]), .a2 (p6[5]), .c_in(carry10_buf[2]), .p(sum11_buf[2]), .c(carryl1_buf[2]));
	FULL_ADDER full11_4(.al(sum11_buf[2]), .a2(p7[4]), .c_in(carry10_buf[3]), .p(sum11_buf[3]), .c(carry11 buf[3]));
	FULL_ADDER full11_5(.al(sum11_buf[3]), .a2 (p8[3]), .c_in (carry10_buf[4]), .p(sum11_buf[4]), .c(carry11_buf[4]));
	FULL_ADDER full11_6(.al(sum11_buf[4]), .a2 (carry10_buf[5]), .c_in(carry10_buf[6]), .p(prod[11]), .c(carryl1_buf[5]));

	FULL_ADDER full12_1(.al(p4[8]), .a2(p5[7]), .c_in (carryl1_buf[0]), .p(sum12_buf[0]), .c(carry12_buf[0]));
	FULL_ADDER full12_2(.al(sum12_buf[0]), .a2 (p6[6]), .c_in(carry11_buf[1]), .p(sum12_buf[1]), .c(carry12_buf[1]));
	FULL_ADDER full12_3(.al(sum12_buf[1]), .a2 (p7[5]), .c_in(carryl1_buf[2]), .p(sum12_buf[2]), .c(carry12_buf[2]));
	FULL_ADDER full12_4(.al(sum12_buf[2]), .a2 (p8 [4]), .c_in(carryl1_buf[3]), .p(sum12_buf[3]), .c(carry12_buf[3]));
	FULL_ADDER full12_5(.al(sum12_buf[3]), .a2 (carry11_buf[4]), .c_in(carryl1_buf[5]), .p(prod[12]), .c(carry12_buf[4]));

	FULL_ADDER full13_1(.al(p5 [8]), .a2(p6[7]), .c_in(carry12_buf[0]), .p(sum13_buf[0]), .c(carry13_buf[0]));
	FULL_ADDER full13_2(.al(sum13_buf[0]), .a2(p7[6]), .c_in(carry12_buf[1]), .p(sum13_buf[1]), .c(carry13_buf[1]));
	FULL_ADDER full13_3(.al(sum13_buf[1]), .a2(p8[5]), .c_in(carry12_buf[2]), .p(sum13_buf[2]), .c(carry13_buf[2]));
	FULL_ADDER full13_4(.al(sum13_buf[2]), .a2(carry12_buf[3]), .c_in(carry12_buf[4]), .p(prod[13]), .c(carry13_buf[3]));

	FULL_ADDER full14_1(.al(p6[8]), .a2(p7[7]), .c_in(carry13_buf[0]), .p(sum14_buf[0]), .c(carry14_buf[0]));
	FULL_ADDER full14_2(.al(sum14_buf[0]), .a2(p8[6]), .c_in(carry13_buf[1]), .p(sum14_buf[1]), .c(carry14_buf[1]));
	FULL_ADDER full14_3(.al(sum14_buf[1]), .a2(carry13_buf[2]), .c_in(carry13_buf[3]), .p(prod[14]), .c(carry14_buf[2]));
	
	FULL_ADDER full15_1(.al(p7[8]), .a2(p8[7]), .c_in(carry14_buf[0]), .p(sum15_buf), .c(carry15_buf[0]));	
	FULL_ADDER full15_2(.al (sum15_buf), .a2 (carry14_buf[1]), .c_in(carry14_buf[2]), .p(prod [15]), .c(carry15_buf[1]));

	FULL_ADDER full16_1(.al(p8[8]), .a2(carry15 buf[0]), .c in(carry15 buf[1]), .p(prod[16]), .c(prod[17]));


endmodule


module SHIFT_18BITS_RIGHT1 (in_data, out_data);
	input [17:0] in_data;
	output [16:0] out_data;
	BUFFD12BWP16P90 buf0(.I(in_data[1]), .Z(out_data[0])); 
	BUFFD12BWP16P90 buf1(.I(in_data[2]), .Z(out_data[1]));
	BUFFD12BWP16P90 buf2(.I(in_data[3]), .Z(out_data[2])); 
	BUFFD12BWP16P90 buf3(.I (in_data[4]), .Z(out_data[3]));
	BUFFD12BWP16P90 buf4(.I(in_data[5]), .Z(out_data[4]));
	BUFFD12BWP16P90 buf5(.I(in_data[6]), .Z(out_data[5])); 
	BUFFD12BWP16P90 buf6(.I (in_data[7]), .Z(out_data[6])); 
	BUFFD12BWP16P90 buf7(.I(in_data[8]), .Z(out_data[7])); 
	BUFFD12BWP16P90 buf8(.I(in_data[9]), .Z(out_data[8])); 
	BUFFD12BWP16P90 buf9(.I(in_data[10]), .Z(out_data[9]));
	BUFFD12BWP16P90 buf10(.I(in_data[11]), .Z(out_data[10])); 
	BUFFD12BWP16P90 buf11(.I(in_data[12]), .Z(out_data[11])); 
	BUFFD12BWP16P90 buf12(.I(in_data[13]), .Z(out_data[12])); 
	BUFFD12BWP16P90 buf13(.I(in_data[14]), .Z(out_data[13]));
	BUFFD12BWP16P90 buf14(.I(in_data[15]), .Z(out_data[14])); 
	BUFFD12BWP16P90 buf15(.I(in_data[16]), .Z(out_data[15]));
	BUFFD12BWP16P90 buf16(.I(in_data[17]), .Z(out_data[16]));
endmodule


module SUB_16BITS (op, sub_op, is_neg);
	input[16:0] op, sub_op; output is_neg;
	wire[16:0] add_result;
	wire [17:0] op_tmp, sub_op_tmp, sub_op_tmp2, carry_tmp, add_carry_tmp; 
	BUFFD12BWP16P90 op_buf0(.I(op[0]), .Z(op_tmp[0])); 
	BUFFD12BWP16P90 op_buf1(.I(op[1]), .Z(op_tmp[1])); 
	BUFFD12BWP16P90 op_buf2(.I(op [2]), .Z(op_tmp[2])); 
	BUFFD12BWP16P90 op_buf3(.I(op[3]), .Z(op_tmp[3])); 
	BUFFD12BWP16P90 op_buf4(.I(op[4]), .Z(op_tmp[4])); 
	BUFFD12BWP16P90 op_buf5(.I(op[5]), .Z(op_tmp[5])); 
	BUFFD12BWP16P90 op_buf6(.I(op [6]), .Z(op_tmp[6])); 
	BUFFD12BWP16P90 op_buf7(.I(op [7]), .Z(op_tmp[7])); 
	BUFFD12BWP16P90 op_buf8(.I(op[8]), .Z(op_tmp[8])); 
	BUFFD12BWP16P90 op_buf9(.I(op[9]), .Z(op_tmp[9])); 
	BUFFD12BWP16P90 op_buf10(.I(op[10]), .Z(op_tmp[10])); 
	BUFFD12BWP16P90 op_buf11(.I(op[11]), .Z(op_tmp[11])); 
	BUFFD12BWP16P90 op_buf12(.I(op[12]), .Z(op_tmp[12])); 
	BUFFD12BWP16P90 op_buf13 (.I(op[13]), .Z(op_tmp[13])); 
	BUFFD12BWP16P90 op_buf14(.I(op[14]), .Z(op_tmp[14])); 
	BUFFD12BWP16P90 op_buf15 (.I(op[15]), .Z(op_tmp[15])); 
	BUFFD12BWP16P90 op_buf16(.I(op[16]), .Z(op_tmp[16])); 
	BUFFD12BWP16P90 op_buf17 (.I(1'b0), .Z(op_tmp[17]));

	XOR2D1BWP16P90 sub_xor0(.A1 (sub_op[0]), .A2 (1'b1), .Z(sub_op_tmp[0])); 
	XOR2D1BWP16P90 sub_xor1(.Al(sub_op[1]), .A2(1'b1), .Z(sub_op_tmp[1])); 
	XOR2D1BWP16P90 sub_xor2(.A1 (sub_op[2]), .A2 (1'b1), .Z(sub_op_tmp[2])); 
	XOR2D1BWP16P90 sub_xor3(.A1 (sub_op [3]), .A2 (1'b1), .Z(sub_op_tmp[3])); 
	XOR2D1BWP16P90 sub_xor4(.A1 (sub_op[4]), .A2 (1'b1), .Z(sub_op_tmp[4])); 
	XOR2D1BWP16P90 sub_xor5(.A1 (sub_op[5]), .A2 (1'b1), .Z(sub_op_tmp[5]));
	XOR2D1BWP16P90 sub_xor6(.A1 (sub_op[6]), .A2 (1'b1), .Z(sub_op_tmp[6])); 
	XOR2D1BWP16P90 sub_xor7(.A1 (sub_op [7]), .A2 (1'b1), .Z(sub_op_tmp[7]));
	XOR2D1BWP16P90 sub_xor8 (.A1 (sub_op [8]), .A2 (1'b1), .Z(sub_op_tmp[8]));
	XOR2D1BWP16P90 sub_xor9(.A1 (sub_op [9]), .A2 (1'b1), .Z(sub_op_tmp[9]));
	XOR2D1BWP16P90 sub_xor10(.A1 (sub_op[10]), .A2 (1'b1), .Z(sub_op_tmp[10])); 
	XOR2D1BWP16P90 sub_xor11(.A1 (sub_op[11]), .A2 (1'b1), .Z(sub_op_tmp[11])); 
	XOR2D1BWP16P90 sub_xor12(.A1 (sub_op[12]), .A2 (1'b1), .Z(sub_op_tmp[12])); 
	XOR2D1BWP16P90 sub_xor13(.A1(sub_op[13]), .A2(1'b1), .Z(sub_op_tmp[13])); 
	XOR2D1BWP16P90 sub_xor14(.A1 (sub_op[14]), .A2(1'b1), .Z(sub_op_tmp[14])); 
	XOR2D1BWP16P90 sub_xor15(.A1 (sub_op[15]), .A2 (1'b1), .Z(sub_op_tmp[15])); 
	XOR2D1BWP16P90 sub_xor16(.A1 (sub_op[16]), .A2 (1'b1), .Z(sub_op_tmp[16])); 
	BUFFD12BWP16P90 sub_buf17(.I(1'b1), .Z(sub_op_tmp[17]));
	HALF_ADDER sub_op_half_adde (.al(sub_op_tmp[0]), .a2(1'b1), .p(sub_op_tmp2[0]), .c(carry_tmp[0])); 
	HALF_ADDER sub_op_half_addl(.al(sub_op_tmp[1]), .a2 (carry_tmp[0]), .p(sub_op_tmp2[1]), .c(carry_tmp[1])); 
	HALF_ADDER sub_op_half_add2(.al(sub_op_tmp[2]), .a2 (carry_tmp[1]), .p(sub_op_tmp2[2]), .c(carry_tmp[2])); 
	HALF_ADDER sub_op_half_add3(.al(sub_op_tmp[3]), .a2 (carry_tmp[2]), .p(sub_op_tmp2[3]), .c(carry_tmp[3])); 
	HALF_ADDER sub_op_half_add4(.al(sub_op_tmp[4]), .a2 (carry_tmp[3]), .p(sub_op_tmp2[4]), .c(carry_tmp[4])); 
	HALF_ADDER sub_op_half_add5(.al(sub_op_tmp[5]), .a2(carry_tmp[4]), .p(sub_op_tmp2[5]), .c(carry_tmp[5])); 
	HALF_ADDER sub_op_half_add6(.al(sub_op_tmp[6]), .a2 (carry_tmp[5]), .p(sub_op_tmp2[6]), .c(carry_tmp[6])); 
	HALF_ADDER sub_op_half_add7(.al (sub_op_tmp[7]), .a2 (carry_tmp[6]), .p(sub_op_tmp2[7]), .c(carry_tmp[7])); 
	HALF_ADDER sub_op_half_add8(.al(sub_op_tmp[8]), .a2 (carry_tmp[7]), .p(sub_op_tmp2[8]), .c(carry_tmp[8])); 
	HALF_ADDER sub_op_half_add9 (.al(sub_op_tmp[9]), .a2 (carry_tmp[8]), .p(sub_op_tmp2[9]), .c(carry_tmp[9])); 
	HALF_ADDER sub_op_half_add10(.al(sub_op_tmp[10]), .a2 (carry_tmp[9]), .p(sub_op_tmp2[10]), .c(carry_tmp[10])); 
	HALF_ADDER sub_op_half_add11(.al(sub_op_tmp[11]), .a2(carry_tmp[10]), .p(sub_op_tmp2[11]), .c(carry_tmp[11])); 
	HALF_ADDER sub_op_half_add12(.al(sub_op_tmp[12]), .a2(carry_tmp[11]), .p(sub_op_tmp2[12]), .c(carry_tmp[12])); 
	HALF_ADDER sub_op_half_add13(.al(sub_op_tmp[13]), .a2 (carry_tmp[12]), .p(sub_op_tmp2[13]), .c(carry_tmp[13])); 
	HALF_ADDER sub_op_half_add14(.al(sub_op_tmp[14]), .a2(carry_tmp[13]), .p(sub_op_tmp2[14]), .c(carry_tmp[14])); 
	HALF_ADDER sub_op_half_add15 (.al(sub_op_tmp[15]), .a2(carry_tmp[14]), .p(sub_op_tmp2[15]), .c(carry_tmp[15])); 
	HALF_ADDER sub_op_half_add16 (.al (sub_op_tmp[16]), .a2 (carry_tmp[15]), .p(sub_op_tmp2[16]), .c(carry_tmp[16])); 
	HALF_ADDER sub_op_half_add17(.al(sub_op_tmp[17]), .a2 (carry_tmp[16]), .p(sub_op_tmp2[17]), .c(carry_tmp[17]));


	HALF_ADDER final_add0(.al(op_tmp[0]), .a2(sub_op_tmp2[0]), .p(add_result[0]), .c(add_carry_tmp[0]));
	FULL_ADDER final_addl(.al(op_tmp[1]), .a2 (sub_op_tmp2[1]), .c_in(add_carry_tmp[0]), .p(add_result[1]), .c(add_carry_tmp[1])); 
	FULL_ADDR final_add2(.al(op_tmp[2]), .a2 (sub_op_tmp2[2]), .c_in(add_carry_tmp[1]), .p(add_result[2]), .c(add_carry_tmp[2])); 
	FULL_ADDER final_add3(.al(op_tmp[3]), .a2 (sub_op_tmp2[3]), .c_in(add_carry_tmp[2]), .p(add_result[3]), .c(add_carry_tmp[3])); 
	FULL ADDER final_add4(.al (op_tmp[4]), .a2 (sub_op_tmp2[4]), .c_in(add_carry_tmp[3]), .p(add_result[4]), .c(add_carry_tmp[4])); 
	FULL_ADDER final_add5(.al(op_tmp[5]), .a2 (sub_op_tmp2[5]), .c_in(add_carry_tmp[4]), .p(add_result[5]), .c(add_carry_tmp[5])); 
	FULL_ADDER final_add6(.al(op_tmp[6]), .a2(sub_op_tmp2[6]), .c_in(add_carry_tmp[5]), .p(add_result[6]), .c(add_carry_tmp[6])); 
	FULL_ADDER final_add7(.al(op_tmp[7]), .a2 (sub_op_tmp2[7]), .c_in(add_carry_tmp[6]), .p(add_result[7]), .c(add_carry_tmp[7])); 
	FULL_ADDER final_add8(.al(op_tmp[8]), .a2(sub_op_tmp2[8]), .c_in(add_carry_tmp[7]), .p(add_result[8]), .c(add_carry_tmp[8])); 
	FULL_ADDER final_add9 (.al(op_tmp[9]), .a2 (sub_op_tmp2[9]), .c_in(add_carry_tmp[8]), .p(add_result[9]), .c(add_carry_tmp[9])); 
	FULL ADDER final_add10(.al (op_tmp[10]), .a2 (sub_op_tmp2[10]), .c_in (add_carry_tmp[9]), .p(add_result[10]), .c(add_carry_tmp[10])); 
	FULL_ADDER final_add11(.al(op_tmp[11]), .a2(sub_op_tmp2[11]), .c_in(add_carry_tmp[10]), .p(add_result[11]), .c(add_carry_tmp[11])); 
	FULL_ADDER final_add12(.al(op_tmp[12]), .a2(sub_op_tmp2[12]), .c_in (add_carry_tmp[11]), .p(add_result[12]), .c(add_carry_tmp[12])); 
	FULL_ADDER final_add13 (.al (op_tmp[13]), .a2 (sub_op_tmp2[13]), .c_in (add_carry_tmp[12]), .p(add_result[13]), .c(add_carry_tmp[13])); 
	FULL ADDER final_add14(.al (op_tmp[14]), .a2 (sub_op_tmp2[14]), .c_in (add_carry_tmp[13]), .p(add_result[14]), .c(add_carry_tmp[14])); 
	FULL ADDER final_add15(.al(op_tmp[15]), .a2 (sub_op_tmp2[15]), .c_in(add_carry_tmp[14]), .p(add_result[15]), .c(add_carry_tmp[15])); 
	FULL_ADDER final_add16 (.al (op_tmp[16]), .a2 (sub_op_tmp2[16]), .c_in (add_carry_tmp[15]), .p(add_result[16]), .c(add_carry_tmp[16])); 
	FULL_ADDER final_add17(.al (op_tmp[17]), .a2 (sub_op_tmp2[17]), .c_in(add_carry_tmp[16]), .p(is_neg), .c(add_carry_tmp[17]));
endmodule


module SEL_BIGGER_AREA (areal, area2, hy1, hy2, area_result, h_result);
	input [16:0] areal, area2;
	input [8:0] hy1, hy2;
	output [16:0] area_result;
	output [8:0] h_result;
	wire is_area2;
	SUB_16BITS sub1(.op (areal), .sub_op (area2), .is_neg (is_area2));

	CKMUX2D1BWP16P90 mul_area0(.I0 (areal[0]), .I1(area2[0]), .S(is_area2), .Z(area_result[0]));
	CKMUX2D1BWP16P90 mul_areal(.I0 (areal[1]), .S(is_area2[1]), .S(is_area2), .Z(area_result[1])); 
	CKMUX2D1BWP16P90 mul_area2(.I0 (areal [2]), .S(is_area2[2]), .S(is_area2), .Z(area_result[2])); 
	CKMUX2D1BWP16P90 mul_area3(.I0 (areal[3]), .S(is_area2[3]), .S(is_area2), .Z(area_result[3])); 
	CKMUX2D1BWP16P90 mul_area4(.I0 (areal[4]), .I1(area2 [4]), .S(is_area2), .Z(area_result[4])); 
	CKMUX2D1BWP16P90 mul_area5(.I0 (areal[5]), .I1(area2 [5]), .S(is_area2), .Z(area_result[5])); 
	CKMUX2D1BWP16P90 mul_area6 (.I0 (areal[6]), .I1(area2 [6]), .S(is_area2), .Z(area_result[6])); 
	CKMUX2D1BWP16P90 mul_area7(.I0 (areal[7]), .I1(area2[7]), .S(is_area2), .Z(area_result[7])); 
	CKMUX2D1BWP16P90 mul_area8 (.I0 (areal[8]), .I1(area2 [8]), .S(is_area2), .Z(area_result[8])); 
	CKMUX2D1BWP16P90 mul_area9(.I0 (areal[9]), .I1(area2[9]), .S(is_area2), .Z(area_result[9])); 
	CKMUX2D1BWP16P90 mul_area10(.I0 (areal[10]), .I1(area2 [10]), .S(is_area2), .Z(area_result[10])); 
	CKMUX2D1BWP16P90 mul_areall(.I0 (areal[11]), .I1(area2 [11]), .S(is_area2), .Z(area_result[11])); 
	CKMUX2D1BWP16P90 mul_area12 (.I0 (area1[12]), .I1(area2 [12]), .S(is_area2), .Z(area_result[12])); 
	CKMUX2D1BWP16P90 mul_area13 (.I0 (areal[13]), .I1(area2 [13]), .S(is_area2), .Z(area_result[13])); 
	CKMUX2D1BWP16P90 mul_area14(.I0 (areal[14]), .I1(area2 [14]), .S(is_area2), .Z(area_result[14])); 
	CKMUX2D1BWP16P90 mul_area15(.I0(areal[15]), .I1(area2[15]), .S(is_area2), .Z(area_result[15])); 
	CKMUX2D1BWP16P90 mul_area16 (.I0 (areal [16]), .I1(area2 [16]), .S(is_area2), .Z(area_result[16]));

	CKMUX2D1BWP16P90 hypotnuse0 (.I0 (hyl[0]), .I1(hy2[0]), .S(is_area2), .Z(h_result[0])); 
	CKMUX2D1BWP16P90 hypotnusel(.I0 (hy1[1]), .I1(hy2[1]), .S(is_area2), .Z(h_result[1])); 
	CKMUX2D1BWP16P90 hypotnuse2 (.I0 (hy1[2]), .I1(hy2[2]), .S(is_area2), .Z(h_result[2])); 
	CKMUX2D1BWP16P90 hypotnuse3 (.I0 (hy1 [3]), .I1(hy2[3]), .S(is_area2), .Z(h_result[3])); 
	CKMUX2D1BWP16P90 hypotnuse4 (.I0 (hy1 [4]), .I1(hy2[4]), .S(is_area2), .Z(h_result[4])); 
	CKMUX2D1BWP16P90 hypotnuse5 (.I0 (hy1 [5]), .I1(hy2[5]), .S(is_area2), .Z(h_result[5])); 
	CKMUX2D1BWP16P90 hypotnuse6 (.I0 (hy1[6]), .I1(hy2[6]), .S(is_area2), .Z(h_result[6])); 
	CKMUX2D1BWP16P90 hypotnuse7(.I0 (hy1[7]), .I1(hy2[7]), .S(is_area2), .Z(h_result[7])); 
	CKMUX2D1BWP16P90 hypotnuse8 (.I0 (hy1 [8]), .I1(hy2[8]), .S(is_area2), .Z(h_result[8]));
endmodule


module lab03b (a, b, c, d, e, f, out, max);
	input [8:0] a, b, c, d, e, f;
	output [16:0] out;
	output [8:0] max;
	wire [17:0] prod1, prod2;
	wire [8:0] pl_0, pl_1, p1_2, p1_3, p1_4, p1_5, pl_6, p1_7, p1_8; wire [8:0] p2_0, p2_1, p2_2, p2_3, p2_4, p2_5, p2_6, p2_7, p2_8; wire [16:0] areal, area2;
	BIT_MUL bit_mull_0(.one_bit (b[0]), .mul_arr(a), .out_arr(p1_0)); 
	BIT_MUL bit_mull_1(.one_bit (b[1]), .mul_arr(a), .out_arr(p1_1)); 
	BIT_MUL bit_mul1_2(.one_bit(b[2]), .mul_arr(a), .out_arr(p1_2)); 
	BIT_MUL bit_mul1_3(.one_bit (b[3]), .mul_arr(a), .out_arr(p1_3)); 
	BIT MUL bit mull_4(.one_bit (b[4]), .mul_arr(a), .out_arr(p1_4)); 
	BIT MUL bit mull_5(.one_bit (b[5]), .mul_arr(a), .out_arr(p1_5));
	BIT_MUL bit_mull_6(.one_bit (b[6]), .mul_arr(a), .out_arr(p1_6)); 
	BIT_MUL bit_mul1_7(.one_bit (b[7]), .mul_arr(a), .out_arr(p1_7)); 
	BIT_MUL bit_mull_8(.one_bit(b[8]), .mul_arr(a), .out_arr(p1_8)); 
	BIT_MUL bit_mul2_0(.one_bit (e[0]), .mul_arr(d), .out_arr(p2_0)); 
	BIT_MUL bit_mul2_1(.one_bit(e[1]), .mul_arr(d), .out_arr(p2_1));
	BIT_MUL bit_mul2_2(.one_bit(e[2]), .mul_arr(d), .out_arr(p2_2)); 
	BIT_MUL bit_mul2_3(.one_bit(e[3]), .mul_arr(d), .out_arr(p2_3)); 
	BIT_MUL bit_mul2_4(.one_bit (e[4]), .mul_arr(d), .out_arr(p2_4)); 
	BIT_MUL bit_mul2_5(.one_bit(e[5]), .mul_arr(d), .out_arr(p2_5)); 
	BIT_MUL bit_mul2_6(.one_bit(e[6]), .mul_arr(d), .out_arr(p2_6)); 
	BIT_MUL bit_mul2_7(.one_bit (e[7]), .mul_arr(d), .out_arr(p2_7)); 
	BIT_MUL bit_mul2_8(.one_bit (e[8]), .mul_arr(d), .out_arr(p2_8));
	CAL_PROD bit8_mull(.p0 (p1_0), .pl(p1_1), .p2(p1_2), .p3 (p1_3), .p4(p1_4), .p5 (p1_5), .p6(p1_6), .p7(p1_7), .p8 (p1_8), .prod (prod1)); 
	CAL_PROD bit8_mul2(.p0(p2_0), .p1(p2_1), .p2(p2_2), .p3(p2_3), .p4 (p2_4), .p5(p2_5), .p6(p2_6), .p7 (p2_7), .p8 (p2_8), .prod(prod2)); 
	SHIFT_18BITS RIGHT1 shift1(.in_data(prod1), .out_data(areal));
	SHIFT_18BITS_RIGHT1 shift2(.in_data(prod2), .out_data(area2));
	SEL_BIGGER_AREA sel_area(.areal (areal), .area2 (area2), .hy1(c), .hy2(f), .area_result(out), .h_result(max));
endmodule