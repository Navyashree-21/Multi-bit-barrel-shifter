module barrel_shifter (
    input  [7:0] data_in,      // Data to shift
    input  [2:0] shift_amt,    // Shift amount: 0 to 7
    input        dir,          // Shift direction: 0 = left, 1 = right
    output [7:0] data_out      // Shifted result
);

    wire [7:0] stage0, stage1, stage2;

    // ---- Stage 0: Shift by 1 bit ----
    assign stage0 = (dir == 1'b0) ? 
                    (shift_amt[0] ? {data_in[6:0], 1'b0} : data_in) :
                    (shift_amt[0] ? {1'b0, data_in[7:1]} : data_in);

    // ---- Stage 1: Shift by 2 bits ----
    assign stage1 = (dir == 1'b0) ? 
                    (shift_amt[1] ? {stage0[5:0], 2'b00} : stage0) :
                    (shift_amt[1] ? {2'b00, stage0[7:2]} : stage0);

    // ---- Stage 2: Shift by 4 bits ----
    assign stage2 = (dir == 1'b0) ? 
                    (shift_amt[2] ? {stage1[3:0], 4'b0000} : stage1) :
                    (shift_amt[2] ? {4'b0000, stage1[7:4]} : stage1);

    assign data_out = stage2;

endmodule
