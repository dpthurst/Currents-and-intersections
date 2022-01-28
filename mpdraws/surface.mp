input macros;

u := 1.3in;

beginmulti;
path p[]; pair t[], t[]a,t[]b, t[]c, t[]d;
z0 = (-2u, 0u);
z1 = (-0.9u, 0.85u);
z2 = (0u, 0.65u);
z3 = (-x1, y1);
z4 = (-x0, 0u);
z5 = (x3, -y3);
z6 = (x2, -y2);
z7 = (x1, -y1);
p0 = z0 .. z1 .. z2 .. z3 .. z4 .. z5 .. z6 .. z7 .. cycle;

z10 = (-1.4u,-0.12u);
z11 = (-0.95u,0.09u);
z12 = (2*x11-x10,y10);
z13 = (x12,-y10);
z14 = (x11,-y11);
z15 = (x10,-y10);
ang10 = 60;
p10 = z10{dir ang10}..z11..{dir -ang10}z12{dir (180-ang10)}..{dir ang10}z13{dir (180+ang10)}..z14..{dir (180-ang10)}z15{dir -ang10}..{dir (180+ang10)}cycle;
p11 = subpath(3,5) of p10;
p12 = (subpath(-1,3) of p10) cutafter (subpath(4,4.9) of p10);
p13 = cuttings cutafter (subpath(3.1,5) of p10);
p14 = cuttings;

for i = 0 upto 4:
  p[15+i] = p[10+i] reflectedabout (z2,z6);
endfor

z20 = (-0.13u,0u);
z21 = point 2 of p0; t21 = direction 2 of p0;
z22 = (-x20,-y20);
z23 = point 6 of p0; t23 = direction 6 of p0;
p20 = z20..tension 2.2..z21{t21}..tension 2.2..z22..tension 2.2..z23{t23}..tension 2.2..cycle;
p21 = subpath(-1,1) of p20;
p22 = subpath(1,3) of p20;
z20a = point 0.5 of p20; t20a = -direction 0.5 of p20;
z20b = point 3.5 of p20; t20b = -direction 3.5 of p20;
z20c = point 2.5 of p20; t20c = -direction 2.5 of p20;
z20d = point 1.5 of p20; t20d = -direction 1.5 of p20;


z30 = point 3.25 of p10; t30 = -direction 3.25 of p10;
z31 = (0u,0.1u);
z32 = point 3.25 of p15; t32 = direction 3.25 of p15;
z33 = -z30; t33 = -t30;
z34 = -z31;
z35 = -z32; t35 = -t32;
p30 = z30{t30}...z31...z32{t32}...z33{t33}...z34...z35{t35}...cycle;

z40 = point 3.15 of p10; t40 = -direction 3.15 of p10;
z41 = point 1.9 of p0; t41 = -direction 1.9 of p0;
z41a = z20a + (-0.08u,0u);
z41b = z20b + (-0.06u,0u);
z42 = point 6.05 of p0; t42 = -direction 6.05 of p0;
z42c = z20c + (-0.03u,0u);
z42d = z20d + (-0.015u,0u);
z43 = point 2 of p0; t43 = -direction 2 of p0;
z43a = z20a + (0.015u,0u);
z43b = z20b + (0.03u,0u);
z44 = point 5.95 of p0; t44 = -direction 5.95 of p0;
z44c = z20c + (0.06u,0u);
z44d = z20d + (0.09u,0u);
z45 = point 2.1 of p0; t45 = -direction 2.1 of p0;
z46 = point 1.75 of p15; t46 = -direction 1.75 of p15;
z47 = point 3.25 of p15; t47 = -direction 3.25 of p15;
z49 = point 5.9 of p0; t49 = direction 5.9 of p0;
z49b = z20b + (0.08u,0u);
z49a = z20a + (0.06u,0u);
z50 = point 2.05 of p0; t50 = direction 2.05 of p0;
z50d = z20d + (0.03u,0u);
z50c = z20c + (0.015u,0u);
z51 = point 6 of p0; t51 = direction 6 of p0;
z51b = z20b + (-0.015u,0u);
z51a = z20a + (-0.03u,0u);
z52 = point 1.95 of p0; t52 = direction 1.95 of p0;
z53d = z20d + (-0.06u,0u);
z53c = z20c + (-0.08u,0u);
z54 = point 6.1 of p0; t54 = direction 6.1 of p0;
z55 = point 1.85 of p10; t55 = -direction 1.85 of p10;
p40 = z40{t40}..tension 2..z41{t41}
  ..tension 1.5..z41a{t20a}..z41b{t20b}..tension1.5..z42{t42}
  ..tension 1.5..z42c{t20c}..z42d{t20d}..tension1.5..z43{t43}
  ..tension 1.5..z43a{t20a}..z43b{t20b}..tension1.5..z44{t44}
  ..tension1.5..z44c{t20c}..z44d{t20d}..tension1.5..z45{t45}
  ..tension3 and 3..z46{t46}..z47{t47}
  ..tension3 and 2..z49{t49}
  ..tension1.5..z49b{-t20b}..z49a{-t20a}..tension1.5..z50{t50}
  ..tension1.5..z50d{-t20d}..z50c{-t20c}..tension1.5..z51{t51}
  ..tension1.5..z51b{-t20b}..z51a{-t20a}..tension1.5..z52{t52}
  ..tension1.5..z53d{-t20d}..z53c{-t20c}..tension1.5..z54{t54}
  ..tension2..z55{t55}..cycle;

z60 = point 2.6 of p20;
z61 = z60 + (0.1u,-0.005u);
z62 = z60 + (0.2u,0u);
p60 = z60..z61..z62;

draw p0;

draw p11; draw p13;
%draw p12 dashed stddash; draw p14 dashed stddash;
draw p16; draw p18;
%draw p17 dashed stddash; draw p19 dashed stddash;

pickup thickpen;
drawoptions (withcolor darkgreen);
draw p21 dashed stddash;
draw p22;
mark_dir(reverse p22, 1.4);
texlabel.urt("$a$", point 0.6 of p22);
drawoptions();

drawoptions(withcolor darkred);
draw subpath(0,2) of p30;
draw subpath(2,6) of p30 dashed stddash;
mark_dir(p30, 1.45);
texlabel.bot("$b$", point 1.45 of p30);
drawoptions();

pickup thinpen;
drawoptions (withcolor darkblue);
draw p40 dashed stddash;
draw subpath(0,1) of p40;
draw subpath(4,7) of p40;
draw subpath(10,13) of p40;
draw subpath(15,16) of p40;
draw subpath(19,22) of p40;
draw subpath(25,28) of p40;
mark_dir(p40,0.3);
pickup defaultpen
texlabel.ulft("$a^n b$", point 0.3 of p40);
drawoptions();

drawoptions (withcolor purple);
pickup thickpen; draw p60;
texlabel.lrt("$\tau$", point 1.7 of p60);
drawoptions();

shipmulti(0);
endmulti;

end;
