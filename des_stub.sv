/*
 Data Encryption Standard (S-DES)
 64-bit 16-round block cipher encryption and decryption algorithm 
 using 56-bit key (64-bit key with Parity).
 */

module GenerateKeys (Key, SubKey1, SubKey2, SubKey3, SubKey4,
		     SubKey5, SubKey6, SubKey7, SubKey8,
		     SubKey9, SubKey10, SubKey11, SubKey12,
		     SubKey13, SubKey14, SubKey15, SubKey16);
   
   // Generate SubKeys
   input logic [63:0]  Key;
   output logic [47:0] SubKey1;
   output logic [47:0] SubKey2;
   output logic [47:0] SubKey3;
   output logic [47:0] SubKey4;
   output logic [47:0] SubKey5;
   output logic [47:0] SubKey6;
   output logic [47:0] SubKey7;
   output logic [47:0] SubKey8;
   output logic [47:0] SubKey9;
   output logic [47:0] SubKey10;
   output logic [47:0] SubKey11;
   output logic [47:0] SubKey12;
   output logic [47:0] SubKey13;
   output logic [47:0] SubKey14;
   output logic [47:0] SubKey15;
   output logic [47:0] SubKey16;
   
   logic [27:0]	C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16;
	logic [27:0] 	D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, D16;

	PC1 pc0 (Key, C0, D0); //returns PC1 values for C0 and D0

	assign C1 = {C0[26:0], C0[27]}; //bit swizzle left shift 1
	assign D1 = {D0[26:0], D0[27]}; 
	PC2 pc1 (C1, D1, SubKey1);

	assign C2 = {C1[26:0], C1[27]}; 
	assign D2 = {D1[26:0], D1[27]}; 
	PC2 pc2 (C2, D2, SubKey2);

	assign C3 = {C2[25:0], C2[27:26]}; //bit swizzle left shift 2
	assign D3 = {D2[25:0], D2[27:26]}; 
	PC2 pc3 (C3, D3, SubKey3);

	assign C4 = {C3[25:0], C3[27:26]}; 
	assign D4 = {D3[25:0], D3[27:26]}; 
	PC2 pc4 (C4, D4, SubKey4);

	assign C5 = {C4[25:0], C4[27:26]}; 
	assign D5 = {D4[25:0], D4[27:26]}; 
	PC2 pc5 (C5, D5, SubKey5);

	assign C6 = {C5[25:0], C5[27:26]}; 
	assign D6 = {D5[25:0], D5[27:26]}; 
	PC2 pc6 (C6, D6, SubKey6);

	assign C7 = {C6[25:0], C6[27:26]}; 
	assign D7 = {D6[25:0], D6[27:26]}; 
	PC2 pc7 (C7, D7, SubKey7);

	assign C8 = {C7[25:0], C7[27:26]}; 
	assign D8 = {D7[25:0], D7[27:26]}; 
	PC2 pc8 (C8, D8, SubKey8);

	assign C9 = {C8[26:0], C8[27]}; 
	assign D9 = {D8[26:0], D8[27]}; 
	PC2 pc9 (C9, D9, SubKey9);

	assign C10 = {C9[25:0], C9[27:26]}; 
	assign D10 = {D9[25:0], D9[27:26]}; 
	PC2 pc10 (C10, D10, SubKey10);

	assign C11 = {C10[25:0], C10[27:26]}; 
	assign D11 = {D10[25:0], D10[27:26]}; 
	PC2 pc11 (C11, D11, SubKey11);

	assign C12 = {C11[25:0], C11[27:26]}; 
	assign D12 = {D11[25:0], D11[27:26]}; 
	PC2 pc12 (C12, D12, SubKey12);

	assign C13 = {C12[25:0], C12[27:26]}; 
	assign D13 = {D12[25:0], D12[27:26]}; 
	PC2 pc13 (C13, D13, SubKey13);

	assign C14 = {C13[25:0], C13[27:26]}; 
	assign D14 = {D13[25:0], D13[27:26]}; 
	PC2 pc14 (C14, D14, SubKey14);

	assign C15 = {C14[25:0], C14[27:26]}; 
	assign D15 = {D14[25:0], D14[27:26]}; 
	PC2 pc15 (C15, D15, SubKey15);

	assign C16 = {C15[26:0], C15[27]}; 
	assign D16 = {D15[26:0], D15[27]}; 
	PC2 pc16 (C16, D16, SubKey16);

