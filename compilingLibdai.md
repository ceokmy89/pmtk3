Here are instructions on compiling libdai for windows. Tested using
libai version 0.2.6, on windows Vista 32bit, (and windows 7 64 bit) with boost 1.43, visual studio 2008 (v9), and Matlab 2009a, and 2010a. These were adapted from the libdai instructions available from here: http://people.kyb.tuebingen.mpg.de/jorism/libDAI/


(1) Download and install visual studio 2008 express: http://www.microsoft.com/express/Downloads/
(I first tried version 2010, but the matlab interface didn't compile properly under it. Although it may be possible to get it to work.)

(2) Change MATLAB's compiler  to visual studio 2008 using "mex -setup"

(3) Download and install **gnu make**, **diffUtils** and **sed** from http://gnuwin32.sourceforge.net/packages.html

(4) Download and unzip boost to say C:\boost from http://www.boost.org/users/download/

(5) Download boost jam from the link above and put the bjam.exe file in the C:\boost\boost\_1\_43\_0 directory

(6) Run this command to build the boost libraries:

```
bjam --with-graph --with-math --with-program_options --with-serialization --with-test link=static runtime-link=shared
```

(7)  Download libDAI from http://people.kyb.tuebingen.mpg.de/jorism/libDAI
and unzip it to say C:\boost\libDAI-0.2.5. _Version 2.6 has been tested as well._


(8) Rename the "Makefile.WINDOWS" file, "Makefile.conf" and make the following changes:

```
CCINC=-Iinclude -I"C:\boost\boost_1_43_0"
BOOSTLIBS_PO=/LIBPATH:"C:\boost\boost_1_43_0\stage\lib"
BOOSTLIBS_UTF=/LIBPATH:"C:\boost\boost_1_43_0\stage\lib"
CCLIB=/LIBPATH:"C:\Program Files\Microsoft Visual Studio 9.0\VC\ATLMFC\LIB" /LIBPATH:"C:\Program Files\Microsoft Visual Studio 9.0\VC\LIB" /LIBPATH:"C:\Program Files\Microsoft SDKs\Windows\v6.0A\lib"
MATLABDIR="C:\Program Files\MATLAB\R2010a"
MEX="C:\Program Files\MATLAB\R2010a\bin\mex"
```

(9) Open up the visual studio command prompt, (not the regular windows cmd), change directories to the \libDAI-0.2.5 directory and type:
```
SET PATH=%PATH%;"C:\Program Files\GnuWin32\bin"
```
to add the make directory to the path, (for some reason the visual studio cmd prompt ignores the system path)

and then type
```
make
```

If all you want is the matlab mex interface, (sufficient for calling libdai from withing Matlab) then you can save a lot of time and trouble by just typing `make matlabs`, (with the s). If so, skip step 10.

(10) After its compiled, (roughly an hour on my system) you need to compile the matlab interface:
Open "Makefile.ALL" and set "WITH\_MATLAB=true", and then run make again. It doesn't recompile
what its already done, but the matlab part takes quite a long time too. (Apparently you have do this
two stage compilation; I didn't try doing it all at once).

(11)

Open Matlab,  and test out their example:
```
cd path_to_libdai/matlab
[psi] = dai_readfg ('../tests/alarm.fg');
[logZ,q,md,qv,qf] = dai (psi, 'JTREE', '[updates=HUGIN,verbose=0]')
[logZ,q,md,qv,qf] = dai (psi, 'BP', '[updates=SEQMAX,tol=1e-9,maxiter=10000,logdomain=0]')
```
Note the "tests" directory unlike the erroneous "examples" path in their documentation.

(12)
If you are only using this from within Matlab, all you need is the matlab directory containing the .mex**files.**


Assuming everything works, the whole process takes about 2 hours, but most of this is unattended.

The readme instructions with libDAI have a bunch of stuff about the boost build that you can ignore. Boost now ships with boost.build and you don't need
to change boost-build.jam.


## Debugging ##
To add mex debug info to the compiled files add -g to the MEXFLAGS property in Makefile.conf. This allows you to debug segfaults as per these [MATLAB instructions](http://www.mathworks.com/access/helpdesk/help/techdoc/matlab_external/f32489.html#f18756). If you are recompiling, make sure to first delete the .mex files.

```
MEXFLAGS:=-DWINDOWS -DNOMINMAX -g
```