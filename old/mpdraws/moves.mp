input macros

u := 1.6cm;
r := .3u;
w := 1.5r;

picture l.A, l.B, l.C, l.D, l.E, l.F;

l.A = textext("$A$");
l.B = textext("$B$");
l.C = textext("$C$");
l.D = textext("$D$");
l.E = textext("$E$");
l.F = textext("$F$");

vardef dolab@#(suffix $)(expr pos) =
  begingroup
    save ptmp; picture ptmp;
    ptmp := thelabel@#($, pos);
    unfill bbox ptmp;
    draw ptmp;
  endgroup;
enddef;

picture hashes;
hashspace := .25cm;
hashang := 45;
for i = -20 upto 20:
  draw (((-20hashspace*dir hashang)..(20hashspace*dir hashang)) shifted (i*hashspace*dir (hashang+90)));
endfor
hashes := currentpicture; clearit;

def filloptions = withcolor .9white enddef;
vardef do_fill(text t) =
  begingroup
    save ptmp, picttmp; path ptmp; picture picttmp;
    for ptmp=t:
      picttmp := hashes; clip picttmp to ptmp; draw picttmp;
    endfor
  endgroup
enddef;

framewidth := .35u;

picture pict[];

% Move 1: switch the diagonal of a square
beginmulti;
  path p[];
  z0 = (0u, 0u); z1 = (1u, 0u); z2 = (1u, 1u); z3 = (0u, 1u);
  z4 = whatever[z0,z2] = whatever[z1,z3];
  p0 = z0--z1--z2--z3--cycle;

%  do_fill(p0 shift_cycle -framewidth);
%  unfill p0;
  draw z0--z1--z2--z3--z0--z2;
  dolab.top(l.A, .5[z2,z3]);
  dolab.lft(l.B, .5[z3,z0]);
  dolab.bot(l.C, .5[z0,z1]);
  dolab.rt(l.D, .5[z1,z2]);
  dolab.lrt(l.E, .5[z0,z2]);
  mark_vertices(z0,z1,z2,z3);
  shipmulti(0);

%  do_fill(p0 shift_cycle -framewidth);
%  unfill p0;
  draw z1--z2--z3--z0--z1--z3;
  dolab.top(l.A, .5[z2,z3]);
  dolab.lft(l.B, .5[z3,z0]);
  dolab.bot(l.C, .5[z0,z1]);
  dolab.rt(l.D, .5[z1,z2]);
  dolab.llft(l.F, .5[z1,z3]);
  mark_vertices(z0,z1,z2,z3);
  shipmulti(1);

  draw z0--z2; draw z1--z3;
  draw (z0--z1--z2--z3--cycle) dashed evenly;
  shipmulti(2);

  numeric disp; disp = 0.1u;
  draw z0--z1--z2--z3--cycle dashed evenly;
  draw z0{dir 45}..(z4+(-disp,0))..{dir 135}z3;
  draw z1{dir 135}..(z4+(disp,0))..{dir 45}z2;
  shipmulti(3);

  draw z0--z1--z2--z3--cycle dashed evenly;
  draw z0{dir 45}..(z4+(0,-disp))..{dir -45}z1;
  draw z3{dir -45}..(z4+(0,disp))..{dir 45}z2;
  shipmulti(4);

% The two possibilities for the background curves
  n.a = 6; n.b = 6; n.c = 6; n.d = 6;
  for i = 1 upto n.a: z[i]a = z[-(n.a+1-i)]a = (i/(n.a+1))[z3,z2]; endfor
  for i = 1 upto n.b: z[i]b = z[-(n.b+1-i)]b = (i/(n.b+1))[z0,z3]; endfor
  for i = 1 upto n.c: z[i]c = z[-(n.d+1-i)]c = (i/(n.c+1))[z1,z0]; endfor
  for i = 1 upto n.d: z[i]d = z[-(n.d+1-i)]d = (i/(n.d+1))[z2,z1]; endfor
  draw p0;
  mark_vertices(z0,z1,z2,z3);
  drawoptions(withcolor backcolor);
  draw z1a{dir -90}..z[-1]b{dir 180}; draw z2a{dir -90}..z[-2]b{dir 180};
  draw z[-1]a{dir -90}..z1d{dir 0};
  draw z[-1]d{dir 180}..z1c{dir -90}; draw z[-2]d{dir 180}..z2c{dir -90}; draw z[-3]d{dir 180}..z3c{dir -90};
  draw z[-1]c{dir 90}..z1b{dir 180};
  pict0 := currentpicture;

  draw z3a{dir -90}..z5c{dir -90}; draw z4a{dir -90}..z4c{dir -90};
  shipmulti(5);

  draw pict0;
  drawoptions(withcolor backcolor);
  draw z3b{dir 0}..z3d{dir 0};
  shipmulti(6);
