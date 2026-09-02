module fir_hvwtm_rca_32(clk,rst,x_in,y_out);
input clk,rst;
input [15:0]x_in;
output [31:0]y_out;

parameter h0  = 16'b0000000000000000; // 0
parameter h1  = 16'b0000000000000000; // 0
parameter h2  = 16'b0000000000001101; // 13
parameter h3  = 16'b0000000000110101; // 53
parameter h4  = 16'b0000000001101110; // 110
parameter h5  = 16'b0000000001111100; // 124
parameter h6  = 16'b0000000000000000; // 0
parameter h7  = 16'b1111111010101101; // -339
parameter h8  = 16'b1111110010110101; // -843
parameter h9  = 16'b1111101100010110; // -1258
parameter h10 = 16'b1111101110010010; // -1134
parameter h11 = 16'b0000000000000000; // 0
parameter h12 = 16'b0000100101000100; // 2372
parameter h13 = 16'b0001011001100010; // 5730
parameter h14 = 16'b0010010001100001; // 9313
parameter h15 = 16'b0010111100101000; // 12072
parameter h16 = 16'b0011001101001101; // 13133

wire [15:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10, x11, x12, x13, x14, x15, x16, x17, x18, x19,x20, x21, x22, x23, x24, x25, x26, x27, x28, x29,
            x30, x31, x32;

// d flip flop stage
assign x0=x_in;
d_ff dff_0(clk,rst,x0,x1);
d_ff dff_1(clk,rst,x1,x2);
d_ff dff_2(clk,rst,x2,x3);
d_ff dff_3(clk,rst,x3,x4);
d_ff dff_4(clk,rst,x4,x5);
d_ff dff_5(clk,rst,x5,x6);
d_ff dff_6(clk,rst,x6,x7);
d_ff dff_7(clk,rst,x7,x8);
d_ff dff_8(clk,rst,x8,x9);
d_ff dff_9(clk,rst,x9,x10);
d_ff dff_10(clk,rst,x10,x11);
d_ff dff_11(clk,rst,x11,x12);
d_ff dff_12(clk,rst,x12,x13);
d_ff dff_13(clk,rst,x13,x14);
d_ff dff_14(clk,rst,x14,x15);
d_ff dff_15(clk,rst,x15,x16);
d_ff dff_16(clk,rst,x16,x17);
d_ff dff_17(clk,rst,x17,x18);
d_ff dff_18(clk,rst,x18,x19);
d_ff dff_19(clk,rst,x19,x20);
d_ff dff_20(clk,rst,x20,x21);
d_ff dff_21(clk,rst,x21,x22);
d_ff dff_22(clk,rst,x22,x23);
d_ff dff_23(clk,rst,x23,x24);
d_ff dff_24(clk,rst,x24,x25);
d_ff dff_25(clk,rst,x25,x26);
d_ff dff_26(clk,rst,x26,x27);
d_ff dff_27(clk,rst,x27,x28);
d_ff dff_28(clk,rst,x28,x29);
d_ff dff_29(clk,rst,x29,x30);
d_ff dff_30(clk,rst,x30,x31);
d_ff dff_31(clk,rst,x31,x32);



// 16 bit ripple carry adder stage
wire [15:0] rca16_out0, rca16_out1, rca16_out2, rca16_out3, rca16_out4, rca16_out5, rca16_out6, rca16_out7, rca16_out8, rca16_out9,
            rca16_out10, rca16_out11, rca16_out12, rca16_out13, rca16_out14, rca16_out15, rca16_out16;
            
rca_16 rca16_0(x0,x32,1'b0,rca16_out0);
rca_16 rca16_1(x1,x31,1'b0,rca16_out1);
rca_16 rca16_2(x2,x30,1'b0,rca16_out2);
rca_16 rca16_3(x3, x29, 1'b0, rca16_out3);
rca_16 rca16_4(x4, x28, 1'b0, rca16_out4);
rca_16 rca16_5(x5, x27, 1'b0, rca16_out5);
rca_16 rca16_6(x6, x26, 1'b0, rca16_out6);
rca_16 rca16_7(x7, x25, 1'b0, rca16_out7);
rca_16 rca16_8(x8, x24, 1'b0, rca16_out8);
rca_16 rca16_9(x9, x23, 1'b0, rca16_out9);
rca_16 rca16_10(x10, x22, 1'b0, rca16_out10);
rca_16 rca16_11(x11, x21, 1'b0, rca16_out11);
rca_16 rca16_12(x12, x20, 1'b0, rca16_out12);
rca_16 rca16_13(x13, x19, 1'b0, rca16_out13);
rca_16 rca16_14(x14, x18, 1'b0, rca16_out14);
rca_16 rca16_15(x15, x17, 1'b0, rca16_out15);
rca_16 rca16_16(x16, 16'd0, 1'b0, rca16_out16);



// 16 bit multiplier stage
wire [31:0]  mul_out0,mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8, mul_out9,
            mul_out10, mul_out11, mul_out12, mul_out13, mul_out14, mul_out15, mul_out16;

hvwtm_s_16x16 mul_0(mul_out0,h0,rca16_out0);
hvwtm_s_16x16 mul_1(mul_out1,h1,rca16_out1);
hvwtm_s_16x16 mul_2(mul_out2, h2, rca16_out2);
hvwtm_s_16x16 mul_3(mul_out3, h3, rca16_out3);
hvwtm_s_16x16 mul_4(mul_out4, h4, rca16_out4);
hvwtm_s_16x16 mul_5(mul_out5, h5, rca16_out5);
hvwtm_s_16x16 mul_6(mul_out6, h6, rca16_out6);
hvwtm_s_16x16 mul_7(mul_out7, h7, rca16_out7);
hvwtm_s_16x16 mul_8(mul_out8, h8, rca16_out8);
hvwtm_s_16x16 mul_9(mul_out9, h9, rca16_out9);
hvwtm_s_16x16 mul_10(mul_out10, h10, rca16_out10);
hvwtm_s_16x16 mul_11(mul_out11, h11, rca16_out11);
hvwtm_s_16x16 mul_12(mul_out12, h12, rca16_out12);
hvwtm_s_16x16 mul_13(mul_out13, h13, rca16_out13);
hvwtm_s_16x16 mul_14(mul_out14, h14, rca16_out14);
hvwtm_s_16x16 mul_15(mul_out15, h15, rca16_out15);
hvwtm_s_16x16 mul_16(mul_out16, h16, rca16_out16);


// 32 bit ripple carry adder stage
wire [31:0] rca32_out0,rca32_out1, rca32_out2, rca32_out3, rca32_out4, rca32_out5, rca32_out6, rca32_out7, rca32_out8, rca32_out9,
            rca32_out10, rca32_out11, rca32_out12, rca32_out13, rca32_out14;

rca_32 rca32_0 (mul_out0,mul_out1,1'b0,rca32_out0);
rca_32 rca32_1 (mul_out2,rca32_out0,1'b0,rca32_out1);
rca_32 rca32_2 (mul_out3,rca32_out1,1'b0,rca32_out2);
rca_32 rca32_3 (mul_out4,rca32_out2,1'b0,rca32_out3);
rca_32 rca32_4 (mul_out5, rca32_out3, 1'b0, rca32_out4);
rca_32 rca32_5 (mul_out6, rca32_out4, 1'b0, rca32_out5);
rca_32 rca32_6 (mul_out7, rca32_out5, 1'b0, rca32_out6);
rca_32 rca32_7 (mul_out8, rca32_out6, 1'b0, rca32_out7);
rca_32 rca32_8 (mul_out9, rca32_out7, 1'b0, rca32_out8);
rca_32 rca32_9 (mul_out10, rca32_out8, 1'b0, rca32_out9);
rca_32 rca32_10 (mul_out11, rca32_out9, 1'b0, rca32_out10);
rca_32 rca32_11 (mul_out12, rca32_out10, 1'b0, rca32_out11);
rca_32 rca32_12 (mul_out13, rca32_out11, 1'b0, rca32_out12);
rca_32 rca32_13 (mul_out14, rca32_out12, 1'b0, rca32_out13);
rca_32 rca32_14 (mul_out15, rca32_out13, 1'b0, rca32_out14);
rca_32 rca32_15 (mul_out16, rca32_out14, 1'b0, y_out);



endmodule

module hvwtm_s_16x16(
		output reg [31:0] prod32,
		input [15:0] num16_1,
		input [15:0] num16_2
);
    wire [15:0] num1Complement, num2Complement;
    wire [15:0] multiplier, multiplicand;
    assign num1Complement = ~num16_1 + 1'b1;
    assign num2Complement = ~num16_2 + 1'b1;
    
     assign multiplier = (num16_1[15] == 1) ? num1Complement : num16_1;
     assign multiplicand = (num16_2[15] == 1) ? num2Complement : num16_2;

	wire [7:0] n1_l;
	wire [7:0] n1_h;
	wire [7:0] n2_l;
	wire [7:0] n2_h;

	assign {n1_h,n1_l} =multiplier;
	assign {n2_h,n2_l} =multiplicand;

	wire [15:0] op_1,op_2,op_3,op_4;

	HVWTM_8x8 mp_1(op_1, n1_l, n2_l);
        HVWTM_8x8 mp_2(op_2, n1_h, n2_l);
        HVWTM_8x8 mp_3(op_3, n1_l, n2_h);
        HVWTM_8x8 mp_4(op_4, n1_h, n2_h);

	//for testing using data flow

    wire [15:0]t1,t2,t3;
    wire c1,c2,c3,c4,s1;
    wire [7:0] k1 = op_1[7:0];
    rca16 r1(t1,c1,op_2,op_3);
    wire [15:0] w1={8'b00000000,op_1[15:8]};
    rca16 r2(t2,c2,t1,w1);
    HA2 h1(c1,c2,s1,c3);
    wire [15:0]w2={6'b000000,c3,s1,t2[15:8]};
    rca16 r3(t3,c4,op_4,w2);
    
    wire [31:0] pd;

    assign pd = {t3, t2[7:0],op_1[7:0]};
    

    always@(*)
    if(num16_1[15]^num16_2[15])
    prod32=~pd+1'b1;
    else
    prod32=pd;

endmodule



module HVWTM_8x8(
    output [15:0] prod16,
    input [7:0] num8_1,
    input [7:0] num8_2
);
    wire [3:0] n1_l;
    wire [3:0] n1_h;
    wire [3:0] n2_l;
    wire [3:0] n2_h;

    assign {n1_h, n1_l} = num8_1;
    assign {n2_h, n2_l} = num8_2;

    wire [7:0] op_1, op_2, op_3, op_4;

    wallace_4x4 mp_1(op_1, n1_l, n2_l);
    wallace_4x4 mp_2(op_2, n1_h, n2_l);
    wallace_4x4 mp_3(op_3, n1_l, n2_h);
    wallace_4x4 mp_4(op_4, n1_h, n2_h);

    //for testing using data flow

    wire [7:0]t1,t2,t3,k4;
    wire c1,c2,c3,c4,s1;
    wire [3:0] k1 = op_1[3:0];
    rca8 r1(t1,c1,op_2,op_3);
    wire [7:0] w1={4'b0000,op_1[7:4]};
    rca8 r2(t2,c2,t1,w1);
    HA2 h1(c1,c2,s1,c3);
    wire [7:0]w2={2'b00,c3,s1,t2[7:4]};
    rca8 r3(t3,c4,op_4,w2);

    assign prod16 = {t3, t2[3:0],op_1[3:0]};

endmodule

module wallace_4x4(output [7:0]prod,  input [3:0]a,  input [3:0]b); 
  reg [3:0]PP1,PP2,PP3,PP4;
  wire HAC1,HAC2,HAC3,HAC4;
  wire HAS1,HAS2,HAS3,HAS4;
  wire FAC1,FAC2,FAC3,FAC4,FAC5,FAC6,FAC7,FAC8;
  wire FAS1,FAS2,FAS3,FAS4,FAS5,FAS6,FAS7,FAS8;
   always@(*) 
	begin
     PP1={a[3]&b[0],a[2]&b[0],a[1]&b[0],a[0]&b[0]};
     PP2={a[3]&b[1],a[2]&b[1],a[1]&b[1],a[0]&b[1]};
     PP3={a[3]&b[2],a[2]&b[2],a[1]&b[2],a[0]&b[2]};
     PP4={a[3]&b[3],a[2]&b[3],a[1]&b[3],a[0]&b[3]};
   	end  

////stage 1///////   
  HA2 h1 (PP1[2],PP2[1],HAS1,HAC1);
  FA2 f1 (PP1[3],PP2[2],PP3[1],FAS1,FAC1);
  FA2 f2 (PP2[3],PP3[2],PP4[1],FAS2,FAC2);
////stage 2/////
  HA2 h2 (FAS1,PP4[0],HAS2,HAC2);
  HA2 h3 (FAS2,FAC1,HAS3,HAC3);
  FA2 f3 (PP3[3],PP4[2],FAC2,FAS3,FAC3);
/////stage 3///////
  HA2 h4 (PP1[1],PP2[0],HAS4,HAC4);
  FA2 f4 (HAS1,PP3[0],HAC4,FAS4,FAC4);
  FA2 f5 (HAS2,HAC1,FAC4,FAS5,FAC5);
  FA2 f6 (HAS3,HAC2,FAC5,FAS6,FAC6);
  FA2 f7 (FAS3,HAC3,FAC6,FAS7,FAC7);
  FA2 f8 (PP4[3],FAC3,FAC7,FAS8,FAC8);
  
  assign prod= {FAC8,FAS8,FAS7,FAS6,FAS5,FAS4,HAS4,PP1[0]};
endmodule


////////16-bit ripple carry adder declaration/////

module rca16(output [15:0] s, output cout, input [15:0] a,b);

wire [14:0] c;

FA2 f0(a[0],b[0],1'b0,s[0],c[0]);
FA2 f1(a[1],b[1],c[0],s[1],c[1]);
FA2 f2(a[2],b[2],c[1],s[2],c[2]);
FA2 f3(a[3],b[3],c[2],s[3],c[3]);
FA2 f4(a[4],b[4],c[3],s[4],c[4]);
FA2 f5(a[5],b[5],c[4],s[5],c[5]);
FA2 f6(a[6],b[6],c[5],s[6],c[6]);
FA2 f7(a[7],b[7],c[6],s[7],c[7]);
FA2 f8(a[8],b[8],c[7],s[8],c[8]);
FA2 f9(a[9],b[9],c[8],s[9],c[9]);
FA2 f10(a[10],b[10],c[9],s[10],c[10]);
FA2 f11(a[11],b[11],c[10],s[11],c[11]);
FA2 f12(a[12],b[12],c[11],s[12],c[12]);
FA2 f13(a[13],b[13],c[12],s[13],c[13]);
FA2 f14(a[14],b[14],c[13],s[14],c[14]);
FA2 f15(a[15],b[15],c[14],s[15],cout);

endmodule
////////8-bit ripple carry adder declaration//////
module rca8(output [7:0] s, output cout, input [7:0] a,b);

wire [6:0] c;

FA2 f0(a[0],b[0],1'b0,s[0],c[0]);
FA2 f1(a[1],b[1],c[0],s[1],c[1]);
FA2 f2(a[2],b[2],c[1],s[2],c[2]);
FA2 f3(a[3],b[3],c[2],s[3],c[3]);
FA2 f4(a[4],b[4],c[3],s[4],c[4]);
FA2 f5(a[5],b[5],c[4],s[5],c[5]);
FA2 f6(a[6],b[6],c[5],s[6],c[6]);
FA2 f7(a[7],b[7],c[6],s[7],cout);

endmodule

/////////HALF ADDER DECLARATION///////
module HA2(a,b,sum,carry);
    input a,b;
    output sum,carry;

    assign sum= a^b;
    assign carry= a&&b;
endmodule
////////FULL ADDER DECLARATION////////
module FA2(a,b,cin,sum, carry);
    input a,b,cin;
    output sum,carry;

    assign sum= a^b^cin;
    assign carry= (a&&b)||(cin&&(a^b));
endmodule
module d_ff(clk,rst,din,d_out);
input clk,rst;
input [15:0] din;
output reg[15:0]d_out;

always@(posedge clk)
begin
if(rst==1)
begin
d_out=16'd0;
end
else 
begin
d_out=din;
end
end
endmodule

module rca_16(input [15:0] a,b, input cin, output [15:0] s);

wire cout;

wire [14:0] c;

FA2 f0(a[0],b[0],cin,s[0],c[0]);
FA2 f1(a[1],b[1],c[0],s[1],c[1]);
FA2 f2(a[2],b[2],c[1],s[2],c[2]);
FA2 f3(a[3],b[3],c[2],s[3],c[3]);
FA2 f4(a[4],b[4],c[3],s[4],c[4]);
FA2 f5(a[5],b[5],c[4],s[5],c[5]);
FA2 f6(a[6],b[6],c[5],s[6],c[6]);
FA2 f7(a[7],b[7],c[6],s[7],c[7]);
FA2 f8(a[8],b[8],c[7],s[8],c[8]);
FA2 f9(a[9],b[9],c[8],s[9],c[9]);
FA2 f10(a[10],b[10],c[9],s[10],c[10]);
FA2 f11(a[11],b[11],c[10],s[11],c[11]);
FA2 f12(a[12],b[12],c[11],s[12],c[12]);
FA2 f13(a[13],b[13],c[12],s[13],c[13]);
FA2 f14(a[14],b[14],c[13],s[14],c[14]);
FA2 f15(a[15],b[15],c[14],s[15],cout);

endmodule

module rca_32(input [31:0] a,b, input cin, output [31:0] s);
wire cout;
wire [30:0] c;

FA2 f0(a[0],b[0],cin,s[0],c[0]);
FA2 f1(a[1],b[1],c[0],s[1],c[1]);
FA2 f2(a[2],b[2],c[1],s[2],c[2]);
FA2 f3(a[3],b[3],c[2],s[3],c[3]);
FA2 f4(a[4],b[4],c[3],s[4],c[4]);
FA2 f5(a[5],b[5],c[4],s[5],c[5]);
FA2 f6(a[6],b[6],c[5],s[6],c[6]);
FA2 f7(a[7],b[7],c[6],s[7],c[7]);
FA2 f8(a[8],b[8],c[7],s[8],c[8]);
FA2 f9(a[9],b[9],c[8],s[9],c[9]);
FA2 f10(a[10],b[10],c[9],s[10],c[10]);
FA2 f11(a[11],b[11],c[10],s[11],c[11]);
FA2 f12(a[12],b[12],c[11],s[12],c[12]);
FA2 f13(a[13],b[13],c[12],s[13],c[13]);
FA2 f14(a[14],b[14],c[13],s[14],c[14]);
FA2 f15(a[15],b[15],c[14],s[15],c[15]);
FA2 f16(a[16],b[16],c[15],s[16],c[16]);
FA2 f17(a[17],b[17],c[16],s[17],c[17]);
FA2 f18(a[18],b[18],c[17],s[18],c[18]);
FA2 f19(a[19],b[19],c[18],s[19],c[19]);
FA2 f20(a[20],b[20],c[19],s[20],c[20]);
FA2 f21(a[21],b[21],c[20],s[21],c[21]);
FA2 f22(a[22],b[22],c[21],s[22],c[22]);
FA2 f23(a[23],b[23],c[22],s[23],c[23]);
FA2 f24(a[24],b[24],c[23],s[24],c[24]);
FA2 f25(a[25],b[25],c[24],s[25],c[25]);
FA2 f26(a[26],b[26],c[25],s[26],c[26]);
FA2 f27(a[27],b[27],c[26],s[27],c[27]);
FA2 f28(a[28],b[28],c[27],s[28],c[28]);
FA2 f29(a[29],b[29],c[28],s[29],c[29]);
FA2 f30(a[30],b[30],c[29],s[30],c[30]);
FA2 f31(a[31],b[31],c[30],s[31],cout);


endmodule
