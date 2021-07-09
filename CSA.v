# carry-skip-adder
Carry skip adder using Universal Gates


module fa_nand(   output sum,    output carry,input a,    input b,    input cin);
wire x1,x2,x3,x4,x5,x6,x7;
  nand n1(x1,a,b);
  nand n2(x3,a,x1);
  nand n3(x2,x1,b);
  nand n4(x4,x3,x2);
  nand n5(x5,x4,cin);
  nand n6(x6,x4,x5);
  nand n7(x7,x5,cin);
  nand n8(carry,x5,x1);
  nand n9(sum,x6,x7);
endmodule

module Ripple(output [3:0] sum, output cout, input [3:0] a, b, input cin);
 wire [3:1] c;
 
 fa_nand f0(sum[0], c[1], a[0], b[0], cin);
 fa_nand f1[2:1](sum[2:1], c[3:2], a[2:1], b[2:1], c[2:1]);
 fa_nand f2(sum[3], cout, a[3], b[3], c[3]);
 endmodule


module Skip(output cin_next,
 input [3:0] a, b, input cin, cout);
 wire g0, g1, g2, g3, G, k,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,x,x1;
  
  //or (g0, a[0], b[0]);
  nand(h0,a[0], a[0]);
  nand(h1,b[0],b[0]);
  nand(g0,h0,h1);
  // or (g1, a[1], b[1]);
  nand(h2,a[1], a[1]);
  nand(h3,b[1],b[1]);
  nand(g1,h2,h3);
 //or (g2, a[2], b[2]);
  nand(h4,a[2], a[2]);
  nand(h5,b[2],b[2]);
  nand(g2,h4,h5);
 //or (g3, a[3], b[3]);
  nand(h6,a[3], a[3]);
  nand(h7,b[3],b[3]);
  nand(g3,h6,h7);
  //and (G, g0, g1, g2, g3);
  nand(x,g0,g1,g2,g3);
  nand(G,x,x);
 //and (k, G, cin);
  nand(x1,G,cin);
  nand(k,x1,x1);
 //or (cin_next, k, cout);
  nand(h8,k, k);
  nand(h9,cout,cout);
  nand(cin_next,h8,h9);
endmodule


module CSA(output [7:0] sum, output cout, input [7:0] a, b ,input cin);
 wire cout0, cout1, k;
 Ripple rip0(sum[3:0], cout0, a[3:0], b[3:0], 0);
 Ripple rip1(sum[7:4], cout1, a[7:4], b[7:4], k);
 
 Skip sk0(k, a[3:0], b[3:0], 0, cout0);
 Skip sk1(cout, a[7:4], b[7:4], k, cout1);
 
endmodule