endmulti;

% Move 2: Switch a torus
% Currently omitted

% Move 3: Two pairs of pants (planar version)
beginmulti;
  r1 := 1.4r; r2 := 1.65r;
  ext := .2u;

  z0 = (-w,-w); z1 = (-w,w); z2 = (w,w); z3 = (w,-w);
  path p[];
  for i = 0 upto 3:
    p[i] = fullcircle scaled 2r shifted z[i];
  endfor

  do_fill(p0, p1, p2, p3);
  draw p0; draw p1; draw p2; draw p3;
  dolab.lft(l.A,point 0 of p1);
  dolab.lft(l.B,point 0 of p2);
  dolab.lft(l.C,point 0 of p3);
  dolab.lft(l.D,point 0 of p0);
  p4 = (z1+r1*dir -135)..(z1+r1*dir 135)..(0,w+r2)..(z2+r1*dir 45)..(z2+r1*dir-45)..(0,w-r2)..cycle;
  draw p4; dolab.bot(l.E, point 2 of p4);
  shipmulti(20);

  do_fill(p0, p1, p2, p3);
  draw p0; draw p1; draw p2; draw p3;
  dolab.lft(l.A,point 0 of p1);
  dolab.lft(l.B,point 0 of p2);
  dolab.lft(l.C,point 0 of p3);
  dolab.lft(l.D,point 0 of p0);
  p5 = (z0+r1*dir-45)..(z0+r1*dir-135)..(-w-r2,0)..(z1+r1*dir135)..(z1+r1*dir45)..(-w+r2,0)..cycle;
  draw p5; dolab.lft(l.F, point 5 of p5);
  shipmulti(21);
endmulti;

% Move 4: pair of pants + cusped annulus
beginmulti;
  path p[];
  z0 = (0,-w); z1 = (0,w);
  p0 = fullcircle scaled 2r shifted z0;
  p1 = fullcircle scaled 2r shifted z1;
  r1 := 1.5r; r2 := 1.75r;
  p2 = (z0+r1*dir -45)..(z0+r1*dir -135)..(-r2,0)..(z1+r1*dir 135)..(z1+r1*dir45)..(r2,0)..cycle;
  z2 = (0, 1.4u);
  r3 := 2.2r; r4 := 2.5r;
  p3 = z2{curl 0.5}..(z1+r3*dir 20)..(r4,0)..(z0+r3*dir -45)..(z0+r3*dir-135)..(-r4,0)..(z1+r3*dir 160)..{curl 0.5}cycle;
  r5 := 1.3r;
  p4 = z2{dir -74}...(z1 + r5*dir 0)..(z1+r5*dir -90)..(z1+r5*dir 180)...{dir 74}cycle;
  p5 = z2{dir -44}...(z1+1.9r*dir 0)..(z0+1.6r*dir 0)..{dir 180}(z0+1.4r*dir-90){dir 180}..{dir 90}(z0+1.4r*dir(-180)){dir 90}..(z0+1.4r*dir 90)..(.3u,.1u)..(z1+1.5r*dir 0)..{dir (180-59)}cycle;

  do_fill(p3 shift_cycle framewidth); unfill p3;
  do_fill(p0, p1);
  draw p0; dolab.lft(l.B, point 0 of p0);
  draw p1; dolab.lft(l.A, point 0 of p1);
  draw p3; dolab.rt(l.C, point 2 of p3);
  mark_vertices(z2);
  draw p2; dolab.top(l.D, point 3.5 of p2);
  shipmulti(30);

  do_fill(p3 shift_cycle framewidth); unfill p3;
  do_fill(p0, p1);
  draw p0; dolab.lft(l.B, point 0 of p0);
  draw p1; dolab.lft(l.A, point 0 of p1);
  draw p3; dolab.rt(l.C, point 2 of p3);
  mark_vertices(z2);
  draw p4; dolab.lft(l.E, point 2.8 of p4);
  draw p5; dolab.ulft(l.F, point 4.3 of p5);
  shipmulti(31);
