input macros;

color fill_color;
fill_color = 0.9white;

u = 1cm;

def h = isopt enddef;

% Hex torus, with generating set Delta
beginfig(0);
  z0 = origin; z1 = isopt(2u,0u,0u); z2 = isopt(0u,2u,0u); z3 = isopt(2u,2u,0u);

  fill z0--z1--z3--z2--cycle withcolor fill_color;
  pickup vertexmarker;
  for i=0 upto 3: draw z[i]; endfor
  path p[];
  p0 = z0--z1; p1 = z2--z3; p2 = z0--z2; p3 = z1--z3; p4 = z3--z0;
  pickup defaultpen;
  draw p0; mark_dir(p0, 0.5); texlabel.bot("$\vec a$", point 0.5 of p0);
  draw p1; mark_dir(p1, 0.5); texlabel.top("$\vec a$", point 0.5 of p1);
  draw p2; mark_dir(p2, 0.5); texlabel.llft("$\vec b$", point 0.5 of p2);
  draw p3; mark_dir(p3, 0.5); texlabel.urt("$\vec b$", point 0.5 of p3);
  draw p4; mark_dir(p4, 0.5); texlabel.lrt("$\vec c$", point 0.5 of p4);
endfig;

def repeatchar(expr c, n) =
  if n = 0: ""
  else:
    c for i = 2 upto n: & c endfor
  fi
enddef;

beginmulti;
path hex[];
def hexpath(expr r) = h(r,0,0)--h(0,0,-r)--h(0,r,0)--h(-r,0,0)--h(0,0,r)--h(0,-r,0)--cycle enddef;
hex0 = hexpath(0.5u);
hex1 = hexpath(1.5u);
hex2 = hexpath(2.5u);

% Lengths wrt Delta
fill hex2 withcolor 0.9[darkgreen,white];
fill hex1 withcolor 0.7[darkgreen,white];
fill hex0 withcolor 0.5[darkgreen,white];
texlabel("0", h(0u,0u,0u));
for i = 1 upto 2:
  for j = 0 upto 2:
    texlabel(decimal(i+j), h(i*u,j*u,0u));
    texlabel(decimal(i+j), h(0u,i*u,j*u));
    texlabel(decimal(i+j), h(j*u,0u,i*u));
  endfor
endfor
drawoptions(withcolor darkred);
for i = 1 upto 2:
  for j = 0 upto 2:
    texlabel("$\scriptstyle " & repeatchar("a", i) & repeatchar("b", j) & "$", h(i*u,j*u,0u) - (0,0.3u));
    texlabel("$\scriptstyle " & repeatchar("b", i) & repeatchar("c", j) & "$", h(0u,i*u,j*u) - (0,0.3u));
    texlabel("$\scriptstyle " & repeatchar("c", i) & repeatchar("a", j) & "$", h(j*u,0u,i*u) - (0,0.3u));
  endfor
endfor
shipmulti(10);
endmulti;

u := 0.8cm;

beginmulti;
path hex[];
def hexpath(expr r) = h(r,0,0)--h(0,0,-r)--h(0,r,0)--h(-r,0,0)--h(0,0,r)--h(0,-r,0)--cycle enddef;
hex0 = hexpath(0.5u);
hex1 = hexpath(1.5u);
hex2 = hexpath(2.5u);

% Intersection with $[a]$
fill hex2 withcolor 0.9[blue,white];
fill hex1 withcolor 0.7[blue,white];
fill hex0 withcolor 0.5[blue,white];
texlabel("0", h(0u,0u,0u));
for i = 0 upto 2:
  for j = 0 upto 2:
    for k = 0 upto 2:
      if max(i,j,k) = 2:
	texlabel("$\scriptsize " & decimal(max(k-j,0)) & "$", h(i*u,j*u,k*u));
      fi
    endfor
  endfor
endfor
shipmulti(11);

% Intersection with $[aC]$
fill hex2 withcolor 0.9[red,white];
fill hex1 withcolor 0.7[red,white];
fill hex0 withcolor 0.5[red,white];
texlabel("0", h(0u,0u,0u));
for i = 0 upto 2:
  for j = 0 upto 2:
    for k = 0 upto 2:
      if max(i,j,k) = 2:
	texlabel("$\scriptsize " & decimal(max(i+k-2j,0)) & "$", h(i*u,j*u,k*u));
      fi
    endfor
  endfor
endfor
shipmulti(12);

% Intersection with $[aaC]$
fill hex2 withcolor 0.9[orange,white];
fill hex1 withcolor 0.7[orange,white];
fill hex0 withcolor 0.5[orange,white];
texlabel("0", h(0u,0u,0u));
for i = 0 upto 2:
  for j = 0 upto 2:
    for k = 0 upto 2:
      if max(i,j,k) = 2:
	texlabel("$\scriptsize " & decimal(max(i+2k-3j,0)) & "$", h(i*u,j*u,k*u));
      fi
    endfor
  endfor
endfor
shipmulti(13);

% Intersection with $[aaaC]$
fill hex2 withcolor 0.9[darkyellow,white];
fill hex1 withcolor 0.7[darkyellow,white];
fill hex0 withcolor 0.5[darkyellow,white];
texlabel("0", h(0u,0u,0u));
for i = 0 upto 2:
  for j = 0 upto 2:
    for k = 0 upto 2:
      if max(i,j,k) = 2:
	texlabel("$\scriptsize " & decimal(max(i+3k-4j,0)) & "$", h(i*u,j*u,k*u));
      fi
    endfor
  endfor
endfor
shipmulti(14);

endmulti;

end
