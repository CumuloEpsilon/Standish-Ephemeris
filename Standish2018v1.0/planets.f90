! compile: gfortran -o planets planets.f90 standish_module.o
Program Planets
      Use standish
      Implicit None
      Real (8) :: Julian, PV (6), QV (6), P (9, 6)
      Integer :: I, J, ITBL
!
      Write (*,*) "Approximate Positions of the Major Planets"
      Write (*,*) "Enter Julian (TT), eg 2451545.0"
      Read (*,*) Julian
      Write (*,*)
!
	! Compute Positions
!
      Do J = 1, 9
         Call Helio (J, Julian, PV, ITBL)
         P (J, :) = PV
      End Do
	
	! Report Results
!
      Call Title
      Write (*, '(A,F12.3)') "Heliocentric Ecliptic Coordinates (J2000)&
     & Julian (TT)", Julian
      Write (*,*) "Planet       X        Y        Z       VX       VY       VZ  "
	  Write (*,*) "                 Position (AU)            Velocity (KPS)"  
      Do J = 1, 9
      Write (*, '(A10, 3F9.3,3F9.4)') eph(1)%name(J), P (J, 1:3), s_KPS * P (J, 4:6)
      End Do
!
      Write (*,*)
      Write (*, '(A,F12.3)') "Heliocentric Equatorial Coordinates (ICRF&
     &) Julian (TT)", Julian
      Write (*,*) "Planet       X        Y        Z       VX       VY       VZ  "
	  Write (*,*) "                 Position (AU)            Velocity (KPS)"  
      Do J = 1, 9
         Call ec2eq (P(J, :), QV)
         Write (*, '(A10, 3F9.3,3F9.4)') eph(1)%name(J), QV (1:3),  s_KPS * QV (4:6)
      End Do
	 Write (*,*)
! +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! Copyright 2018 Cumulo Epsilon (epsilon0167) (GPG Key ID 8F126A52)

! Redistribution and use in source and binary forms, with or without 
! modification, are permitted provided that the following conditions are met:

! 1. Redistributions of source code must retain the above copyright 
! notice, this list of conditions and the following disclaimer.

! 2. Redistributions in binary form must reproduce the above copyright 
! notice, this list of conditions and the following disclaimer in the 
! documentation and/or other materials provided with the distribution.

! THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 ! "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
 ! LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
 ! FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
 ! COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
 ! INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
 ! BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
 ! LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
 ! CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
 ! LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING 
 ! IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
 ! THE POSSIBILITY OF SUCH DAMAGE.
! +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
End Program

! EAXMPLE OUTPUT
!
 ! Approximate Positions of the Major Planets
 ! Method and Data from E. M. Standish, JPL/CalTech
 ! Keplerian Elements Valid 3000 BC - 3000 AD.                     
 ! (http://ssd.jpl.nasa.gov/txt/aprx_pos_planets.pdf)
 ! Planetary Ephemeris Module V1 2018                              

! Heliocentric Ecliptic Coordinates (J2000) Julian (TT) 2451545.000
 ! Planet       X        Y        Z       VX       VY       VZ  
                  ! Position (AU)            Velocity (KPS)
  ! Mercury    -0.130   -0.447   -0.025  36.9955 -11.1645  -4.3077
  ! Venus      -0.718   -0.033    0.041   1.3832 -35.1403  -0.5601
  ! Earth      -0.177    0.967   -0.000 -29.7870  -5.4789   0.0000
  ! Mars        1.391   -0.013   -0.034   1.1646  26.2975   0.5223
  ! Jupiter     3.998    2.946   -0.102  -7.9127  11.1382   0.1311
  ! Saturn      6.415    6.546   -0.369  -7.4126   6.7409   0.1773
  ! Uranus     14.425  -13.738   -0.238   4.6433   4.6120  -0.0431
  ! Neptune    16.805  -24.993    0.127   4.4730   3.0619  -0.1661
  ! Pluto      -9.883  -27.964    5.851   5.2496  -2.6734  -1.2323

! Heliocentric Equatorial Coordinates (ICRF) Julian (TT) 2451545.000
 ! Planet       X        Y        Z       VX       VY       VZ  
                  ! Position (AU)            Velocity (KPS)
  ! Mercury    -0.130   -0.401   -0.200  36.9955  -8.5297  -8.3932
  ! Venus      -0.718   -0.046    0.025   1.3832 -32.0178 -14.4919
  ! Earth      -0.177    0.887    0.385 -29.7870  -5.0268  -2.1794
  ! Mars        1.391    0.001   -0.037   1.1646  23.9198  10.9397
  ! Jupiter     3.998    2.743    1.078  -7.9127  10.1669   4.5508
  ! Saturn      6.415    6.152    2.265  -7.4126   6.1141   2.8440
  ! Uranus     14.425  -12.509   -5.683   4.6433   4.2485   1.7950
  ! Neptune    16.805  -22.981   -9.825   4.4730   2.8753   1.0655
  ! Pluto      -9.883  -27.984   -5.755   5.2496  -1.9626  -2.1940

 
! DE430 RESULTS
 ! DE430 Ephemeris (taken as authoritative)

! Heliocentric Ecliptic Coordinates (J2000) Julian (TT) 2451545.000
 ! Planet       X        Y        Z       VX       VY       VZ  
  ! Mercury    -0.130   -0.447   -0.025  36.9950 -11.1644  -4.3076
  ! Venus      -0.718   -0.033    0.041   1.3819 -35.1403  -0.5600
  ! Earth      -0.177    0.967   -0.000 -29.7943  -5.4693   0.0002
  ! Mars        1.391   -0.013   -0.034   1.1627  26.2961   0.5223
  ! Jupiter     4.001    2.939   -0.102  -7.9098  11.1561   0.1309
  ! Saturn      6.406    6.570   -0.369  -7.4320   6.7359   0.1783
  ! Uranus     14.432  -13.734   -0.238   4.6370   4.6277  -0.0429
  ! Neptune    16.812  -24.992    0.127   4.4659   3.0766  -0.1661
  ! Pluto      -9.875  -27.959    5.850   5.2442  -2.6626  -1.2331

! Heliocentric Equatorial Coordinates (ICRF) Julian (TT) 2451545.000
 ! Planet       X        Y        Z       VX       VY       VZ  
  ! Mercury    -0.130   -0.401   -0.200  36.9950  -8.5297  -8.3931
  ! Venus      -0.718   -0.046    0.025   1.3819 -32.0178 -14.4918
  ! Earth      -0.177    0.887    0.385 -29.7943  -5.0181  -2.1754
  ! Mars        1.391    0.001   -0.037   1.1627  23.9184  10.9392
  ! Jupiter     4.001    2.737    1.076  -7.9098  10.1835   4.5577
  ! Saturn      6.406    6.175    2.275  -7.4320   6.1092   2.8429
  ! Uranus     14.432  -12.506   -5.682   4.6370   4.2629   1.8014
  ! Neptune    16.812  -22.980   -9.824   4.4659   2.8888   1.0715
  ! Pluto      -9.875  -27.979   -5.754   5.2442  -1.9524  -2.1905
