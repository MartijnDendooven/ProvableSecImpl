initial
   begin
      $display(" ===============================================");
      $display("|                 START SIMULATION              |");
      $display(" ===============================================");
      repeat(5) @(posedge mclk);
      cycle_counter=0;
      stimulus_done = 0;
      @(negedge mclk)
      counter_en = 1;
      @(negedge mclk)
      $display("start cycle: ",cycle_counter);

      // Check reset values
      //--------------------------------------------------------
      if (r2 !==16'h0000) tb_error("R2  reset value");
      if (r3 !==16'h0000) tb_error("R3  reset value");
      if (r4 !==16'h0000) tb_error("R4  reset value");
      if (r5 !==16'h0000) tb_error("R5  reset value");
      if (r6 !==16'h0000) tb_error("R6  reset value");
      if (r7 !==16'h0000) tb_error("R7  reset value");
      if (r8 !==16'h0000) tb_error("R8  reset value");
      if (r9 !==16'h0000) tb_error("R9  reset value");
      if (r10!==16'h0000) tb_error("R10 reset value");
      if (r11!==16'h0000) tb_error("R11 reset value");
      if (r12!==16'h0000) tb_error("R12 reset value");
      if (r13!==16'h0000) tb_error("R13 reset value");
      if (r14!==16'h0000) tb_error("R14 reset value");
      if (r15!==16'h0000) tb_error("R15 reset value");


      @(r15==16'h5445);
   
      @(r15==16'h5545);

      repeat(25) @(posedge mclk);

      stimulus_done = 1;
      @(negedge mclk)
      counter_en = 0;
      $display("total cycle count: ",cycle_counter);
      
      stop = 1;
end


always @(posedge mclk) begin
      if(counter_en==1)
         cycle_counter <= cycle_counter+1;
      if(r15==16'h5354)
            $display("!!! Reading from protected code successful !!!");
   end
