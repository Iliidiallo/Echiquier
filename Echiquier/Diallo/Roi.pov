#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
#include "glass.inc"
#include "metals.inc"
#include "functions.inc"
#include "stones1.inc"
#include "skies.inc"


#declare Pi = 3.1415926535897932384626;
#declare ciel=1;
#declare Font="cyrvetic.ttf"
#declare O3=<0,0,0>;
#declare I=<1,0,0>;
#declare J=<0,1,0>;
#declare K=<0,0,1>;
#declare rCyl=0.025;
#declare rCone=0.075;

#declare sca=3.5;

camera {
location <7*sca,2,2.9*sca>
//location <7*sca,2,15>
//location <7*sca,4*2,4*15>
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

background {White}

global_settings{
  max_trace_level 60//32*3
  ambient_light 1.00
  assumed_gamma 2.0
}


#if (ciel)
    sky_sphere {S_Cloud5 rotate <90,0.051, 1>}
#end


#macro Roi(posi,coule)
  #local IsoFinish=finish{
    ambient 0.1
    diffuse 0.1
    }
        #local P0=<1,0.5>;
        #local P1=<4.5,0>;
        #local P2=<4.5,0.5>;
        #local P3=<4.5,1.9>;
        #local P4=<2.2,1.9>;
        #local P5=<1.5,8>;
        #local P6=<1,8.5>;
        #local P7=<4.1,8.8>;
        #local P8=<1.9,8.9>;

        #local C1=<3.3,9.1>;
        #local C2=<3.3,9.6>;
        #local C3=<2.1,9.5>;
        #local C4=<3.4,10.2>;
        #local C5=<2.1,10.2>;

union {

    union{
        lathe {
        bezier_spline
        4,
        P0 P1 P2 P2
        }
        lathe {
        bezier_spline
        4,
        P2 P3 P4 P5
        }

        lathe {
        bezier_spline
        4,
        P5 P6 P7 P8
        }

        lathe {
        bezier_spline
        4,
        P8 C1 C2 C3
        }

        lathe {
        bezier_spline
        4,
        C3 C2 C4 C5
        }
        }

    union {
                  cone{ <2.1,10,0> 2 <2.1,14,0> 3 }
          union{  sphere{ <2.1,14,0> 1.5 }
                  cylinder{ <2.2,14.2,0> <2.2,18.4,0> 0.5      }
                  cylinder{<2,16.5,-2>  <3,16.5,2> 0.5 }

                }
              translate<-2.5,0,0>
          //  translate<0,0,-0.6>
            //scale 1
          }
  texture{    pigment{ color coule}
                finish{  IsoFinish }
            }

rotate<90,0,0>
translate posi
scale 0.4

}
#end // fin macro
//Roi(<1,0,0>,Red)