endmodule // GenerateKeys


	
	module PC1 (key, a_block, b_block);
	input logic [63:0]  key;
 	output logic [27:0] a_block; //left_block
	output logic [27:0] b_block; //right_block

	logic [55:0] out_block;

	assign out_block[55-0] = key[64-57];
	assign out_block[55-1] = key[64-49];
	assign out_block[55-2] = key[64-41];
	assign out_block[55-3] = key[64-33];
	assign out_block[55-4] = key[64-25];
	assign out_block[55-5] = key[64-17];
	assign out_block[55-6] = key[64-9];

	assign out_block[55-7] = key[64-1];
	assign out_block[55-8] = key[64-58];
	assign out_block[55-9] = key[64-50];
	assign out_block[55-10] = key[64-42];
	assign out_block[55-11] = key[64-34];
	assign out_block[55-12] = key[64-26];
	assign out_block[55-13] = key[64-18];

	assign out_block[55-14] = key[64-10];
	assign out_block[55-15] = key[64-2];
	assign out_block[55-16] = key[64-59];
	assign out_block[55-17] = key[64-51];
	assign out_block[55-18] = key[64-43];
	assign out_block[55-19] = key[64-35];
	assign out_block[55-20] = key[64-27];

	assign out_block[55-21] = key[64-19];
	assign out_block[55-22] = key[64-11];
	assign out_block[55-23] = key[64-3];
	assign out_block[55-24] = key[64-60];
	assign out_block[55-25] = key[64-52];
	assign out_block[55-26] = key[64-44];
	assign out_block[55-27] = key[64-36];

	assign out_block[55-28] = key[64-63];
	assign out_block[55-29] = key[64-55];
	assign out_block[55-30] = key[64-47];
	assign out_block[55-31] = key[64-39];
	assign out_block[55-32] = key[64-31];
	assign out_block[55-33] = key[64-23];
	assign out_block[55-34] = key[64-15];

	assign out_block[55-35] = key[64-7];
	assign out_block[55-36] = key[64-62];
	assign out_block[55-37] = key[64-54];
	assign out_block[55-38] = key[64-46];
	assign out_block[55-39] = key[64-38];
	assign out_block[55-40] = key[64-30];
	assign out_block[55-41] = key[64-22];

	assign out_block[55-42] = key[64-14];
	assign out_block[55-43] = key[64-6];
	assign out_block[55-44] = key[64-61];
	assign out_block[55-45] = key[64-53];
	assign out_block[55-46] = key[64-45];
	assign out_block[55-47] = key[64-37];
	assign out_block[55-48] = key[64-29];

	assign out_block[55-49] = key[64-21];
	assign out_block[55-50] = key[64-13];
	assign out_block[55-51] = key[64-5];
	assign out_block[55-52] = key[64-28];
	assign out_block[55-53] = key[64-20];
	assign out_block[55-54] = key[64-12];
	assign out_block[55-55] = key[64-4];

	assign a_block[27:0] = out_block[55:28];
	assign b_block[27:0] = out_block[27:0];
	

endmodule // PC1

module PC2 (left_block, right_block, subkey);

   input logic [27:0] left_block;
   input logic [27:0] right_block;
   output logic [47:0] subkey;
   
   logic [55:0]  in_block;
   
   assign in_block = {left_block[27:0], right_block[27:0]};
   
   assign subkey[47-0] = in_block[56-14];
	assign subkey[47-1] = in_block[56-17];
	assign subkey[47-2] = in_block[56-11];
	assign subkey[47-3] = in_block[56-24];
	assign subkey[47-4] = in_block[56-1];
	assign subkey[47-5] = in_block[56-5];

	assign subkey[47-6] = in_block[56-3];
	assign subkey[47-7] = in_block[56-28];
	assign subkey[47-8] = in_block[56-15];
	assign subkey[47-9] = in_block[56-6];
	assign subkey[47-10] = in_block[56-21];
	assign subkey[47-11] = in_block[56-10];

	assign subkey[47-12] = in_block[56-23];
	assign subkey[47-13] = in_block[56-19];
	assign subkey[47-14] = in_block[56-12];
	assign subkey[47-15] = in_block[56-4];
	assign subkey[47-16] = in_block[56-26];
	assign subkey[47-17] = in_block[56-8];

	assign subkey[47-18] = in_block[56-16];
	assign subkey[47-19] = in_block[56-7];
	assign subkey[47-20] = in_block[56-27];
	assign subkey[47-21] = in_block[56-20];
	assign subkey[47-22] = in_block[56-13];
	assign subkey[47-23] = in_block[56-2];

	assign subkey[47-24] = in_block[56-41];
	assign subkey[47-25] = in_block[56-52];
	assign subkey[47-26] = in_block[56-31];
	assign subkey[47-27] = in_block[56-37];
	assign subkey[47-28] = in_block[56-47];
	assign subkey[47-29] = in_block[56-55];

	assign subkey[47-30] = in_block[56-30];
	assign subkey[47-31] = in_block[56-40];
	assign subkey[47-32] = in_block[56-51];
	assign subkey[47-33] = in_block[56-45];
	assign subkey[47-34] = in_block[56-33];
	assign subkey[47-35] = in_block[56-48];

	assign subkey[47-36] = in_block[56-44];
	assign subkey[47-37] = in_block[56-49];
	assign subkey[47-38] = in_block[56-39];
	assign subkey[47-39] = in_block[56-56];
	assign subkey[47-40] = in_block[56-34];
	assign subkey[47-41] = in_block[56-53];

	assign subkey[47-42] = in_block[56-46];
	assign subkey[47-43] = in_block[56-42];
	assign subkey[47-44] = in_block[56-50];
	assign subkey[47-45] = in_block[56-36];
	assign subkey[47-46] = in_block[56-29];
	assign subkey[47-47] = in_block[56-32];
   
   // finish PC2
	
