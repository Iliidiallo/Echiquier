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

#declare sca=1;

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




#macro fou(position,couleur,rotation)
#local IsoFinish=finish{
    ambient 0.1
    diffuse 0.1
    }

union{
blob{
    threshold 1.4905
   sphere{
          <0,0,-2> ,3, -10 }

    sphere{<0,0,0> ,3,3 }
    cylinder{<0,0,2.5>, <0,0,5.5>, 1.6,1.8 }
   sphere{<0,0,7.2> ,1.8,1.53 }
   cylinder{<1.5,0,6.2> ,<-1.5,0,6.9> ,0.3, -40 rotate -1*x}

}
texture{
               pigment{
                 color couleur}
                 finish{
                 IsoFinish }
                 }
                 rotate rotation
                 translate<0,0,1>
                 translate position
                 scale 0.8
}
#end


//fou(<0,0,1>,Green,<0,0,0>)
