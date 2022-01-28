input macros

beginmulti;
  u := 0.75cm;
  z0 = (0u, 0u); z1 = (1u, 0u); z2 = (1u, 1u); z3 = (0u, 1u);

  draw z0..z1..z2..z3..cycle dashed evenly;
  draw z0--z2; draw z1--z3;
  shipmulti(0);

  draw z0..z1..z2..z3..cycle dashed evenly;
  draw z0{dir 45}..{dir -45}z1; draw z3{dir -45}..{dir 45}z2;
  shipmulti(1);

  draw z0..z1..z2..z3..cycle dashed evenly;
  draw z0{dir 45}..{dir 135}z3; draw z1{dir 135}..{dir 45}z2;
  shipmulti(2);

endmulti;

% A triangle with some curves inside
beginmulti;
  u := 1cm;
  z0 = u*dir 90; z1 = u*dir -30; z2 = u*dir -150; z3 = z0; z4 = z1;

  numeric n[];
  n0 = 2; n1 = 3; n2 = 4; n3 = n0; n4 = n1;

  pair d[];
  d0 = (z1-z0) rotated 90;
  d1 = (z2-z1) rotated 90;
  d2 = (z0-z2) rotated 90;
  d3 = d0;

  draw z0--z1--z2--cycle;
  drawoptions(withcolor backcolor);
  pickup vertexmarker;
  for i = 1 upto 3:
    for j = 1 upto n[i] + n[i+1]:
      draw (j/(n[i]+n[i+1]+1))[z[i],z[i+1]];
    endfor
  endfor
  shipmulti(10);

  draw z0--z1--z2--cycle;
  drawoptions(withcolor backcolor);
  for i = 1 upto 3:
    for j = 1 upto n[i]:
      draw (j/(n[i]+n[i-1]+1))[z[i],z[i-1]]{-d[i-1]}..{d[i]}(j/(n[i]+n[i+1]+1))[z[i],z[i+1]];
    endfor
  endfor
  shipmulti(11);
endmulti;

% Smoothing for curve multiplication
beginmulti;
  numeric u; u = 0.75cm;
  z0 = (0,-u); z1 = (u,0); z2 = (0,u); z3 = (-u,0);
  path p[];
  numeric f; f = 0.25;

  p0 = z0--z2; p1 = z3--z1;
  draw p0; draw p1;
  label.lft(textext("$B$"), 0.15[z0,z2]);
  label.top(textext("$A$"), 0.2[z3,z1]);
  shipmulti(20);

  draw subpath(0,f) of p0..subpath(1-f,1) of p1;
  draw subpath(0,f) of p1..subpath(1-f,1) of p0;
  label.lft(textext("$A\cdot B$"), 0.15[z0,z2]);
  shipmulti(21);

  z4 = (.8u,-u); z5 = (1.8u,0); z6 = (.8u,u);
  p2 = z4--z6; p3 = z3--(0,0)--(.8u,0)--z5;
  draw p0; draw p2; draw p3;
  label.lft(textext("$B$"), 0.15[z0,z2]);
  label.lft(textext("$B$"), 0.15[z4,z6]);
  label.top(textext("$A$"), 0.2[z3,z1]);
  shipmulti(22);

  draw subpath (0,f) of p3..subpath(1-f,1) of p0;
  draw subpath (0,f) of p0..{dir 0}point 1.5 of p3..subpath(1-f,1) of p2;
  draw subpath(0,f) of p2..subpath(3-f,3) of p3;
  label.lft(textext("$A\cdot B$"), 0.15[z0,z2]);
  shipmulti(23);
endmulti;

beginmulti;
  numeric u; u = 1.2cm;

  z0 = (0,0); z1 = (u,0); z2 = (u,u); z3 = (0,u);
  path p[];

  p0 = z0--z2; p1 = z1--z3;

  % A strand of x near the crossing
  draw p0; draw p1;
  draw (0.5u,-0.1u)..(0.8u,0.5u)..(0.5u,1.1u) withcolor backcolor;
  shipmulti(30);

  numeric f; f = 0.25;
  % Near a smoothed crossing
  draw subpath(0,f) of p0..subpath((1-f),1) of p1;
  draw subpath(0,f) of p1..subpath((1-f),1) of p0;
  label.lft(textext("$a_+$"), point 1.5 of (subpath(0,f) of p0..subpath((1-f),1) of p1));
  draw (0.5u,-0.1u)..(0.8u,0.5u)..(0.5u,1.1u) withcolor backcolor;
  label.rt(textext("$x$"), (0.8u,0.5u)) withcolor backcolor;
  shipmulti(31);

  % Crossing both components
  draw p0; draw p1;
  draw (-0.1u,0.3u)..(0.5u,0.2u)..(0.8u,0.5u)..(0.7u,1.1u) withcolor backcolor;
  shipmulti(32);
endmulti;

end
