input macros
input 3d

% ------------------------------------------------------------
% Various curves on a 4-perforated sphere
beginmulti;
  makeframe(10,-5);

  transform XY[];
  for i = 0 upto 4:
    origin transformed XY[i] = origin;
    up transformed XY[i] = f.y;
    right transformed XY[i] = (dir (-45+90*i)) transformed XZ;
  endfor

  numeric u; u = 1.3cm;
  numeric r[];
  r1 = 0.5u;
  r2 = 0.85u;

  path p[], p[]a, p[]b;
  for i = 0 upto 3:
    z[i] = (u*dir (45+90*i)) transformed XZ;
    p[i] = fullcircle scaled (2*r1) transformed XY[i] shifted z[i];
  endfor
  p4 = fullcircle rotated -90 xscaled 2r2 yscaled 2.2r1 transformed XY;
  p5 = fullcircle rotated 180 yscaled 2r2 xscaled 2.2r1 transformed YZ;
  p6 = tangent(p3,dir 135)..tangent(p4,dir 90)..tangent(reverse p0,dir 45);
  p7 = tangent(reverse p0, dir -135)..tangent(p5, dir 180)..tangent(reverse p1,dir 135);
  p8 = tangent(reverse p1, dir -45)..tangent(p4,dir -90)..tangent(p2,dir -135);
  p9 = tangent(p2,dir 45)..tangent(p5, dir 0)..tangent(p3, dir -45);

  def draw_outline =
    draw p0; draw p1;
    draw subpath (0,4) of p2; draw subpath(4,8) of p2 dashed hiddendash;
    draw subpath (0,4) of p3; draw subpath(4,8) of p3 dashed hiddendash;
    draw p6; draw p7; draw p8; draw p9;
  enddef;
  def draw_e =
    draw p4 cutafter p6; draw cuttings cutafter p8 dashed hiddendash; draw cuttings;
  enddef;
  def draw_f =
    draw p5 cutafter p9; draw cuttings cutafter p7 dashed hiddendash; draw cuttings;
  enddef;
  def draw_labels =
    label.urt(textext("$A$"), point 6 of p0);
    label.ulft(textext("$B$"), point 6 of p1);
    label.llft(textext("$C$"), point 2 of p2);
    label.lrt(textext("$D$"), point 2 of p3);
    label.bot(textext("$E$"), point 7.2 of p4);
    label.lft(textext("$F$"), point 7.2 of p5);
  enddef;

  draw_outline; draw_e; draw_f;
  label.bot(textext("$P_i$"), point 7.2 of p4);
  label.lft(textext("$Q_i$"), point 7.2 of p5);
  shipmulti(1);

  draw_outline; draw_e;
  shipmulti(5);

  rescale(1/1.3)(u)(z0,z1,z2,z3)(p0,p1,p2,p3,p4,p5,p6,p7,p8,p9);

  draw_outline; draw_e; draw_f;
  draw_labels;
  shipmulti(0);

  p20 = subpath(0.5,3.5) of p4; p21 = subpath(4.5,7.5) of p4;
  p22 = subpath(0.5,3.5) of p5; p23 = subpath(4.5,7.5) of p5;

  draw_outline;
  draw (p20..p23..cycle) cutafter p6;
    draw cuttings cutafter p7 dashed hiddendash;
    draw cuttings;
  label.rt(textext("$B$"), point 7.2 of p5);
  draw (p21..p22..cycle) cutafter p9;
    draw cuttings cutafter p8 dashed hiddendash;
    draw cuttings;
  label.bot(textext("$D$"), point 7.2 of p4);
  shipmulti(10);

  draw_outline;
  draw (p20..(reverse p22)..(reverse p21)..p23..cycle) cutafter p6;
    draw cuttings cutafter p9 dashed hiddendash;
    draw cuttings cutafter p8;
    draw cuttings cutafter p7 dashed hiddendash;
    draw cuttings;
  label.lft(textext("$F\cdot E$"), point 7.2 of p5);
  shipmulti(11);

  draw_outline;
  draw (p20..p23..(reverse p21)..(reverse p22)..cycle) cutafter p6;
    draw cuttings cutafter p7 dashed hiddendash;
    draw cuttings cutafter p8;
    draw cuttings cutafter p9 dashed hiddendash;
    draw cuttings;
  label.lft(textext("$E\cdot F$"), point 7.2 of p5);
  shipmulti(12);

  draw_outline;
  draw (p20..(reverse p22)..cycle) cutafter p6;
    draw cuttings cutafter p9 dashed hiddendash;
    draw cuttings;
  label.bot(textext("$C$"),point 0.8 of p4);
  draw ((reverse p21)..p23..cycle) cutafter p8;
    draw cuttings cutafter p7 dashed hiddendash;
    draw cuttings;
  label.lft(textext("$A$"),point 7.2 of p5);
  shipmulti(13);
endmulti;

% ------------------------------------------------------------
% A torus and a genus 2 surface
% Common parameters
makeframe(28,-6);

numeric u, r[];
u := 0.7cm;
r1 = 2u;    % The radius of the big circle in the torus
r2 = 0.8u;  % The radius of the small circles;

