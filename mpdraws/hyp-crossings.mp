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
acol = bcol = darkgreen;
abcol = bacol = darkred;
aBcol = Bacol = darkblue;

def draw_geodesic(expr col, lab, in, out) =
 drawoptions (withcolor col);
 draw hp_geodesic(in, out);
 pickup vertexmarker; draw bdy_pt(in); draw bdy_pt(out);
 pickup defaultpen;
 texlabel("$" & lab & "^-$", bdy_pt(in) + (7pt+labeloffset)*dir in);
 texlabel("$" & lab & "^+$", bdy_pt(out) + (7pt+labeloffset)*dir out);
enddef;

beginmulti;
draw hp_boundary;
draw_geodesic(acol, "a", -135, 45);
draw_geodesic(bcol, "b", -45, 135);
draw_geodesic(abcol, "(ab)", -60, 60);
draw_geodesic(bacol, "(ba)", -120, 120);
draw_geodesic(aBcol, "(aB)", 150, 30);
draw_geodesic(Bacol, "(Ba)", -150, -30);
shipmulti(0);

endmulti;

end