endmodule // PC2

// Straight Function
module SF (in_block, out_block);

   input logic [31:0] in_block;
   output logic [31:0] out_block;
   
   assign out_block[31-0] = in_block[32-16];
	assign out_block[31-1] = in_block[32-7];
	assign out_block[31-2] = in_block[32-20];
	assign out_block[31-3] = in_block[32-21];
	assign out_block[31-4] = in_block[32-29];
	assign out_block[31-5] = in_block[32-12];
	assign out_block[31-6] = in_block[32-28];
	assign out_block[31-7] = in_block[32-17];
	assign out_block[31-8] = in_block[32-1];
	assign out_block[31-9] = in_block[32-15];
	assign out_block[31-10] = in_block[32-23];
	assign out_block[31-11] = in_block[32-26];
	assign out_block[31-12] = in_block[32-5];
	assign out_block[31-13] = in_block[32-18];
	assign out_block[31-14] = in_block[32-31];
	assign out_block[31-15] = in_block[32-10];
	assign out_block[31-16] = in_block[32-2];
	assign out_block[31-17] = in_block[32-8];
	assign out_block[31-18] = in_block[32-24];
	assign out_block[31-19] = in_block[32-14];
	assign out_block[31-20] = in_block[32-32];
	assign out_block[31-21] = in_block[32-27];
	assign out_block[31-22] = in_block[32-3];
	assign out_block[31-23] = in_block[32-9];
	assign out_block[31-24] = in_block[32-19];
	assign out_block[31-25] = in_block[32-13];
	assign out_block[31-26] = in_block[32-30];
	assign out_block[31-27] = in_block[32-6];
	assign out_block[31-28] = in_block[32-22];
	assign out_block[31-29] = in_block[32-11];
	assign out_block[31-30] = in_block[32-4];
	assign out_block[31-31] = in_block[32-25];
   
	
	


endmodule // SF

// Expansion Function
module EF (in_block, out_block);

   input logic [31:0] in_block;
	output logic [47:0] out_block;

	assign out_block[47-0] = in_block[32-32];
	assign out_block[47-1] = in_block[32-1];
	assign out_block[47-2] = in_block[32-2];
	assign out_block[47-3] = in_block[32-3];
	assign out_block[47-4] = in_block[32-4];
	assign out_block[47-5] = in_block[32-5];

	assign out_block[47-6] = in_block[32-4];
	assign out_block[47-7] = in_block[32-5];
	assign out_block[47-8] = in_block[32-6];
	assign out_block[47-9] = in_block[32-7];
	assign out_block[47-10] = in_block[32-8];
	assign out_block[47-11] = in_block[32-9];

	assign out_block[47-12] = in_block[32-8];
	assign out_block[47-13] = in_block[32-9];
	assign out_block[47-14] = in_block[32-10];
	assign out_block[47-15] = in_block[32-11];
	assign out_block[47-16] = in_block[32-12];
	assign out_block[47-17] = in_block[32-13];

	assign out_block[47-18] = in_block[32-12];
	assign out_block[47-19] = in_block[32-13];
	assign out_block[47-20] = in_block[32-14];
	assign out_block[47-21] = in_block[32-15];
	assign out_block[47-22] = in_block[32-16];
	assign out_block[47-23] = in_block[32-17];

	assign out_block[47-24] = in_block[32-16];
	assign out_block[47-25] = in_block[32-17];
	assign out_block[47-26] = in_block[32-18];
	assign out_block[47-27] = in_block[32-19];
	assign out_block[47-28] = in_block[32-20];
	assign out_block[47-29] = in_block[32-21];

	assign out_block[47-30] = in_block[32-20];
	assign out_block[47-31] = in_block[32-21];
	assign out_block[47-32] = in_block[32-22];
	assign out_block[47-33] = in_block[32-23];
	assign out_block[47-34] = in_block[32-24];
	assign out_block[47-35] = in_block[32-25];

	assign out_block[47-36] = in_block[32-24];
	assign out_block[47-37] = in_block[32-25];
	assign out_block[47-38] = in_block[32-26];
	assign out_block[47-39] = in_block[32-27];
	assign out_block[47-40] = in_block[32-28];
	assign out_block[47-41] = in_block[32-29];

	assign out_block[47-42] = in_block[32-28];
	assign out_block[47-43] = in_block[32-29];
	assign out_block[47-44] = in_block[32-30];
	assign out_block[47-45] = in_block[32-31];
	assign out_block[47-46] = in_block[32-32];
	assign out_block[47-47] = in_block[32-1];
   
   
   
   
   

endmodule // EF