% The torus
beginmulti;
  path p[], p[]c, pu[], pl[];

  numeric n; n := 100; % The number of circles to draw for the envelope
  numeric n[];
  n0 = 1; n1 = n/2-4; n2 = n/2+4; n3 = n-6; % Magic numbers for how far to extend envelope
  n10 = 29; n11 = 68; n12 = 79; n13 = 18;

  for i = 0 upto n:
    p[i]c = fullcircle scaled 2r2 shifted (r1,0)
		       transformed Zframe (i/n*360-90);
  endfor;
  for i = 0 upto n/4:
    pu[i] = subpath(3,-1) of p[i]c;
    pl[i] = subpath(3,7) of p[i]c;
  endfor;
  for i = 3n/4+1 upto n:
    pu[i] = subpath(3,-1) of p[i]c;
    pl[i] = subpath(3,7) of p[i]c;
  endfor
  for i = n/4+1 upto 3n/4:
    pu[i] = subpath(1,-3) of p[i]c;
    pl[i] = subpath(1,5) of p[i]c;
  endfor

  path tlip.u, tlip.l, tout;
  tout = envelope(n0,n1)(pu)..tangent(reverse pu[n/2],-f.x)..
	 envelope(n2,n3)(pu)..tangent(pu[0],f.x)..cycle;
  tlip.l = envelope(n10,n1)(pl)..tangent(reverse pl[n/2],-f.x)..
	   envelope(n2,n11)(pl);
  tlip.u = envelope(n12,n3)(pl)..tangent(pl[0],f.x)..envelope(n0,n13)(pl);
  tlip.u := tlip.u cutafter (subpath (0,20) of tlip.l) cutbefore tlip.l;

  draw tout; draw tlip.l; draw tlip.u;
  shipmulti(20);
endmulti;

% The genus 2 surface
r3 = r1+r2;  % Displacement between the two centers
r4 = 0.6r1;  % Width of "neck" of the surface
r5 = 1.2r2;  % Height of the surface at the center; not very visible
beginmulti;
  path p[], p[]t;
  p0 = (-r3-r2-r1,0)..(-r3,r2+r1)..(0,r4)..(r3,r2+r1)..
         (r3+r2+r1,0)..(r3,-r2-r1)..(0,-r4)..(-r3,-r2-r1)..cycle;
  p0t = p0 transformed XY;
  p1 = (-r3+r1-r2,0)..(0,r5)..(r3-r1+r2,0)..(0,-r5)..cycle;
  p1t = p1 transformed XZ;
  p2 = (-r4,0)..(0,r5)..(r4,0)..(0,-r5)..cycle;
  p2t = p2 transformed YZ;
  p3 = fullcircle scaled (2*r2) shifted (-r3-r1,0);
  p4 = fullcircle scaled (2*r2) shifted (r3+r1,0);
  p3t = p3 transformed XZ; p4t = p4 transformed XZ;
  p5 = fullcircle scaled (2*r2) shifted (-r1,0);
  p6 = fullcircle scaled (2*r2) shifted (r1,0);
  p5t = p5 transformed YZ shifted (-r3*f.x); p6t = p6 transformed YZ shifted (-r3*f.x);
  p7t = p5 transformed YZ shifted (r3*f.x); p8t = p6 transformed YZ shifted (r3*f.x);
  p10 = tangent(p3t,f.y)..tension 0.98..tangent(p5t,f.x)..
	 tangent(reverse p2t,f.x)..
         tangent(p7t,f.x)..tension 1.07..tangent(p4t,-f.y)..
	 tension0.98..tangent(p8t,-f.x)..
	 tangent(reverse p2t,-f.x)..tangent(p6t,-f.x)..tension1.07..cycle;
%  p11 = tangent(

  transform X[]Z;
  for i = -10 upto 10: X[i]Z = Zframe(i*9); endfor

  draw p10;
  draw tlip.l shifted (r3*f.x); draw tlip.u shifted (r3*f.x);
  draw tlip.l shifted (-r3*f.x); draw tlip.u shifted (-r3*f.x);
  shipmulti(30);

  draw p10;
  draw tlip.l shifted (r3*f.x); draw tlip.u shifted (r3*f.x);
  draw tlip.l shifted (-r3*f.x); draw tlip.u shifted (-r3*f.x);
  drawoptions (withcolor backcolor);
  draw p2t cutafter subpath(5,7) of p10;
    draw cuttings cutafter subpath(1,3) of p10 dashed hiddendash;
    draw cuttings;
  shipmulti(31);

  r6 = 6u;
  p12 = p2t shifted (r6*f.x); p13 = p10 shifted (r6*f.x);
  draw subpath(-2,2) of p10; draw subpath(2,6) of p13;
  draw tlip.l shifted (-r3*f.x); draw tlip.u shifted (-r3*f.x);
  draw tlip.l shifted ((r3+r6)*f.x); draw tlip.u shifted ((r3+r6)*f.x);
  draw point 2 of p10--point 2 of p13;
  draw point 6 of p10--point 6 of p13;
  drawoptions (withcolor backcolor);
  draw p2t cutafter subpath(5,7) of p10;
    draw cuttings cutafter subpath(1,3) of p10 dashed hiddendash;
    draw cuttings;
  draw p12 cutafter subpath(5,7) of p13;
    draw cuttings cutafter subpath(1,3) of p13 dashed hiddendash;
    draw cuttings;
  shipmulti(32);
endmulti;
end
