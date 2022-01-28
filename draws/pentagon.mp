input macros;

beginmulti;
  u := 1.3cm;
  path p[];

  for i = 0 upto 5:
    z[i] = u*dir (90-72*i);
  endfor

  draw z0--z1--z2--z3--z4--cycle;
  draw z3--z0--z2;
  picture lab[]; lab1 = textext("$1$");
  label.urt(lab1,0.5[z0,z1]);
  label.lrt(lab1,0.5[z1,z2]);
  label.bot(lab1,0.5[z2,z3]);
  label.llft(lab1,0.5[z3,z4]);
  label.ulft(lab1,0.5[z4,z0]);
  label.lft(textext("$x_1$"),0.5[z0,z3]);
  label.rt(textext("$x_0$"),0.5[z0,z2]);
  shipmulti(0);

  draw (z0--z1--z2--z3--z4--cycle) dashed evenly;
  draw z0--z2; draw z1--z3;
  label.urt(textext("$x_0$"), 0.4[z0,z2]);
  label.lrt(textext("$x_2$"), 0.3[z3,z1]);
  shipmulti(1);

  draw (z0--z1--z2--z3--z4--cycle) dashed evenly;
  p0 = z0{z2-z0}..{z3-z1}z3;
  p1 = z1{z3-z1}..{z2-z0}z2;
  draw p0; draw p1;
  label.lft(textext("$x_1$"), point 0.5 of p0);
  label.lft(lab1, point 0.5 of p1);
  shipmulti(2);

  draw (z0--z1--z2--z3--z4--cycle) dashed evenly;
  p2 = z0{z2-z0}..{z1-z3}z1;
  p3 = z3{z1-z3}..{z2-z0}z2;
  draw p2; draw p3;
  label.llft(lab1, point 0.5 of p2);
  label.top(lab1, point 0.5 of p3);
  shipmulti(3);
endmulti;

end