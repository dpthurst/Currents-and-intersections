% These magic incantations, from CONTEXT's mp-tool.mp, guarantee that
% we produce EPS files that have HiResBoundingBoxes and include the
% correct fonts.

prologues := 2; % EPSF, grab the fonts from the environment
% prologues := 3; % Include the fonts in output file, for previewing
outputtemplate := "%j-%c.mps";
% outputformat := "svg"; % SVG output for the web, etc.

numeric dimamount; dimamount := 0.22;

string space ; space = char 32 ; 

vardef ddecimal primary p =
  decimal xpart p & " " & decimal ypart p
enddef ;

extra_endfig := extra_endfig
  & "special "
       & "("
       & ditto
       & "%%HiResBoundingBox: "
       & ditto
       & "&ddecimal llcorner currentpicture"
       & "&space"
       & "&ddecimal urcorner currentpicture"
       & ");";

% Don't add margin when calculating bbox
bboxmargin := 0bp;

% ----------------------------------------
% Use the latexMP package from CTAN
% http://www.ctan.org/tex-archive/graphics/metapost/contrib/macros/latexmp/
input latexmp;
setupLaTeXMP(class="amsart",
	     fontencoding="T1",
	     textextlabel=enable);

% A version of textext that does no centering
def textextraw(expr s)=
  begingroup;
    save pic ;  picture pic ;
    latexmp_counter:= latexmp_counter+1 ;
    getpicture_latexmp ;
    addstring_latexmp(s) ;
    pic
  endgroup
enddef;

% Convenient TeX labeling
vardef texlabel@#(expr s, p) =
  label@#(textext(s), p)
enddef;

% ----------------------------------------
% Colors
color darkgreen, darkred, darkblue, purple;
darkgreen = 0.6[black,0.1[green,blue]];
darkred = 0.7[black,red];
darkblue = 0.8[black,blue];
purple = (0.8,0.17,0.68);
% IU colors
color IUcrimson, IUcream, IUoldgold, IUmidnight, IUmint, IUlimestone, IUmajestic;
IUcrimson = (125, 17, 12)/256;
IUcream = (225, 216, 183)/256;
IUoldgold = (197, 146, 23)/256;
IUmidnight = (68, 105, 125)/256;
IUmint = (154, 220, 198)/256;
IUlimestone = (174, 167, 159)/256;
IUmajestic = (75,48,106)/256;

% ----------------------------------------
% Basic math
def log(expr v) = (mlog(v)/256) enddef;
def exp(expr v) = mexp(v*256) enddef;
def sin(expr v) = sind(v*360/2*pi) enddef;
def cos(expr v) = cosd(v*360/2*pi) enddef;
def asind(expr v) = angle((sqrt(1-v*v),v)) enddef;
def acosd(expr v) = angle((v,sqrt(1-v*v))) enddef;
def asin(expr v) = (asind(v)*2*pi/360) enddef;
def acos(expr v) = (acosd(v)*2*pi/360) enddef;
pi = 3.1415926535897932384;

% ----------------------------------------
% Dealing with boxes
def boxheight(expr p) = ypart(urcorner(p) - lrcorner(p)) enddef;
def boxwidth(expr p) = xpart(urcorner(p) - ulcorner(p)) enddef;
def centerbox(expr p) = (p shifted (-(urcorner(p) + llcorner(p))/2)) enddef;

% ----------------------------------------
% Standard pens
newinternal thickvertex;
pickup pencircle scaled 4.5bp;
thickvertex := savepen;

newinternal vertexmarker;
pickup pencircle scaled 3bp;
vertexmarker := savepen;

newinternal thickpen;
pickup pencircle scaled 1bp;
thickpen := savepen;

newinternal thinpen;
pickup pencircle scaled 0.2bp;
thinpen := savepen;

newinternal gridpen;
pickup pencircle scaled 0.4bp;
gridpen := savepen;

pickup pencircle scaled 0.7bp;
defaultpen := savepen;

newinternal pentmp;

% ----------------------------------------
% Standard dashes
picture stddash;

stddash = dashpattern(on 0.75 off 2.5 on 0.75);

% ----------------------------------------
% For dimming the figure
numeric dimamount, curdim; dimamount = 0.15; curdim = 1;

def dim = curdim := dimamount;
enddef;
def undim = curdim := 1;
enddef;
def dimmed(expr c) = curdim[white,c] enddef;

% ----------------------------------------
% Save the output figures
picture outpicture[];
def shipit =
  outpicture[charcode] := currentpicture;
  shipout currentpicture
enddef;

% ----------------------------------------
% For multiple figures sharing some points
def beginmulti =
  begingroup
  clearxy; clearit; clearpen;
  pickup defaultpen;
  curdim := 1;
  drawoptions(withcolor curdim[white,black]);
enddef;

def shipmulti(expr c) =
  charcode := c;
  shipit;
  clearit;
  curdim := 1;
  drawoptions(withcolor curdim[white,black]);
  pickup defaultpen;
enddef;

def endmulti =
  endgroup
enddef;

% ----------------------------------------
% For drawing on a triangular grid

transform iso;

