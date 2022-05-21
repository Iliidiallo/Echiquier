#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
#include "glass.inc"
#include "metals.inc"
#include "functions.inc"
#include "stones1.inc"
#include "skies.inc"

#declare scal=6;

camera {
          location <7*scal,2,4*scal>
          look_at <0,0,0>
          sky   <0,0,1>
          right <-image_width/image_height,0,0>

        }

     light_source { <-17, 0, 0> color Magenta }
     light_source { <0, 0, 0> color White }
     light_source { <0, 0, 0> color rgb <0.75,0.5,0.59>spotlight radius 2 falloff 10 tightness 10 point_at <10,0,0>}
     light_source { <0 , 10 , 0 > color  rgb <0.5,0.5,0.49>}
     light_source { <10 , 10 , 10 > color  rgb <0.825,0.5,0.9>}
     light_source { <15 , 15 , -15 > color Red }
     light_source { <15 , 15 , 0 > color Green }
     light_source { <15 , -15 , 15 > color rgb <0.5,0.25,0.49>}

//background {White}

global_settings{
  max_trace_level 60//32*3
  ambient_light 1.00
  assumed_gamma 2.0
}
 /*plane {
        <0,0,-2> 150
        pigment{brick
        Red
        Black
        mortar 5
        brick_size 15
        }
      }
*/

#if (ciel)
    sky_sphere {S_Cloud5 rotate <90,0.051, 1>}
#end


#macro Pion(posi,coule)
#local IsoFinish=finish{
    ambient 0.1
    diffuse 0.1 }

    #local P0=<1,0.5>;
    #local P1=<4.5,0>;
    #local P2=<4.5,0.5>;
    #local P3=<4.5,1.9>;
    #local P4=<2.2,1.9>;
    #local P5=<1.5,8>;
    #local P6=<1,8.5>;
    #local P7=<4.1,8.8>;
    #local P8=<1.9,8.9>;
    #local P9=<2.3,8.6>;
    #local P10=<4,11>;
    #local P11=<0.2,14>;
union {
    lathe {
    bezier_spline
    4,
    P0 P1 P2 P2
    //pigment { color coule }
    translate posi
    }
    lathe {
    bezier_spline
    4,
    P2 P3 P4 P5
    //pigment { color coule }
    translate posi
    }

    lathe {
    bezier_spline
    4,
    P5 P6 P7 P8
  //  pigment { color coule }
    translate posi
    }
    lathe {
    bezier_spline
    4,
    P8 P9 P10 P11
    //pigment { color coule }
    translate posi
    //rotate<180,0,0>
    }
    texture{
                   pigment{
                     color coule}
                     finish{
                     IsoFinish }
                     }

    pigment { color coule}
    //translate posi
    rotate<90,0,0>
    scale 0.2
    translate<-16,0,1>

}
#end // fin macro