module feistel (inp_block, subkey, out_block);

   
	input logic [31:0]  inp_block;
	input logic [47:0]  subkey;
	output logic [31:0] out_block;
	logic [47:0] expanded_block;
	logic [47:0] intermediate_block;

	EF expand(inp_block, expanded_block);
	assign intermediate_block = expanded_block ^ subkey;

	//S Box division and assignment
	logic [5:0] sb1in, sb2in, sb3in, sb4in, sb5in, sb6in, sb7in, sb8in;

	assign sb1in = intermediate_block[47:42];
	assign sb2in = intermediate_block[41:36];
	assign sb3in = intermediate_block[35:30];
	assign sb4in = intermediate_block[29:24];
	assign sb5in = intermediate_block[23:18];
	assign sb6in = intermediate_block[17:12];
	assign sb7in = intermediate_block[11:6];
	assign sb8in = intermediate_block[5:0];

	//send divided bits to S boxes
	logic [3:0] sb1out, sb2out, sb3out, sb4out, sb5out, sb6out, sb7out, sb8out;

	/*S1_Box s1(sb1in, sb1out);
	S1_Box s2(sb2in, sb2out);
	S1_Box s3(sb3in, sb3out);
	S1_Box s4(sb4in, sb4out);
	S1_Box s5(sb5in, sb5out);
	S1_Box s6(sb6in, sb6out);
	S1_Box s7(sb7in, sb7out);
	S1_Box s8(sb8in, sb8out);*/

	//combine sb1-8out
	logic [31:0] s_combined;

	S1_Box s1 (sb1in, s_combined[31:28]);
	S2_Box s2 (sb2in, s_combined[27:24]);
	S3_Box s3 (sb3in, s_combined[23:20]);
	S4_Box s4 (sb4in, s_combined[19:16]);
	S5_Box s5 (sb5in, s_combined[15:12]);
	S6_Box s6 (sb6in, s_combined[11:8]);
	S7_Box s7 (sb7in, s_combined[7:4]);
	S8_Box s8 (sb8in, s_combined[3:0]);

	//assign s_combined = {sb1out[3:0], sb2out[3:0], sb3out[3:0], sb4out[3:0], sb5out[3:0], sb6out[3:0], sb7out[3:0], sb8out[3:0]};
	//could be backwards
	//assign s_combined = {sb8out[3:0], sb7out[3:0], sb6out[3:0], sb5out[3:0], sb4out[3:0], sb3out[3:0], sb2out[3:0], sb1out[3:0]};

	//straight diffusion
	SF straight(s_combined, out_block);
   
   // S1_Box[43:0

endmodule // Feistel


// DES block round
module round (in_block, subkey, out_block);


   input logic [63:0]  in_block;
   input logic [47:0]  subkey;
   output logic [63:0] out_block;
   logic [31:0] R_block;
   logic [31:0] L_block;
   
   assign L_block = in_block[63:32];
   assign R_block = in_block[31:0];
   
   logic [31:0] L2_block;
   assign L2_block = R_block[31:0];
   
   logic [31:0] P_feistel;
   feistel f(R_block, subkey, P_feistel);
   
   logic [31:0] R2_block;
   assign R2_block = L_block ^ P_feistel;
   
   assign out_block = {L2_block[31:0], R2_block[31:0]};
 
endmodule // round1

// Initial Permutation
module IP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-58];
   assign out_block[62] = inp_block[64-50];
   assign out_block[61] = inp_block[64-42];
   assign out_block[60] = inp_block[64-34];
   assign out_block[59] = inp_block[64-26];
   assign out_block[58] = inp_block[64-18];
   assign out_block[57] = inp_block[64-10];
   assign out_block[56] = inp_block[64-2];
   assign out_block[55] = inp_block[64-60];
   assign out_block[54] = inp_block[64-52];   
   assign out_block[53] = inp_block[64-44];   
   assign out_block[52] = inp_block[64-36];
   assign out_block[51] = inp_block[64-28];
   assign out_block[50] = inp_block[64-20];
   assign out_block[49] = inp_block[64-12];
   assign out_block[48] = inp_block[64-4];
   assign out_block[47] = inp_block[64-62];
   assign out_block[46] = inp_block[64-54];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-38];   
   assign out_block[43] = inp_block[64-30];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-14];
   assign out_block[40] = inp_block[64-6];
   assign out_block[39] = inp_block[64-64];
   assign out_block[38] = inp_block[64-56];
   assign out_block[37] = inp_block[64-48];
   assign out_block[36] = inp_block[64-40];
   assign out_block[35] = inp_block[64-32];
   assign out_block[34] = inp_block[64-24];   
   assign out_block[33] = inp_block[64-16];
   assign out_block[32] = inp_block[64-8];   
   assign out_block[31] = inp_block[64-57];
   assign out_block[30] = inp_block[64-49];
   assign out_block[29] = inp_block[64-41];
   assign out_block[28] = inp_block[64-33];
   assign out_block[27] = inp_block[64-25];
   assign out_block[26] = inp_block[64-17];
   assign out_block[25] = inp_block[64-9];   
   assign out_block[24] = inp_block[64-1];   
   assign out_block[23] = inp_block[64-59];
   assign out_block[22] = inp_block[64-51];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-35];
   assign out_block[19] = inp_block[64-27];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-11];
   assign out_block[16] = inp_block[64-3];
   assign out_block[15] = inp_block[64-61];
   assign out_block[14] = inp_block[64-53];   
   assign out_block[13] = inp_block[64-45];
   assign out_block[12] = inp_block[64-37];   
   assign out_block[11] = inp_block[64-29];
   assign out_block[10] = inp_block[64-21];
   assign out_block[9] = inp_block[64-13];
   assign out_block[8] = inp_block[64-5];
   assign out_block[7] = inp_block[64-63];
   assign out_block[6] = inp_block[64-55];
   assign out_block[5] = inp_block[64-47];
   assign out_block[4] = inp_block[64-39];   
   assign out_block[3] = inp_block[64-31];
   assign out_block[2] = inp_block[64-23];    
   assign out_block[1] = inp_block[64-15];
   assign out_block[0] = inp_block[64-7];   

