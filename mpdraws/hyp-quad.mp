% Figures in the hyperbolic plane, disk model
input macros;

u = 2.5cm;
r = 2u;

path hp_boundary; hp_boundary = fullcircle scaled 2r;

def bdy_pt(expr a) = (r*dir a) enddef;

def hp_geodesic_ideal(expr a, b) =
  bdy_pt(a){dir (180+a)}..{dir b}bdy_pt(b);
enddef;

def hp_horo(expr a, rad) =
  fullcircle scaled (2*u*rad) rotated a shifted ((r-u*rad)*dir a);
enddef;

vardef poincare_klein(expr t) = 2 / (1+t*t) enddef;
vardef klein_poincare(expr s) =
  if s < 0.0001:
    1/2 % Don't divide by 0
  else:
    (1-sqrt(1-s*s))/(s*s)
  fi
enddef;

vardef hp_geodesic(expr p, q) =
  save a, b, c, d;
  pair a,b,c,d;
  a = p * poincare_klein(abs(p)/r); b = q * poincare_klein(abs(q)/r);
  c = 0.5[a,b]; d = c * klein_poincare(abs(c)/r);
  p .. d .. q
enddef;

beginfig(0);
  z0 = origin;
  z1 = 0.5*r*dir(-45);
  z2 = 0.7*r*dir(55);
  z3 = -z1;
  z4 = -z2;

  draw hp_boundary;
  draw hp_geodesic(z1,z2);
  draw hp_geodesic(z2,z3);
  draw hp_geodesic(z3,z4);
  draw hp_geodesic(z4,z1);
  draw hp_geodesic(z1,z3);
  draw hp_geodesic(z2,z4);
  pickup vertexmarker;
  draw z0; texlabel.rt("$O$", z0);
  draw z1; texlabel.rt("$X$", z1);
  draw z2; texlabel.rt("$Y$", z2);
  draw z3; texlabel.lft("$Z$", z3);
  draw z4; texlabel.lft("$W$", z4);
endfig;

end
