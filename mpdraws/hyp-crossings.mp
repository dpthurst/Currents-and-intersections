% Figures in the hyperbolic plane, disk model
input macros;

u = 1cm;
r = 2u;

path hp_boundary; hp_boundary = fullcircle scaled 2r;

def bdy_pt(expr a) = (r*dir a) enddef;

def hp_geodesic(expr a, b) =
  bdy_pt(a){dir (180+a)}..{dir b}bdy_pt(b);
enddef;

def hp_horo(expr a, rad) =
  fullcircle scaled (2*u*rad) rotated a shifted ((r-u*rad)*dir a);
enddef;

color acol, bcol,abcol,bacol,aBcol,Bacol;
acol = 0.2[darkgreen,black];
bcol = 0.2[darkgreen, white];
abcol = 0.2[darkred,black];
bacol = 0.2[darkred,white];
aBcol = 0.2[darkblue,black];
Bacol = 0.2[darkblue,white];

def draw_geodesic(expr col, lab, in, out, mark) =
  begingroup
    save p; path p;
    drawoptions (withcolor col);
    p = hp_geodesic(in,out);
    draw p; mark_dir(p, mark);
    pickup vertexmarker; draw bdy_pt(in); draw bdy_pt(out);
    pickup defaultpen;
    texlabelang(in,"$" & lab & "^-$", bdy_pt(in));
    texlabelang(out,"$" & lab & "^+$", bdy_pt(out));
    drawoptions();
  endgroup
enddef;

beginmulti;
path p[];
draw hp_boundary;
draw_geodesic(acol, "a", -135, 45, 0.4);
draw_geodesic(bcol, "b", -45, 135, 0.4);
draw_geodesic(abcol, "(ab)", -67, 65, 0.5);
draw_geodesic(bacol, "(ba)", -122, 118, 0.5);
draw_geodesic(aBcol, "(aB)", 155, 30, 0.5);
draw_geodesic(Bacol, "(Ba)", -160, -30, 0.5);
p0 = subpath (0.1,0.9) of (bdy_pt(-122){dir 5}..{dir -15}(bdy_pt(-67)));
p1 = subpath (0.1,0.9) of (bdy_pt(-67){dir (180+45)}..{dir (180-55)}bdy_pt(-122));
p2 = subpath (0.1,0.9) of (bdy_pt(-30){dir 100}..{dir 75}bdy_pt(30));
p3 = subpath (0.1,0.9) of (bdy_pt(-30){dir 40}..{dir 135}bdy_pt(30));
p4 = reverse subpath (0.1,0.9) of (bdy_pt(65){dir (180+10)}..{dir (180-10)}bdy_pt(118));
p5 = subpath (0.1,0.9) of (bdy_pt(65){dir (180-50)}..{dir (180+50)}bdy_pt(118));
p6 = reverse subpath (0.1,0.9) of (bdy_pt(155){dir -80}..{dir -100}bdy_pt(-160));
p7 = reverse subpath (0.1,0.9) of (bdy_pt(155){dir -135}..{dir -45}bdy_pt(-160));
drawoptions (withcolor acol);
draw p0; mark_arrow(p0); texlabel.top("$a$", point 0.5 of p0);
draw p2; mark_arrow(p2); texlabel.lft("$a$", point 0.5 of p2);
draw p4; mark_arrow(p4); texlabel.bot("$a$", point 0.5 of p4);
draw p6; mark_arrow(p6); texlabel.rt("$a$", point 0.5 of p6);
drawoptions (withcolor bcol);
draw p1; mark_arrow(p1); texlabel.bot("$b$", point 0.5 of p1);
draw p3; mark_arrow(p3); texlabel.rt("$b$", point 0.5 of p3);
draw p5; mark_arrow(p5); texlabel.top("$b$", point 0.5 of p5);
draw p7; mark_arrow(p7); texlabel.lft("$b$", point 0.5 of p7);
shipmulti(0);

endmulti;

end