endmodule // IP

// Final Permutation
module FP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-40];
   assign out_block[62] = inp_block[64-8];
   assign out_block[61] = inp_block[64-48];
   assign out_block[60] = inp_block[64-16];
   assign out_block[59] = inp_block[64-56];
   assign out_block[58] = inp_block[64-24];
   assign out_block[57] = inp_block[64-64];
   assign out_block[56] = inp_block[64-32];   
   assign out_block[55] = inp_block[64-39];
   assign out_block[54] = inp_block[64-7];   
   assign out_block[53] = inp_block[64-47];   
   assign out_block[52] = inp_block[64-15];
   assign out_block[51] = inp_block[64-55];
   assign out_block[50] = inp_block[64-23];
   assign out_block[49] = inp_block[64-63];
   assign out_block[48] = inp_block[64-31];   
   assign out_block[47] = inp_block[64-38];
   assign out_block[46] = inp_block[64-6];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-14];   
   assign out_block[43] = inp_block[64-54];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-62];
   assign out_block[40] = inp_block[64-30];   
   assign out_block[39] = inp_block[64-37];
   assign out_block[38] = inp_block[64-5];
   assign out_block[37] = inp_block[64-45];
   assign out_block[36] = inp_block[64-13];
   assign out_block[35] = inp_block[64-53];
   assign out_block[34] = inp_block[64-21];   
   assign out_block[33] = inp_block[64-61];
   assign out_block[32] = inp_block[64-29];   
   assign out_block[31] = inp_block[64-36];
   assign out_block[30] = inp_block[64-4];
   assign out_block[29] = inp_block[64-44];
   assign out_block[28] = inp_block[64-12];
   assign out_block[27] = inp_block[64-52];
   assign out_block[26] = inp_block[64-20];
   assign out_block[25] = inp_block[64-60];   
   assign out_block[24] = inp_block[64-28];   
   assign out_block[23] = inp_block[64-35];
   assign out_block[22] = inp_block[64-3];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-11];
   assign out_block[19] = inp_block[64-51];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-59];
   assign out_block[16] = inp_block[64-27];   
   assign out_block[15] = inp_block[64-34];
   assign out_block[14] = inp_block[64-2];   
   assign out_block[13] = inp_block[64-42];
   assign out_block[12] = inp_block[64-10];   
   assign out_block[11] = inp_block[64-50];
   assign out_block[10] = inp_block[64-18];
   assign out_block[9] = inp_block[64-58];
   assign out_block[8] = inp_block[64-26];   
   assign out_block[7] = inp_block[64-33];
   assign out_block[6] = inp_block[64-1];
   assign out_block[5] = inp_block[64-41];   
   assign out_block[4] = inp_block[64-9];
   assign out_block[3] = inp_block[64-49];    
   assign out_block[2] = inp_block[64-17];
   assign out_block[1] = inp_block[64-57];
   assign out_block[0] = inp_block[64-25];  

endmodule // FP

module S1_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd14;             
	  6'd1  : out_bits = 4'd4;             
	  6'd2  : out_bits = 4'd13;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd2;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd10;             
	  6'd10 : out_bits = 4'd6;             
	  6'd11 : out_bits = 4'd12;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd9;             
	  6'd14 : out_bits = 4'd0;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd0;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd7;             
	  6'd19 : out_bits = 4'd4;             
	  6'd20 : out_bits = 4'd14;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd10;             
	  6'd25 : out_bits = 4'd6;             
	  6'd26 : out_bits = 4'd12;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd9;             
	  6'd29 : out_bits = 4'd5;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd1;             
	  6'd34 : out_bits = 4'd14;             
	  6'd35 : out_bits = 4'd8;             
	  6'd36 : out_bits = 4'd13;             
	  6'd37 : out_bits = 4'd6;             
	  6'd38 : out_bits = 4'd2;             
	  6'd39 : out_bits = 4'd11;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd12;             
	  6'd42 : out_bits = 4'd9;             
	  6'd43 : out_bits = 4'd7;             
	  6'd44 : out_bits = 4'd3;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd0;             
	  6'd48 : out_bits = 4'd15;             
	  6'd49 : out_bits = 4'd12;             
	  6'd50 : out_bits = 4'd8;             
	  6'd51 : out_bits = 4'd2;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd1;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd5;        
	  6'd57 : out_bits = 4'd11;        
	  6'd58 : out_bits = 4'd3;       
	  6'd59 : out_bits = 4'd14;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd13;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S1_Box