endmulti;

% Move 5: cusped annulus + cusped annulus
beginmulti;
  path p[];
  z0 = (0,-.4u); z1 = (-.2u,.1u); z2 = (0,.4u); z3 = (.2u,.1u);
  p0 = z0{curl 0}..z1..z2..z3..{curl 0}cycle;

  z4 = (0,-.6u); z5 = (-.5u,0); z6 = (0,.6u); z7 = (.5u,0);
  p1 = z4..z5..z6..z7..cycle;

  z8 = (0,1.1u); z9 = (.75u, 0); z10 = (0,-.85u); z11 = (-.75u, 0);
  p2 = z8{curl 0}..z9..z10..z11..{curl 0}cycle;

  z12 = (-.35u,.15u);
  z13 = ( .35u,.15u);
  p3 = z0{curl 0}..z12..{curl 0}z8;
  p4 = z0{curl 0}..z13..{curl 0}z8;
  
  do_fill(p2 shift_cycle framewidth); unfill p2;
  do_fill(p0);
  draw p0; dolab.rt(l.A, point 1 of p0);
  draw p2; dolab.lft(l.B, point 3 of p2);
  mark_vertices(z0,z8);
  draw p1; dolab.top(l.C, point 2 of p1);
  shipmulti(40);

  do_fill(p2 shift_cycle framewidth); unfill p2;
  do_fill(p0);
  draw p0; dolab.rt(l.A, point 1 of p0);
  draw p2; dolab.lft(l.B, point 3 of p2);
  mark_vertices(z0,z8);
  draw p3; dolab.lft(l.D, point 1 of p3);
  draw p4; dolab.rt(l.E, point 1 of p4);
  shipmulti(41);
endmulti;

% Move 6: triangle + cusped annulus
% Slight bug: the filling shifts between the two sides
beginmulti;
  path p[];
  z0 = (0,-.45u); z1 = (0,.45u);
  p0 = z0{curl0}..(-.26u,0)..{curl0}z1{curl0}..(.26u,0)..{curl0}cycle;
  r0 := .35u; r0a := .53u;
  p2 = z0{curl 1}..z1+r0a*dir 210..z1+r0*dir 90..z1+r0a*dir -30..{curl 1}z0;
  p3 = z1{curl 1}..z0+r0a*dir 30..z0+r0*dir -90..z0+r0a*dir -210..{curl 1}z1;
  p4 = (0,-.8u)..(-.8u,0)..(0,1.1u)..(.8u,0)..cycle;
  p5 = (0,-1.1u)..(-.8u,0)..(0,.8u)..(.8u,0)..cycle;

  do_fill(p4 shift_cycle framewidth); unfill p4;
  do_fill(p0);
  draw p0; dolab.rt(l.A, point 1 of p0); dolab.lft(l.B, point 3 of p0);
  draw p4; dolab.urt(l.C, point 2.5 of p4);
  mark_vertices(z0,z1);
  draw p2; dolab.bot(l.D, point 2 of p2);
  shipmulti(50);

  do_fill(p5 shift_cycle framewidth); unfill p5;
  do_fill(p0);
  draw p0; dolab.rt(l.A, point 1 of p0); dolab.lft(l.B, point 3 of p0);
  draw p5; dolab.urt(l.C, point 2.5 of p5);
  mark_vertices(z0,z1);
  draw p3; dolab.top(l.E, point 2 of p3);
  shipmulti(51);
endmulti;
end