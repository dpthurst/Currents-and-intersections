input macros;

% ----------------------------------------
% Fill to mark the surface
color fill_color;
fill_color = 0.9white;

def surf_fill(expr p) = fill p withcolor fill_color
enddef;

background := fill_color;
def skein_circle(expr p) = surf_fill(p); draw p dashed stddash; enddef;
def opened_circle(expr p) =
  fill p withcolor white;
  draw p;
  pickup vertexmarker; draw point 0 of p;
  pickup defaultpen;
  draw point 1 of p--point 5 of p;
  draw point 3 of p--point 7 of p;
enddef;

% Basic unit for all figures
u := 0.45cm;

beginmulti;
  for i = 0 upto 3: z[i] = u*dir(-135+90*i); endfor
%  z0 = (0u, 0u); z1 = (1u, 0u); z2 = (1u, 1u); z3 = (0u, 1u);
  path p[];
  p0 = z0..z1..z2..z3..cycle;

%% Simple skein relation
  skein_circle(p0);
  draw z0--z2; draw z1--z3;
  shipmulti(0);

  skein_circle(p0);
  draw z0{dir 45}..{dir -45}z1; draw z3{dir -45}..{dir 45}z2;
  shipmulti(1);

  skein_circle(p0);
  draw z0{dir 45}..{dir 135}z3; draw z1{dir 135}..{dir 45}z2;
  shipmulti(2);

%% Oriented
  skein_circle(p0);
  draw z0--z2; draw z1--z3;
  mark_dir(z0--z2, 0.8);
  mark_dir(z1--z3, 0.8);
  shipmulti(3);

  skein_circle(p0);
  draw z0{dir 45}..{dir 135}z3;
  draw z1{dir 135}..{dir 45}z2;
  mark_dir(z0{dir 45}..{dir 135}z3,0.5);
  mark_dir(z1{dir 135}..{dir 45}z2,0.5);
  shipmulti(4);
endmulti;

% Three crossings in a row
beginmulti;
  u := sqrt(2)*u;
  a := 0.1u;
  x0 = x4 = 0u;
  x1 = x5 = 1u;
  x2 = x6 = 2u;
  x3 = x7 = 3u;
  y0 = y3 = 0u; y4 = y7 = 1u;
  y1 = y2 = a; y5 = y6 = 1u-a;

  path p[];
  p0 = z0..(1.5u,-0.5u)..z3..z7..(1.5u,1.5u)..z4..cycle;
  p1 = z0{dir 45}..z5..z2..{dir 45}z7;
  p2 = z4{dir -45}..z1..z6..{dir -45}z3;

  skein_circle(p0);
  draw p1;
  draw p2;
  pickup thinpen;
  draw fullcircle scaled 0.5u shifted (1.5u,0.5u);
  shipmulti(20);
endmulti;

% Smaller, unfilled versions of the basic skein elements for equations
% Basic unit
u := 0.25cm;

beginmulti;
  for i = 0 upto 3: z[i] = u*dir(-135+90*i); endfor
%  z0 = (0u, 0u); z1 = (1u, 0u); z2 = (1u, 1u); z3 = (0u, 1u);
  path p[];
  p0 = z0..z1..z2..z3..cycle;

%% Simple skein relation
  draw p0 dashed stddash;
  draw z0--z2; draw z1--z3;
  shipmulti(10);

  draw p0 dashed stddash;
  draw z0{dir 45}..{dir -45}z1; draw z3{dir -45}..{dir 45}z2;
  shipmulti(11);

  draw p0 dashed stddash;
  draw z0{dir 45}..{dir 135}z3; draw z1{dir 135}..{dir 45}z2;
  shipmulti(12);
endmulti;

