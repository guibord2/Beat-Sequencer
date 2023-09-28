module address_counter_edit #(parameter ADDR_NUM = 64)
  (input LRCLK, poweron,
   input [15:0] row,
   input [3:0] beat,
   output[17:0] counter);

  logic soundflag = 1'b0;
  logic [3:0] lastbeat = 4'b0111;

  always_ff @ (posedge LRCLK) begin
    if (~poweron) begin
      counter <= 'b0;
      soundflag <= 1'b0;
    end else if (soundflag) begin
      if (counter == ADDR_NUM-1) begin
        soundflag <= 1'b0;
        counter <= 'd0;
      end else begin
        counter <= counter + 1'b1;
      end
    end else if ((beat != lastbeat)) begin
      lastbeat <= beat;
      soundflag <= 1'b1;
//    counter <= 'd0;
    end
  end
endmodule