origin transformed iso = origin;
(1,0) transformed iso = (1,0);
(0,1) transformed iso = dir 120;

def isopt(expr x, y, z) = (((x,0) + (0,y) - (z,z)) transformed iso) enddef;

% ----------------------------------------
% Handy for drawing paths through a tiling.

def smooth_path(expr p) =
  begingroup
    save i;
    point 0 of p..
      for i = 1 upto length p:
        0.5[point (i-1) of p, point i of p]{(point i of p)-(point (i-1) of p)}..
      endfor
      point infinity of p
  endgroup;
enddef;

def smooth_path_alt(expr p) =
  begingroup
    save i;
    point 0 of p..
      for i = 1 upto length p:
        0.5[point (i-1) of p, point i of p]..
      endfor
      point infinity of p
  endgroup;
enddef;

% ----------------------------------------
% Drawing curved along a path

def curve_path(expr p, curve, d) =
  begingroup
    save c, t, s;
    s := arclength (subpath (0,d) of curve);
    def c(expr pos) =
      begingroup
        t := arctime (xpart(pos)+s) of curve;
        ((point t of curve) + ypart(pos)*unitvector (direction t of curve)
	    rotated 90)
      endgroup
    enddef;

    c(point 0 of p)
    for i = 0 step 1 until (length p-1):
      ..controls c(postcontrol i of p) and c(precontrol (i+1) of p)
      ..c(point (i+1) of p)
    endfor
  endgroup
enddef;

% ----------------------------------------
% Marking the orientations of strands

numeric a_l, a_w;
a_l = 0.2cm; a_w = 0.1cm;

def mark_dir(expr curve, d) =
  draw curve_path((-a_l/2,a_w)--(a_l/2,0)--(-a_l/2,-a_w), curve, d);
enddef;

def mark_rdir(expr curve, d) =
  mark_dir(reverse curve, length curve - d);
enddef;

def mark_arrow(expr curve) =
  draw curve_path((-a_l,a_w)--(0,0)--(-a_l,-a_w), curve, length curve);
enddef;

def mark_ddir(expr curve, d) =
  draw curve_path((-a_l,a_w)--(0,0)--(-a_l,-a_w), curve, d);
  draw curve_path((0,a_w)--(a_l,0)--(0,-a_w), curve, d);
enddef;

def mark_bdir(expr curve, d) =
  draw curve_path((-0.75a_l,a_w)--(-0.75a_l,-a_w), curve, d);
  draw curve_path((-0.25a_l,a_w)--(0.75a_l,0)--(-0.25a_l,-a_w), curve, d);
enddef;

def mark_bddir(expr curve, d) =
  draw curve_path((-1.25a_l,a_w)--(-1.25a_l,-a_w), curve, d);
  draw curve_path((-0.75a_l,a_w)--(0.25a_l,0)--(-0.75a_l,-a_w), curve, d);
  draw curve_path((0.25a_l,a_w)--(1.25a_l,0)--(0.25a_l,-a_w), curve, d);
enddef;

def mark_X(expr curve, d) =
  draw curve_path((-a_w,-a_w)--(a_w,a_w), curve, d);
  draw curve_path((a_w,-a_w)--(-a_w,a_w), curve, d);
enddef;

% ----------------------------------------
% Making a grid

def make_grid(expr x_min, x_step, x_max, y_min, y_step, y_max) =
  begingroup
    save i;
    pickup gridpen;
    for i = x_min step x_step until x_max:
      draw (i,y_min)--(i,y_max);
    endfor
    for i = y_min step y_step until y_max:
      draw (x_min,i)--(x_max,i);
    endfor
  endgroup
enddef;

% ------------------------------------------------------------
% Filling a region with hashes
picture hashes;
hashspace := .15cm;
hashang := 45;
hashsz := 80;
for i = -hashsz upto hashsz:
  draw (((-hashsz*hashspace*dir hashang)..(hashsz*hashspace*dir hashang)) shifted (i*hashspace*dir (hashang+90)));
endfor
hashes := currentpicture; clearit;

vardef hash_fill(text t) =
  begingroup
    save ptmp, picttmp; path ptmp; picture picttmp;
    for ptmp=t:
      picttmp := hashes; clip picttmp to ptmp; draw picttmp;
    endfor
  endgroup
enddef;

% ------------------------------------------------------------
% Tangent to a curve in a given direction
def tangent(expr p, ang) =
  (directionpoint ang of p){ang}
enddef;

def revtang(expr p, ang) =
  (directionpoint (-ang) of p){ang}
enddef;

def tangentp(expr p, pt) =
  (point pt of p){direction pt of p}
enddef;

def revtangp(expr p, pt) =
  (point pt of p){-direction pt of p}
enddef;

% Subpath between given tangent directions
def tangpath(expr p, anga, angb) =
  subpath (directiontime anga of p, directiontime angb of p) of p
enddef;

% -------------------------------------------------------------------------
% Make a crossing: pover passing over punder

numeric crossing_width, crossing_length;
crossing_width = 5bp;
crossing_length = .5bp;

