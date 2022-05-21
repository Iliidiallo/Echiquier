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

// axes
#declare Font="cyrvetic.ttf"
#declare O3=<0,0,0>;
#declare I=<1,0,0>;
#declare J=<0,1,0>;
#declare K=<0,0,1>;
#declare rCyl=0.025;
#declare rCone=0.075;

#declare D=0;
#declare F=2.5;
#declare val0=D+(F-D)*clock;
#declare sca=1;
#declare IsoFinish=
  finish{ ambient 0.5
          diffuse 1
         }

camera {
location <7*sca,2,2.9*sca>
look_at <0,0,0>
sky   <0,0,1>
right <-image_width/image_height,0,0>
}
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


#macro Tour(position,couleur)
        #local IsoFinish=finish{
          ambient 0.1
          diffuse 0.1
          }

      union{
      union{
        difference{
              cylinder{
              <0,6,0> <0,7,0> 3 rotate 90*x

            }
            box{

              <0,6.5,-3>  <0.5,7.5,3>   rotate <90,0,60>

                }
              box{

                <0,6.5,-3>  <0.5,7.5,3>   rotate <90,0,-60>

                }
                box{

                  <0,6.5,-3>  <0.5,7.5,3> rotate <90,0,00>

                  }
                  sphere{<0,7.6,0>, 2.5 rotate 90*x
                  }

        }
        torus{
          2.5 0.5 translate 5.7*y rotate 90*x

        }
      }
      torus{
        3.6 0.6   rotate  90*x
            }
      torus{
        3.7 0.6   translate 0.5*y rotate  90*x
         }
      cone {
        <0,1,0> 3.5 <0,6,0> 2.3 rotate 90*x

      }
     texture{
                     pigment{
                       color couleur}
                       finish{
                       IsoFinish }
                       }
  //scale scal
  translate <0,0,5>
  translate position
  scale 0.3

            }
#end
//Tour(<5,0,0>,Red)
