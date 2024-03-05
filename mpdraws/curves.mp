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
% Basic unit for all figures
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

end