def make_crossing(expr pover, punder) =
  begingroup
    save t, d; numeric t[], t[]a, t[]b, d[];
    pentmp := savepen;
    (t1, t2) = pover intersectiontimes punder;
    d1 = arclength subpath (0,t1) of pover;
    t1a := arctime d1+crossing_length of pover;
    t1b := arctime d1-crossing_length of pover;
    pickup pencircle scaled 2crossing_width;
    undraw subpath (t1a, t1b) of pover;
    t1a := arctime d1+crossing_length+3crossing_width of pover;
    t1b := arctime d1-crossing_length-3crossing_width of pover;
    pickup pentmp;
    draw subpath (t1a, t1b) of pover;
  endgroup
enddef;

% ------------------------------------------------------------
% Mark a set of vertices, preserving the pen
def mark_vertices(text t) =
  pentmp := savepen;
  pickup vertexmarker;
  forsuffixes $=t:
    draw $;
  endfor
  pickup pentmp;
enddef;

% ------------------------------------------------------------
% Draw something on a white background
% Useful for a region filled with hashes
def clear_draw(expr p) =
  begingroup
    save p1, p2;
    picture p1, p2;
    p1 := currentpicture;
    clearit();
    unfill bbox p;
    draw p;
    p2 := currentpicture;
    currentpicture := p1;
    p2
  endgroup
enddef;

% ------------------------------------------------------------
% Shifting a path by a given amount
tertiarydef p shift_cycle disp =
  for i = .1 step .2 until length p:
    (point i of p + disp*(unitvector direction i of p) rotated 90)..
  endfor cycle
enddef;

tertiarydef p shift_arc disp =
  (point 0 of p + disp*(unitvector direction 0 of p) rotated 90)
  for i = 1/4 step 1/4 until length p:
    ..(point i of p + disp*(unitvector direction i of p) rotated 90)
  endfor
enddef;

% ------------------------------------------------------------
% Mark the measurement of a given segment
numeric measure_disp; measure_disp = 5pt;
vardef mark_measure@#(expr lab, p) =
  begingroup;
    save q; path q;
    q = p shift_arc measure_disp;
    drawdblarrow q;
    label@#(lab, point 0.5[0,length q] of q);
  endgroup;
enddef;
  
% ------------------------------------------------------------
% Functions for drawing cusps of Legendrian knots (special for talk)
% Expecting a length scale 'u' to be defined
def ne_cusp(expr pt) = (((-.8u,0){dir 0}..{dir 45}(.4u,.4u){dir -135}..{dir -90}(0,-.8u)) shifted pt) enddef;
def en_cusp(expr pt) = (reverse ne_cusp(pt)) enddef;
def sw_cusp(expr pt) = (ne_cusp(origin) scaled -1 shifted pt) enddef;
def ws_cusp(expr pt) = (reverse sw_cusp(pt)) enddef;

def nw_smooth(expr pt) = (((.8u,0){dir 180}..(.2u,-.2u)..{dir -90}(0,-.8u)) shifted pt) enddef;
def wn_smooth(expr pt) = (reverse nw_smooth(pt)) enddef;
def se_smooth(expr pt) = (nw_smooth(origin) scaled -1 shifted pt) enddef;
def es_smooth(expr pt) = (reverse se_smooth(pt)) enddef;

% ------------------------------------------------------------
% Marking twists in edges
% Needs to be cleaned up
numeric s_l, s_w;
s_l = 0.15cm; s_w = 0.15cm;

def pos_twist(expr p, d) =
  begingroup
    save t;
    clearxy;
    for i = -2,-1,0,1,2:
      t := arctime (d+i*s_l/2) of p;
      z[i] = point t of p;
      z[i]tan = direction t of p;
    endfor
    for i = -2,-1:
      z[i]a = z[i] + s_w/2*unitvector (z[i]tan rotated 90);
    endfor
    for i = 1,2:
      z[i]a = z[i] + s_w/2*unitvector (z[i]tan rotated -90);
    endfor
    draw subpath (0, arctime (d-s_l/2) of p) of p;
    draw subpath (arctime(d+s_l/2) of p, length(p)) of p;
    draw z[-2]a---z[-1]a..z[0]..z[1]a---z[2]a
  endgroup
enddef;

def ptwist(expr p) =
  pos_twist(p, (arclength p)/2)
enddef;

def neg_twist(expr p, d) =
  begingroup
    save t;
    clearxy;
    for i = -2,-1,0,1,2:
      t := arctime (d+i*s_l/2) of p;
      z[i] = point t of p;
      z[i]tan = direction t of p;
    endfor
    for i = -2,-1:
      z[i]a = z[i] + s_w/2*unitvector (z[i]tan rotated -90);
    endfor
    for i = 1,2:
      z[i]a = z[i] + s_w/2*unitvector (z[i]tan rotated +90);
    endfor
    draw subpath (0, arctime (d-s_l/2) of p) of p;
    draw subpath (arctime(d+s_l/2) of p, length(p)) of p;
    draw z[-2]a---z[-1]a..z[0]..z[1]a---z[2]a
  endgroup
enddef;

def ntwist(expr p) =
  neg_twist(p, (arclength p)/2)
enddef;
