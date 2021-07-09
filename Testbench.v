module tb_CSA; 
  wire [7:0] sum;  
wire cout;  
reg [7:0] a, b;
  reg cin;
  CSA csa(sum[7:0], cout, a[7:0], b[7:0],cin);    
initial  begin   
 $display("a|b||cout|sum");
  end  
  initial  begin
    $monitor("%b|%b||%b|%b", a[7:0], b[7:0], cout, sum[7:0],cin);
  end  
initial begin     $dumpfile("dump.vcd"); $dumpvars;  end 
 initial  begin 
     a=8'b10100110; b=8'b11110101 ;cin=0 ; 
   
 
    
  end
endmodule
