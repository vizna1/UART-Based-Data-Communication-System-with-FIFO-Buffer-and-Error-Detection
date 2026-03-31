`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 06:17:46
// Design Name: 
// Module Name: fifo
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

module fifo #(
    parameter DEPTH = 16
)(
    input clk, rst,
    input wr_en, rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full, empty
);

reg [7:0] mem [0:DEPTH-1];
reg [4:0] wr_ptr, rd_ptr;

assign full  = (wr_ptr - rd_ptr) == DEPTH;
assign empty = (wr_ptr == rd_ptr);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
    end else begin
        if (wr_en && !full) begin
            mem[wr_ptr[3:0]] <= data_in;
            wr_ptr <= wr_ptr + 1;
        end

        if (rd_en && !empty) begin
            data_out <= mem[rd_ptr[3:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end
end

endmodule
