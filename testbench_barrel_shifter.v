module test_barrel_shifter;
    reg  [7:0] data_in;
    reg  [2:0] shift_amt;
    reg        dir;
    wire [7:0] data_out;

    barrel_shifter uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .dir(dir),
        .data_out(data_out)
    );

    initial begin
        $monitor("data_in = %b, shift_amt = %d, dir = %s => data_out = %b",
                 data_in, shift_amt, dir ? "Right" : "Left", data_out);

        data_in = 8'b10110011; shift_amt = 3'd1; dir = 0; #10;
        data_in = 8'b10110011; shift_amt = 3'd2; dir = 0; #10;
        data_in = 8'b10110011; shift_amt = 3'd3; dir = 1; #10;
        data_in = 8'b11110000; shift_amt = 3'd4; dir = 1; #10;

        $finish;
    end
endmodule
