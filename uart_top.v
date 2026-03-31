`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 06:14:20
// Design Name: 
// Module Name: uart_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_top (
    input clk, rst,
    input rx,
    input start,
    input [7:0] tx_data,
    output tx,
    output parity_error
);

wire tick;
wire [7:0] rx_data;
wire valid;

wire [7:0] fifo_out;
wire fifo_empty;

baud_gen BAUD (
    .clk(clk),
    .rst(rst),
    .tick(tick)
);

uart_rx RX (
    .clk(clk),
    .rst(rst),
    .tick(tick),
    .rx(rx),
    .data_out(rx_data),
    .valid(valid),
    .parity_error(parity_error)
);

fifo FIFO (
    .clk(clk),
    .rst(rst),
    .wr_en(valid),
    .rd_en(!fifo_empty),
    .data_in(rx_data),
    .data_out(fifo_out),
    .full(),
    .empty(fifo_empty)
);

uart_tx TX (
    .clk(clk),
    .rst(rst),
    .tick(tick),
    .data_in(fifo_out),
    .start(!fifo_empty),
    .tx(tx),
    .busy()
);

endmodule
