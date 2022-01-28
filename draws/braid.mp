input macros;

% How a triangulation (and a curve inside it) behave under a generator
% of the braid group.

beginmulti;
  numeric u;
  path p[];
  u := 1cm;
  z0 = (-u,0); z1 = (0,u); z2 = (u,0); z3 = (0,-u);
  z4 = 1/5[z0,z2]; z5 = 2/5[z0,z2]; z6 = 3/5[z0,z2]; z7 = 4/5[z0,z2];
  p4 = z1..{dir -90}z4..z3;
  p5 = z1..{dir -90}z5..z3;
  p6 = z1..{dir -90}z6..z3;
  p7 = z1..{dir -90}z7..z3;
  numeric d; d := 0.15u;
  p1 = z4..(z5+(0,2d))..z6;
  p2 = z5..(z6-(0,2d))..z7;

  draw z0..z1..z2..z3..cycle;
  pickup vertexmarker;
  draw z1; draw z3; draw z4; draw z5; draw z6; draw z7;
  pickup defaultpen;
  draw z4--z5--z6--z7;
  draw p4; draw p5; draw p6; draw p7;
  shipmulti(0);

  draw z0..z1..z2..z3..cycle;
  pickup vertexmarker;
  draw z1; draw z3; draw z4; draw z5; draw z6; draw z7;
  pickup defaultpen;
  draw p4; draw subpath(1,2) of p5; draw subpath(0,1) of p6; draw p7;
  draw p1; draw p2; draw z5--z6;
  draw z1..1/2[point 0.5 of p6,point 0.5 of p7]..1/2[z6,z7]..(z6-(0,d))..z5;
  draw z6..(z5+(0,d))..1/2[z4,z5]..1/2[point 1.5 of p4,point 1.5 of p5]..z3;
  shipmulti(1);

  draw z0..z1..z2..z3..cycle;
  pickup vertexmarker;
  draw z1; draw z3; draw z4; draw z5; draw z6; draw z7;
  pickup defaultpen;
  draw p4; draw subpath(1,2) of p5; draw subpath(0,1) of p6; draw p7;
  draw p1; draw p2;
  draw z4--z5--z6--z7;
  shipmulti(2);

% Now with a curve following along
  p10 = (p1 shift_arc 0.6d)..((reverse p1) shift_arc 0.6d)..cycle;
  p11 = ((z4--z5) shift_arc d)..((z5--z4) shift_arc d)..cycle;

  draw z0..z1..z2..z3..cycle;
  pickup vertexmarker;
  draw z1; draw z3; draw z4; draw z5; draw z6; draw z7;
  pickup defaultpen;
  draw z4--z5--z6--z7;
  draw p4; draw p5; draw p6; draw p7;
  draw p11 withcolor backcolor;
  shipmulti(10);

  draw z0..z1..z2..z3..cycle;
  pickup vertexmarker;
  draw z1; draw z3; draw z4; draw z5; draw z6; draw z7;
  pickup defaultpen;
  draw p4; draw subpath(1,2) of p5; draw subpath(0,1) of p6; draw p7;
  draw p1; draw p2; draw z5--z6;
  draw z1..1/2[point 0.5 of p6,point 0.5 of p7]..1/2[z6,z7]..(z6-(0,d))..z5;
  draw z6..(z5+(0,d))..1/2[z4,z5]..1/2[point 1.5 of p4,point 1.5 of p5]..z3;
  draw p10 withcolor backcolor;
  shipmulti(11);

  draw z0..z1..z2..z3..cycle;
  pickup vertexmarker;
  draw z1; draw z3; draw z4; draw z5; draw z6; draw z7;
  pickup defaultpen;
  draw p4; draw subpath(1,2) of p5; draw subpath(0,1) of p6; draw p7;
  draw p1; draw p2;
  draw z4--z5--z6--z7;
  draw p10 withcolor backcolor;
  shipmulti(12);

  draw z0..z1..z2..z3..cycle;
  pickup vertexmarker;
  draw z1; draw z3; draw z4; draw z5; draw z6; draw z7;
  pickup defaultpen;
  draw z4--z5--z6--z7;
  draw p4; draw p5; draw p6; draw p7;
  draw p10 withcolor backcolor;
  shipmulti(13);
endmulti;

end