module S2_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})             
	  6'd0  : out_bits = 4'd15;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd11;             
	  6'd6  : out_bits = 4'd3;             
	  6'd7  : out_bits = 4'd4;             
	  6'd8  : out_bits = 4'd9;             
	  6'd9  : out_bits = 4'd7;             
	  6'd10 : out_bits = 4'd2;             
	  6'd11 : out_bits = 4'd13;             
	  6'd12 : out_bits = 4'd12;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd10;             
	  6'd16 : out_bits = 4'd3;             
	  6'd17 : out_bits = 4'd13;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd15;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd8;             
	  6'd23 : out_bits = 4'd14;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd1;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd6;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd11;             
	  6'd31 : out_bits = 4'd5;             
	  6'd32 : out_bits = 4'd0;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd7;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd4;             
	  6'd38 : out_bits = 4'd13;             
	  6'd39 : out_bits = 4'd1;             
	  6'd40 : out_bits = 4'd5;             
	  6'd41 : out_bits = 4'd8;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd6;             
	  6'd44 : out_bits = 4'd9;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd2;             
	  6'd47 : out_bits = 4'd15;             
	  6'd48 : out_bits = 4'd13;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd10;             
	  6'd51 : out_bits = 4'd1;             
	  6'd52 : out_bits = 4'd3;             
	  6'd53 : out_bits = 4'd15;            
	  6'd54 : out_bits = 4'd4;             
	  6'd55 : out_bits = 4'd2;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd6;        
	  6'd58 : out_bits = 4'd7;       
	  6'd59 : out_bits = 4'd12;       
	  6'd60 : out_bits = 4'd0;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd14;      
	  6'd63 : out_bits = 4'd9;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S2_Box

module S3_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd10;             
	  6'd1  : out_bits = 4'd0;             
	  6'd2  : out_bits = 4'd9;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd3;             
	  6'd6  : out_bits = 4'd15;             
	  6'd7  : out_bits = 4'd5;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd12;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd4;             
	  6'd14 : out_bits = 4'd2;             
	  6'd15 : out_bits = 4'd8;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd7;             
	  6'd18 : out_bits = 4'd0;             
	  6'd19 : out_bits = 4'd9;             
	  6'd20 : out_bits = 4'd3;             
	  6'd21 : out_bits = 4'd4;             
	  6'd22 : out_bits = 4'd6;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd2;             
	  6'd25 : out_bits = 4'd8;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd12;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd15;             
	  6'd31 : out_bits = 4'd1;             
	  6'd32 : out_bits = 4'd13;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd9;             
	  6'd36 : out_bits = 4'd8;             
	  6'd37 : out_bits = 4'd15;             
	  6'd38 : out_bits = 4'd3;             
	  6'd39 : out_bits = 4'd0;             
	  6'd40 : out_bits = 4'd11;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd2;             
	  6'd43 : out_bits = 4'd12;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd14;             
	  6'd47 : out_bits = 4'd7;             
	  6'd48 : out_bits = 4'd1;             
	  6'd49 : out_bits = 4'd10;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd0;             
	  6'd52 : out_bits = 4'd6;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd4;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd14;       
	  6'd59 : out_bits = 4'd3;       
	  6'd60 : out_bits = 4'd11;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd12;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S3_Box

module S4_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd7;             
	  6'd1  : out_bits = 4'd13;             
	  6'd2  : out_bits = 4'd14;            
	  6'd3  : out_bits = 4'd3;             
	  6'd4  : out_bits = 4'd0;             
	  6'd5  : out_bits = 4'd6;             
	  6'd6  : out_bits = 4'd9;             
	  6'd7  : out_bits = 4'd10;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd2;             
	  6'd10 : out_bits = 4'd8;             
	  6'd11 : out_bits = 4'd5;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd12;             
	  6'd14 : out_bits = 4'd4;             
	  6'd15 : out_bits = 4'd15;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd8;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd5;             
	  6'd20 : out_bits = 4'd6;             
	  6'd21 : out_bits = 4'd15;             
	  6'd22 : out_bits = 4'd0;             
	  6'd23 : out_bits = 4'd3;             
	  6'd24 : out_bits = 4'd4;             
	  6'd25 : out_bits = 4'd7;             
	  6'd26 : out_bits = 4'd2;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd1;             
	  6'd29 : out_bits = 4'd10;             
	  6'd30 : out_bits = 4'd14;             
	  6'd31 : out_bits = 4'd9;             
	  6'd32 : out_bits = 4'd10;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd9;             
	  6'd35 : out_bits = 4'd0;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd11;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd13;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd3;             
	  6'd43 : out_bits = 4'd14;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd2;             
	  6'd46 : out_bits = 4'd8;             
	  6'd47 : out_bits = 4'd4;             
	  6'd48 : out_bits = 4'd3;             
	  6'd49 : out_bits = 4'd15;             
	  6'd50 : out_bits = 4'd0;             
	  6'd51 : out_bits = 4'd6;             
	  6'd52 : out_bits = 4'd10;             
	  6'd53 : out_bits = 4'd1;            
	  6'd54 : out_bits = 4'd13;             
	  6'd55 : out_bits = 4'd8;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd4;        
	  6'd58 : out_bits = 4'd5;       
	  6'd59 : out_bits = 4'd11;       
	  6'd60 : out_bits = 4'd12;       
	  6'd61 : out_bits = 4'd7;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd14;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S4_Box

