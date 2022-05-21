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


#declare sca=3;
#declare IsoFinish=
  finish{ ambient 0.1
          diffuse 0.1
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


#macro Reine(Position,Couleur)
    #local IsoFinish=finish{
    ambient 0.1
    diffuse 0.1
    }

    #local m2=<5.5,0,0>;
    #local m1=<m2.x  +3.5,m2.y +1 ,0>;
    #local m0=<m2.x  ,m2.y+2  ,0>;
    #local m3=<m2.x -4.5 ,m2.y+0.5  ,0>;
    #local p0 = <0.9,0.2,0>;
    #local p1 = <4,0,0>;
    #local p2 = <4,1,0>;

    #local p3=<4,2,0>;
    #local p4=<2,2,0>;
    #local p5=<1,8,0>;
    #local p6=<0.8,8.6,0>;
    #local p7=<3.2,8.8,0>;
    #local p8=<1,8.9,0>;
    #local t0=<m2.x -4.5 ,m2.y+13>;
    #local t1=<m2.x -1.5 ,m2.y+13  ,0>;
    #local t2=<m2.x -2.5 ,m2.y+12  ,0>;
    #local t3=<m2.x -4.5 ,m2.y +12 ,0>;
    #local t4=<m2.x -4,5 ,m2.y+13,5,0>;
    #local t5=<m2.x -2,9 ,t4.y,0>;
    #local t6=<m2.x -2 ,t5.y + 0,5,0>;
    #local t7=<t0.x,t0.y-0.5,0>;
    #local t8=<t0.x,m2.y +16.8,0>;
    #local t9=<t0.x,m2.y +16.8,0>;
    #local t10=<t0.x,m2.y +18.8,0>;

    union{
        union{
            union{
                union{
                    sphere{
                    t8 2
                     }
                     sphere{
                        t10 0.6
                      }
                      rotate<90,0,0>
                      translate<-2,0,0>
              }
                union{
                difference{
                  cone{
                  t7 1.8 <t8.x,t8.y+1,0> 3.5

                  rotate<90,0,0>
                  translate<-1,0,0>
                  }

                  union{
                  cylinder{
                    <t8.x+4.5,t8.y+1,0> <t8.x-6.5,t8.y+1,0> 0.9

                    rotate<90,0,40>
                    translate<-1,0,0>
                  }
                  cylinder{
                    <t8.x+4.5,t8.y+1,0> <t8.x-6.5,t8.y+1,0> 0.9

                    rotate<90,0,140>
                    translate<-1,0,0>
                  }
                  cylinder{
                    <t8.x+4.5,t8.y+1,0> <t8.x-6.5,t8.y+1,0> 0.9

                    rotate<90,0,180>
                    translate<-2,0,0>
                    }
                  }
                }
                  torus{
                    2.5 0.2

                                        translate<0,t7.y+2,0>
                    rotate <90,0,0>
                  }
                }
          }
          torus{
            2 0.6

            translate<0,t7.y+0.2,0>
            rotate <90,0,0>
           }
          translate<0,0,-1>
          scale 0.7
          }


          union{
                    lathe{
                    bezier_spline
                    4 <p8.x,p8.y> <p7.x,p7.y> <p6.x,p6.y> <p5.x,p5.y>

                     rotate<90,0,0>
                    }
                    lathe{
                    bezier_spline
                    4 <p5.x,p5.y> <p4.x,p4.y> <p3.x,p3.y> <p2.x,p2.y>

                     rotate<90,0,0>
                    }
                    lathe{
                    3 <p2.x,p2.y> <p1.x,p1.y> <p0.x,p0.y>

                    rotate<90,0,0>
                }

                scale <0,0,1>
              }
        texture{
             pigment{
             color Couleur}
             finish{
             IsoFinish}
        }
        translate <0,0,5>
        translate Position
        scale 0.3
    }
#end