% A non-essential crossing in a pair of pants
beginmulti;
  u := 1.5cm;
  path p[], p[]a;

  % The pair of pants
  p0 = fullcircle scaled u shifted (-1.5u,0);
  p1 = fullcircle scaled u shifted (1.5u,0);
  p2 = (-3u,0)..(-1.5u,1.5u)..(0,1.2u)..(1.5u,1.5u)..(3u,0)..(1.5u,-1.5u)..(0,-1.2u)..(-1.5u,-1.5u)..cycle;

  pickup thickpen;
  surf_fill(p2); fill p1 withcolor white; fill p0 withcolor white;
  draw p0; draw p1; draw p2;

  % Marking $\pi_1$
  z0 = origin; z1 = (-1.5u, 0.8u); z2 = (-2.3u,0); z3 = (-1.5u,-0.8u);
  p3 = z0{dir 135} .. z1 .. z2 .. z3 .. {dir 45}z0;
  p4 = p3 xscaled -1;

  pickup vertexmarker; draw z0;  texlabel.rt("$*$", z0);
  pickup defaultpen;
  draw p3 dashed stddash; mark_dir(p3, 2); texlabel.lft("$a$", point 2 of p3);
  draw p4 dashed stddash; mark_dir(p4, 2); texlabel.lft("$b$", point 2 of p4);
  shipmulti(40);

  % Adding the problematic curve

  p10 = (0.5u*dir -135){dir 135}..{dir 180}(-1.5u,0.65u)..(subpath(2,4) of p3 shift_arc 0.1u);
  p11 = p4 shift_arc 0.1u;
  p12 = ((-0.1u,0u){dir 90}...(-0.2u,0.6u)...{dir -90}(-0.3u,0u)) rotated 45;
  p13 = reverse (p4 shift_arc 0.3u);
  p14 = ((0u,0.3u){dir 180}...(-0.2u,0.4u)...{dir 0}(0u,0.5u)) rotated 45;
  p15 = p4 shift_arc 0.5u;

  z10 = p12 intersectionpoint subpath(1,2) of p14;

  addto currentpicture also outpicture[20];
  draw p10; mark_dir(p10,1.5);
  draw p11; mark_dir(p11,6);
  draw p12; draw p13; mark_dir(p13,10) draw p14; draw p15; mark_dir(p15,6);
  pickup vertexmarker; draw z10; texlabel.top("$x$", z10);
  shipmulti(41);
endmulti;

  
% Possible situations near a 4-valent vertex (for errata)
beginmulti;
  u := 0.7cm;
  for i = 0 upto 3: z[i] = u*dir(-135+90*i); endfor
  path p[];
  p0 = z0..z1..z2..z3..cycle;
  
  p1 := z0--origin--z1; p2 := z3--origin--z2;
  skein_circle(p0);
  drawoptions (withcolor darkred);
  draw p1;
  mark_dir(p1,0.5); texlabel.lrt("$\scriptstyle a$", point 0.5 of p1);
  mark_dir(p1,1.5); texlabel.urt("$\scriptstyle a$", point 1.5 of p1);
  drawoptions (withcolor darkblue);
  draw p2;
  mark_dir(p2,0.5); texlabel.llft("$\scriptstyle b$", point 0.5 of p2);
  mark_dir(p2,1.5); texlabel.ulft("$\scriptstyle b$", point 1.5 of p2);
  drawoptions();
  pickup vertexmarker; draw origin;
  shipmulti(30);

  p1 := z0--origin--z1; p2 := z2--origin--z3;
  skein_circle(p0);
  drawoptions (withcolor darkred);
  draw p1;
  mark_dir(p1,0.5); texlabel.lrt("$\scriptstyle a$", point 0.5 of p1);
  mark_dir(p1,1.5); texlabel.urt("$\scriptstyle a$", point 1.5 of p1);
  drawoptions (withcolor darkblue);
  draw p2;
  mark_dir(p2,0.5); texlabel.ulft("$\scriptstyle b$", point 0.5 of p2);
  mark_dir(p2,1.5); texlabel.llft("$\scriptstyle b$", point 1.5 of p2);
  drawoptions();
  pickup vertexmarker; draw origin;
  shipmulti(31);

  p1 := z0--origin--z2; p2 := z1--origin--z3;
  skein_circle(p0);
  drawoptions (withcolor darkred);
  draw p1;
  mark_dir(p1,0.5); texlabel.lrt("$\scriptstyle a$", point 0.5 of p1);
  mark_dir(p1,1.5); texlabel.ulft("$\scriptstyle a$", point 1.5 of p1);
  drawoptions (withcolor darkblue);
  draw p2;
  mark_dir(p2,0.5); texlabel.urt("$\scriptstyle b$", point 0.5 of p2);
  mark_dir(p2,1.5); texlabel.llft("$\scriptstyle b$", point 1.5 of p2);
  drawoptions();
  pickup vertexmarker; draw origin;
  shipmulti(32);
endmulti;

end
