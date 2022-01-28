input macros;

beginmulti;
  numeric n[];
  numeric u,v;

  u = 0.25cm; v = u/3;

  n0 = -2; n1 = 6;
  y[2] = 1v; y[3] = 1v;
  for i = 4 upto n1:
    y[i] = (2+3*(i-4))*v;
  endfor
  for i = n0 upto 1:
    y[i] = (3+3*(1-i))*v;
  endfor
  for i = n0 upto n1:
    x[i] = i*u;
  endfor;
  z10 = (z[n0]--20[z[n0],z[n0+1]]) intersectionpoint (20[z[n1],z[n1-1]]--z[n1]);

  draw z[-2]--z[-1]--z0--z1--z2--z3--z4--z5--z6;
  drawdblarrow ((n0-1)*u,0)--((n1+1)*u,0);
  drawarrow origin--(0,21v);
  label.bot(textext("$n$"), (n1*u,0));
  label.rt(textext("$i(A^n B, C)$"), (0,18v));
  draw z[n0]--z10--z[n1] dashed evenly;
  pickup vertexmarker;
  for i = -2 upto 6:
    draw z[i];
  endfor
  shipmulti(0);
endmulti;

end