module S5_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd2;             
	  6'd1  : out_bits = 4'd12;             
	  6'd2  : out_bits = 4'd4;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd7;             
	  6'd5  : out_bits = 4'd10;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd6;             
	  6'd8  : out_bits = 4'd8;             
	  6'd9  : out_bits = 4'd5;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd15;             
	  6'd12 : out_bits = 4'd13;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd14;             
	  6'd15 : out_bits = 4'd9;             
	  6'd16 : out_bits = 4'd14;             
	  6'd17 : out_bits = 4'd11;             
	  6'd18 : out_bits = 4'd2;             
	  6'd19 : out_bits = 4'd12;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd7;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd5;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd15;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd3;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd2;             
	  6'd34 : out_bits = 4'd1;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd13;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd8;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd9;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd5;             
	  6'd44 : out_bits = 4'd6;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd0;             
	  6'd47 : out_bits = 4'd14;             
	  6'd48 : out_bits = 4'd11;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd12;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd14;            
	  6'd54 : out_bits = 4'd2;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd6;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd9;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd4;       
	  6'd62 : out_bits = 4'd5;      
	  6'd63 : out_bits = 4'd3;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S5_Box

module S6_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd12;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd10;            
	  6'd3  : out_bits = 4'd15;             
	  6'd4  : out_bits = 4'd9;             
	  6'd5  : out_bits = 4'd2;             
	  6'd6  : out_bits = 4'd6;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd0;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd4;             
	  6'd12 : out_bits = 4'd14;             
	  6'd13 : out_bits = 4'd7;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd11;             
	  6'd16 : out_bits = 4'd10;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd2;             
	  6'd20 : out_bits = 4'd7;             
	  6'd21 : out_bits = 4'd12;             
	  6'd22 : out_bits = 4'd9;             
	  6'd23 : out_bits = 4'd5;             
	  6'd24 : out_bits = 4'd6;             
	  6'd25 : out_bits = 4'd1;             
	  6'd26 : out_bits = 4'd13;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd9;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd15;             
	  6'd35 : out_bits = 4'd5;             
	  6'd36 : out_bits = 4'd2;             
	  6'd37 : out_bits = 4'd8;             
	  6'd38 : out_bits = 4'd12;             
	  6'd39 : out_bits = 4'd3;             
	  6'd40 : out_bits = 4'd7;             
	  6'd41 : out_bits = 4'd0;             
	  6'd42 : out_bits = 4'd4;             
	  6'd43 : out_bits = 4'd10;             
	  6'd44 : out_bits = 4'd1;             
	  6'd45 : out_bits = 4'd13;             
	  6'd46 : out_bits = 4'd11;             
	  6'd47 : out_bits = 4'd6;             
	  6'd48 : out_bits = 4'd4;             
	  6'd49 : out_bits = 4'd3;             
	  6'd50 : out_bits = 4'd2;             
	  6'd51 : out_bits = 4'd12;             
	  6'd52 : out_bits = 4'd9;             
	  6'd53 : out_bits = 4'd5;            
	  6'd54 : out_bits = 4'd15;             
	  6'd55 : out_bits = 4'd10;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd14;        
	  6'd58 : out_bits = 4'd1;       
	  6'd59 : out_bits = 4'd7;       
	  6'd60 : out_bits = 4'd6;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd8;      
	  6'd63 : out_bits = 4'd13;	  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S6_Box

module S7_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd4;             
	  6'd1  : out_bits = 4'd11;             
	  6'd2  : out_bits = 4'd2;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd15;             
	  6'd5  : out_bits = 4'd0;             
	  6'd6  : out_bits = 4'd8;             
	  6'd7  : out_bits = 4'd13;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd12;             
	  6'd10 : out_bits = 4'd9;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd10;             
	  6'd14 : out_bits = 4'd6;             
	  6'd15 : out_bits = 4'd1;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd0;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd9;             
	  6'd22 : out_bits = 4'd1;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd14;             
	  6'd25 : out_bits = 4'd3;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd2;             
	  6'd29 : out_bits = 4'd15;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd1;             
	  6'd33 : out_bits = 4'd4;             
	  6'd34 : out_bits = 4'd11;             
	  6'd35 : out_bits = 4'd13;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd3;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd14;             
	  6'd40 : out_bits = 4'd10;             
	  6'd41 : out_bits = 4'd15;             
	  6'd42 : out_bits = 4'd6;             
	  6'd43 : out_bits = 4'd8;             
	  6'd44 : out_bits = 4'd0;             
	  6'd45 : out_bits = 4'd5;             
	  6'd46 : out_bits = 4'd9;             
	  6'd47 : out_bits = 4'd2;             
	  6'd48 : out_bits = 4'd6;             
	  6'd49 : out_bits = 4'd11;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd8;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd4;            
	  6'd54 : out_bits = 4'd10;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd5;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd15;       
	  6'd60 : out_bits = 4'd14;       
	  6'd61 : out_bits = 4'd2;       
	  6'd62 : out_bits = 4'd3;      
	  6'd63 : out_bits = 4'd12;  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S7_Box

