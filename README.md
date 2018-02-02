# Standish-Ephemeris
Fortran90 Module - implemention of E.M. Standish's "Keplerian Elements for Approximate Positions of the Major Planets". 

                                             -- Cumulo Epsilon (2018) --

Program for calculating planetary positions ... yet, with distinction. Attend,

- Approximation Method and Data by a distinguished NASA/JPL Scientist (ret) E. M. Standish.

  (*see http://ssd.jpl.nasa.gov/txt/aprx_pos_planets.pdf )

- Fortran 90 module faithfully implementing the simple but accurate Standish approximations for 
  calculating Keplerian elements for the major planets for a given Julian Date. 
  
 - Keplerian Model , which may bring fond tears of nostralgia and realization that Kepler's first law, as
   proudly proclaimed over 400 years ago, that "The orbits of the planets are elipses, with the Sun at 
   one foci.", still lives, and that the modern version "The orbits of the planets are Chebyshev polynomials." 
   will not prevail (except in cases requiring high accuracy).
  
 - Fast calculation of planet positions. How fast? No warrantees, but I did 18 million planet positions
   (9 planets, 2 million days 3000 BC - 3000 AD) on one core of a Raspberry Pi 3 (Raspbian/gfortran)
   which completed in, wait for it,...  4 seconds.

 - Simplified BSD license! Take the program, glare at it, spit on it, make it your own (but don't forget to use 
   the BSD license if you publish or distribute, of course). Be nice and let me know if you find a mistake
   or have a nice improvement. Otherwise its FREE FREE FREE! And it runs fine using the free gfortran.
   
                                    Key Routines
   
   -- Subroutine calcelements - returns keplerian elements (and eccentric anomaly) for JD.
   
   -- Subroutine helio  - returns selected planet j2000 ecliptic position (au) and velocity (au/yr) for JD.
   
   -- Subroutine ec2eq - converts ecliptic to equatorial.
   
   -- Subroutine sphere - converts to spherical coordinates.
   
                                    Sample Program
   
   Planets.f90 - compute all planets ecliptic and equatorial positions and velocities for specified Julian Date.
   
                                    Using Fortran
   
   We recommend gfortran, a free and modern FORTRAN. Available for Windows, OSX, Linux. ( see  https://gcc.gnu.org/wiki/GFortranBinaries ). Other complilers are excellent too, certainly. 
   
   Download the .f90 files and look at the top line for the command line needed to compile to an executable which runs from the command line.
   
  OF NOTE - OTHER ASTRONOMY PROGRAMS IN FORTRAN 
   
<ul>
<li><a href="http://naif.jpl.nasa.gov/naif/toolkit.html" rel="nofollow">SPICE</a></li>
<li><a href="http://aa.usno.navy.mil/software/novas/novas_info.php" rel="nofollow">NOVAS</a></li>
<li><a href="http://www.iausofa.org" rel="nofollow">SOFA</a></li>
<li><a href="https://github.com/jacobwilliams/Fortran-Astrodynamics-Toolkit" rel="nofollow">Fortran-Astrodynamics-Toolkit</a></li> 
</ul>
   
