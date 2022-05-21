#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
#include "glass.inc"
#include "metals.inc"
#include "functions.inc"
#include "stones1.inc"
#include "skies.inc"

//appel aux classes
#include "Roi.pov"
#include "Pion.pov"
#include "tour.pov"
#include "Reine.pov"
#include "cavalier.pov"
#include "fou.pov"

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
/* plane {
        <0,0,-2> 150
        pigment{brick
        Yellow
        Black
        mortar 5
        brick_size 15
        }
      }*/


#if (ciel)
    sky_sphere {S_Cloud5 rotate <90,0.051, 1>}
#end


#declare Chessboard =
      union{
            box { <-1.00,0.00,-1.00>,<1.00,0.050,1.00>

            texture{
              pigment{ checker
                       color White
                       color Black

                     } // end pigment
                  finish{ambient 8 diffuse 1 specular 0.1 }
                     scale 0.25
                   }
                }
            }

  object{ Chessboard
            translate<0,0,0>
              scale 18
              rotate<90,0,0>

        }

#declare  T =45*clock;

//---------------------------------------- Boucle pour afficher les Pions--------------------------





            #declare i=0;
            #while(i<=161)

              #if(i=138)

                  #if(T <= 10)
                      #declare tp = T/10;
                              #local directionX_Pion=pow(1-tp,2)*138+2*tp*(1-tp)*138+pow(tp,2)*138;
                              #local directionY_Pion=pow(1-tp,2)*55+2*tp*(1-tp)*33+pow(tp,2)*11;
                              Pion(<directionX_Pion,0,directionY_Pion>,Yellow)
                 #else
                        Pion(<138,0,11>,Yellow)
                        #end
                    #end

                  #if(i!=138)
                    Pion(<i,0,55>,Yellow)
                  #end

                    #if(i=138)
                        #if(T>12 & T<=20)
                         #declare tp2=(T-10)/10;
                                #local directionX_Pion2=pow(1-tp2,2)*138+2*tp2*(1-tp2)*138+pow(tp2,2)*138;
                                #local directionY_Pion2=pow(1-tp2,2)*-55+2*tp2*(1-tp2)*-33+pow(tp2,2)*-33;
                            Pion(<directionX_Pion2,0,directionY_Pion2>,Green)

                        #else
                            #if(T<=12)
                              Pion(<138,0,-55>,Green)
                           #else

                              Pion(<138,0,-33>,Green)
                             #end


                  #end

              #end

              #if(i!=138)
                  Pion(<i,0,-55>,Green)
              #end

             #declare i=i+23;
            #end


//---------------------------------------fin affichage pion --------------------------------------






//----------------------" JOUEUR 1 Color Jaune "---------------------------------------

Roi(<-5.5,-39,3>,Yellow)

Tour(<55,-52,-2>,Yellow)
Tour(<-55,-52,-2>,Yellow)

Reine(<10,-52,0.5>,Yellow)


//--------------------animation du cavalier ---------------------------

   #if(T>20 & T<=30)
      #declare tp3=(T-20)/10;
          #local directionX_Cav=pow(1-tp3,2)*37+2*tp3*(1-tp3)*37+pow(tp3,2)*22;
          #local directionY_Cav=pow(1-tp3,2)*(-48)+2*tp3*(1-tp3)*(-21)+pow(tp3,2)*(-21);
          #local directionZ_Cav=2*tp3*(1-tp3)*20;

          Cavalier(<directionX_Cav,directionY_Cav,-2.5+directionZ_Cav>,Yellow,<0,0,180>)

      #else
           #if(T<20)
            Cavalier(<37,-48,-2.5>,Yellow,<0,0,180>)
           #else
                #if(i>30)
                  Cavalier(<22,-21,-2.5>,Yellow,<0,0,180>)
                #end
          #end
      #end



    Cavalier(<-32,-47,-2>,Yellow,<0,0,-180>)

//------------fin ----------------------------------------------------


fou(<9.2,-19,0>,Yellow,<0,0,0>)//tp3=(T-20)/10;
fou(<-9.2,-19,0>,Yellow,<0,0,0>)

//--------------------fin de joueur 1--------------------



//---------------------"  JOUEUR 2    color Green "---------------------------------------------

Roi(<-5.5,39,3>,Green)

Cavalier(<37,48,-2>,Green,<0,0,0>)
Cavalier(<-37,48,-3>,Green,<0,0,0>)

//------------------animation du fou joueur2------------------------------


#local V0=1;
#local D1=9.2;
#local D2=20;
#local DT=D2-D1;



  #if(T>30 & T<=40)

        #local tp4=(T-30)/10;
        #local Dep=DT*tp4;


          fou(<9.2+Dep,19-Dep,0>,Green,<0,0,0>)
   #else
      #if(T<31)
          fou(<9.2,19,0>,Green,<0,0,0>)
      #else
        #if(T>=40)
          fou(<20,8.5,0>,Green,<0,0,0>)
          #end
        #end
    #end


fou(<-9.2,19,0>,Green,<0,0,0>)



//-------------------------fin ---------------------------------------


Tour(<55,52,0>,Green)
Tour(<-55,52,0>,Green)

Reine(<10,52,0.5>,Green)


//--------------------------------------fin de joueur2------------------------------------