module S8_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd13;             
	  6'd1  : out_bits = 4'd2;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd4;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd1;             
	  6'd8  : out_bits = 4'd10;             
	  6'd9  : out_bits = 4'd9;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd14;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd12;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd1;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd13;             
	  6'd19 : out_bits = 4'd8;             
	  6'd20 : out_bits = 4'd10;             
	  6'd21 : out_bits = 4'd3;             
	  6'd22 : out_bits = 4'd7;             
	  6'd23 : out_bits = 4'd4;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd5;             
	  6'd26 : out_bits = 4'd6;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd14;             
	  6'd30 : out_bits = 4'd9;             
	  6'd31 : out_bits = 4'd2;             
	  6'd32 : out_bits = 4'd7;             
	  6'd33 : out_bits = 4'd11;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd1;             
	  6'd36 : out_bits = 4'd9;             
	  6'd37 : out_bits = 4'd12;             
	  6'd38 : out_bits = 4'd14;             
	  6'd39 : out_bits = 4'd2;             
	  6'd40 : out_bits = 4'd0;             
	  6'd41 : out_bits = 4'd6;             
	  6'd42 : out_bits = 4'd10;             
	  6'd43 : out_bits = 4'd13;             
	  6'd44 : out_bits = 4'd15;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd8;             
	  6'd48 : out_bits = 4'd2;             
	  6'd49 : out_bits = 4'd1;             
	  6'd50 : out_bits = 4'd14;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd10;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd15;        
	  6'd57 : out_bits = 4'd12;        
	  6'd58 : out_bits = 4'd9;       
	  6'd59 : out_bits = 4'd0;       
	  6'd60 : out_bits = 4'd3;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd11;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S8_Box

module DES (input logic [63:0] key, input logic [63:0] plaintext, 
	    input logic encrypt, output logic [63:0] ciphertext);

	logic [47:0] 	SubKey1, SubKey2, SubKey3, SubKey4;   
	logic [47:0] 	SubKey5, SubKey6, SubKey7, SubKey8;   
	logic [47:0] 	SubKey9, SubKey10, SubKey11, SubKey12;
	logic [47:0] 	SubKey13, SubKey14, SubKey15, SubKey16;

	logic [63:0] 	r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in, r16in, r16out;
	
	// SubKey generation
	GenerateKeys k1 (key, SubKey1, SubKey2, SubKey3, SubKey4,
				SubKey5, SubKey6, SubKey7, SubKey8,
				SubKey9, SubKey10, SubKey11, SubKey12,
				SubKey13, SubKey14, SubKey15, SubKey16);

	// encrypt (encrypt=1) or decrypt (encrypt=0) 

	// Initial Permutation (IP)
	IP b1 (plaintext, r1in); //plaintext is the initial plain text message, change ip_out to r1_in 
	// round 1
	round r1(r1in, (encrypt ? SubKey1 : SubKey16), r2in);
	
	// round 2
	round r2(r2in, (encrypt ? SubKey2 : SubKey15), r3in);

	// round 3
	round r3(r3in, (encrypt ? SubKey3 : SubKey14), r4in);

	// round 4
	round r4(r4in, (encrypt ? SubKey4 : SubKey13), r5in);

	// round 5
	round r5(r5in, (encrypt ? SubKey5 : SubKey12), r6in);

	// round 6
	round r6(r6in, (encrypt ? SubKey6 : SubKey11), r7in);

	// round 7
	round r7(r7in, (encrypt ? SubKey7 : SubKey10), r8in);

	// round 8
	round r8(r8in, (encrypt ? SubKey8 : SubKey9), r9in);

	// round 9
	round r9(r9in, (encrypt ? SubKey9 : SubKey8), r10in);

	// round 10
	round r10(r10in, (encrypt ? SubKey10 : SubKey7), r11in);
	
	// round 11
	round r11(r11in, (encrypt ? SubKey11 : SubKey6), r12in);
	
	// round 12
	round r12(r12in, (encrypt ? SubKey12 : SubKey5), r13in);

	// round 13
	round r13(r13in, (encrypt ? SubKey13 : SubKey4), r14in);

	// round 14
	round r14(r14in, (encrypt ? SubKey14 : SubKey3), r15in);

	// round 15
	round r15(r15in, (encrypt ? SubKey15 : SubKey2), r16in);

	// round 16
	round r16(r16in, (encrypt ? SubKey16 : SubKey1), r16out);

	// Final Permutation (IP^{-1}) (swap output of round16)
	FP FP({r16out[31:0], r16out[63:32]}, ciphertext);
   
endmodule // DES


