/*
 * Copyright (c) 2024 Jocelyn Zhu
 * SPDX-License-Identifier: Apache-2.0
 */

// FPGA Design
module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  
  /*
  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

    assign uo_out[0] = ui_in[0] + ui_in[1]; // OR gate assigned to output uo_out
    assign uo_out[1] = ui_in[2] * ui_in[3]; // AND gate w/ inputs 2 and 3 assigned to ouput 1
    assign uo_out[2] = ~ui_in[4]; // NOT gate
    assign uo_out[3] = ~(ui_in[0] + ui_in[1]); // NOR gate
    assign uo_out[4] = ~(ui_in[0] * ui_in[1]); // NAND gate

    // Initializing wires
    wire my_temp;
    assign my_temp = ui_in[1];*/
  
  //Output 0
  wire or0_ouA, or0_ouB, or0_ouC, or0_ouD, or0_ouE;  // Output wire of OR gates
  
  assign or0_ouA = ui_in[1] + ui_in[2]; // OR gate connecting inputs 0 and 1
  assign or0_ouB = ui_in[4] + ui_in[5]; // OR gate connecting inputs 4 and 5
  assign or0_ouC = ui_in[6] + ui_in[7];
  assign or0_ouD = or0_ouA + or0_ouB;
  assign or0_ouE = or0_ouD + or0_ouC;
  assign uo_out[0] = or0_ouE;
  
  // Output 1 
  wire or1_ouA, or1_ouB, or1_ouC, or1_ouD, or1_ouE;
  
  assign or1_ouA = ui_in[0] + ui_in[1];
  assign or1_ouB = ui_in[2] + ui_in[3];
  assign or1_ouC = ui_in[6] + ui_in[7];
  assign or1_ouD = or1_ouA + or1_ouB;
  assign or1_ouE = or1_ouD + or1_ouC;
  assign uo_out[1] = or1_ouE;
	
endmodule

