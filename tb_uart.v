`timescale 1ns / 1ps

module tb_uart;

    // Inputs
    reg clk;
    reg rst;
    reg rx;
    reg start;
    reg [7:0] tx_data;

    // Outputs
    wire tx;
    wire parity_error;

    // Instantiate DUT (Device Under Test)
    uart_top uut (
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .start(start),
        .tx_data(tx_data),
        .tx(tx),
        .parity_error(parity_error)
    );

    // 🔷 CLOCK GENERATION (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;   // 10 ns period

    // 🔷 TEST SEQUENCE
    initial begin
        // Initialize
        rst = 1;
        rx = 1;       // UART idle
        start = 0;
        tx_data = 8'hA5;

        // Reset pulse
        #20;
        rst = 0;

        // Start TX (optional)
        #20;
        start = 1;
        #10;
        start = 0;

        // Wait before RX
        #100;

        // 🔷 UART RECEIVE SEQUENCE

        // START BIT
        rx = 0; #104000;

        // DATA BITS (example: 8'b10101010)
        rx = 0; #104000;  // bit0
        rx = 1; #104000;  // bit1
        rx = 0; #104000;
        rx = 1; #104000;
        rx = 0; #104000;
        rx = 1; #104000;
        rx = 0; #104000;
        rx = 1; #104000;  // bit7

        // PARITY (even parity for 10101010 → 0)
        rx = 0; #104000;

        // STOP BIT
        rx = 1; #104000;

        // Wait to observe output
        #500000;

        $finish;
    end

endmodule
