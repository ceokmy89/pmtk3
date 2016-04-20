## Installation ##

  * Download the latest zip file from [here](http://code.google.com/p/pmtk3/downloads/list), and unzip it. Alternatively, you can use the [svn interface](http://code.google.com/p/pmtk3/source/checkout) to get the latest version of the source code, although this may not be as stable as the zip version.

  * Start Matlab/Octave. Suppose the directory where you unzipped pmtk is called 'C:\pmtk3'. Then type the following (you will need to modify the directory names if you unzipped these files to a different place).
```
cd C:\pmtk3
initPmtk3
```
You should see something like this.
```
>> initPmtk3
initializing pmtk3
downloading 38 packages to pmtk3/pmtksupportCopy from pmtksupport.googlecode.com - this may take a few minutes
downloading GGM-GWishart............success
...
```
If this fails for some reason, you may need to manually create the following directories
```
C:\pmtk3\pmtksupportCopy
C:\pmtk3\pmtkdataCopy
```
Then try re-running initPmtk3 again (from within matlab).

  * To test the system, type
```
testPmtk3
```
> This command will check the packages are installed correctly, automatically downloads a few datasets, and then runs a few demos; this takes about a minute.

  * If you have more patience, you can try this:
```
runDemos
```
This takes about 1 hour. The output produced by running all these demos is shown [here](http://code.google.com/p/pmtk3/wiki/Demos).

  * Note: Pmtk3 has only been tested on Matlab 2009a or newer. It is possible it will run on 2008a or older versions (see [matlab release history](http://en.wikipedia.org/wiki/MATLAB#Release_history)), but this is not guaranteed. It has been tested on windows 7, mac os X, and ubuntu linux. Octave compatibility is discussed at the end of this page.

## Automatic downloads ##

  * PMTK3 demos use various [data sets](http://pmtkdata.googlecode.com/svn/trunk/docs/dataTable.html). Each data set is automatically downloaded from http://pmtkdata.googlecode.com by the [loadData](http://pmtk3.googlecode.com/svn/trunk/toolbox/metatools/dataTools/loadData.m) command whenever a demo needs them. (If this fails for some reason, check that you are not shadowing pmtk's loadData command by mistake; to test this, type 'which loadData -all' inside Matlab to see which one is first on your path.) Once downloaded, the files are stored locally in the 'pmtkdataCopy' directory and added to your path, so next time the local copy is used) Each data folder should have been individually zipped up already. If you prefer, you can download all the data at once using [downloadAllData](http://pmtk3.googlecode.com/svn/trunk/localUtil/dataTools/downloadAllData.m). _This will allow you to run pmtk3 demos without needing internet access_. In this case, you should edit the [config-local.txt](http://pmtk3.googlecode.com/svn/trunk/config-local.txt) file to specify the location of the data directory. This will be added to your path by initPmtk3, so no more downloading will occur.

  * PMTK3 relies on various [support packages](http://pmtksupport.googlecode.com/svn/trunk/docs/authors/packageAuthors.html). These are automatically downloaded from http://pmtksupport.googlecode.com by [initPmtk3](http://pmtk3.googlecode.com/svn/trunk/initPmtk3.m) if they are not already on your path. Once downloaded, the files are stored locally in the 'pmtksupportCopy' directory and added to your path, so the next time the local copy is used. Unlike the data sets, the support packages are downloaded all at once, not on demand.  However, you can check them all out at once if you prefer. In this case, you should edit the [config-local.txt](http://pmtk3.googlecode.com/svn/trunk/config-local.txt) file to specify the location of the support directory.


## Mex files ##

  * Most of PMTK is written in Matlab, so should run on any system. However, a few functions also have C versions, or only have C versions, for speed. We have included precompiled versions of these files. See [this page](http://code.google.com/p/pmtk3/wiki/mexFiles) for details on recompiling them, if necessary.

## Libdai interface ##

  * PMTK3 includes an optional interface to the [libdai](http://people.kyb.tuebingen.mpg.de/jorism/libDAI/) graphical model inference package, written in C++ by Joris Mooij. We have compiled windows (32bit and 64bit), and (ubuntu) linux 32 bit versions of libdai, which are included in [pmtkSupport](http://code.google.com/p/pmtksupport/), and hence automatically available. Users of other systems will need to compile libdai manually. You can find libdai's installation instructions [here](http://people.kyb.tuebingen.mpg.de/jorism/libDAI/doc/build.html), and our notes on compiling libdai for windows [here](http://code.google.com/p/pmtk3/wiki/compilingLibdai). Once compiled, add the `*.mex*` files from libdai's matlab subfolder to the pmtkSupport libdai directory. If you generate mex files for other OS's, please send them to us so that we can include them for others to use.

## Graphviz ##

  * The [graphViz4Matlab](http://graphviz4matlab.googlecode.com) package, which is included in pmtkSupport, can be used to visualize (and edit) network structures. For best results, you should install the latest (free) version of  [Graphviz](http://www.graphviz.org/Download..php). This feature requires you to have Matlab 2008a or newer. It is not necessary to have graphviz to use pmtk, but it is useful if you want to visualize the results of graphical model structure learning, and/or run some of the demos. After installation, modify PMTKgvizPath in your [config.txt](http://pmtk3.googlecode.com/svn/trunk/config.txt) file, and/or add this directory to your [system path](http://pmtk3.googlecode.com/svn/trunk/matlabTools/metaTools/addtosystempath.m) manually. On windows systems the file  is usually stored at `C:\program files\Graphviz2.26\bin`. Ubuntu/Debian users can install graphviz by typing `sudo apt-get install graphviz` at the command prompt.


## Octave issues ##

  * PMTK is not yet 100% octave compatible. If you run into problems in Octave, check out [this wiki](http://code.google.com/p/yagtom/wiki/Octave) page, or [this page](http://code.google.com/p/pmtk3/wiki/mexFiles) on mex files, as well as the points below. If you would like to help make PMTK more compatible on Octave, please request svn write permission by sending Kevin Murphy an e-mail.

  * Octave does not always seem to include the current working directory on the path. You may need to type e.g. `addpath('C:\pmtk3')`, before typing `initPmtk3`. It also doesn't seem to like spaces in file paths.

  * Octave users on windows systems need to have an unzip.exe file on the system path. If you don't, you can download one from [info-zip](http://www.info-zip.org/), or use this [32bit version](http://pmtk3.googlecode.com/files/unzip.exe) from our site. Whatever unzip program you use, it must be called "unzip" and be on your _system_ path.

  * Octave under linux can sometimes fail to include all the of the necessary directories after the call to initPmtk3. If this happens you may need to manually type `restoredefaultpath(); addpath(genpath(pwd))` after running initPmtk3() for the first time, and then `addpath(genpath(pwd))` subsequent times instead of `initPmtk3`. Note that under Octave, `genpathPMTK` is very slow and does not work reliably, use `genpath` instead.


## Warning messages produced by glmnet ##

When running runDemos, you may get various warning messages produced by the glmnet package. You can safely ignore them. Some of the more common ones are listed below, FYI.

  * You may get this warning message
```
Warning: In the directory "C:\kmurphy\GoogleCode\pmtkSupport\glmnet-matlab", glmnetMex.mexw32 now shadows glmnetMex.dll.
```
You can safely ignore this. (It just means there are two versions of the executable on the path: .mexw32 is the 32 bit Windows version for new versions of Matlab, and .dll is for older versions of Matlab.)

  * You may get this warning message
```
cannot run lassoPathProstateClassif without glmnet; skipping
```
This just means you don't have a glmnet binary on your machine.

  * You may get this message or something similar:
```
Warning: from glmnet fortran code - Convergence for 33th lambda value not reached after maxit=100
iterations; solutions for larger lambdas returned
```
Again, you can safely ignore this. (It is caused by the glmnet package when it attempts to compute the full regularization path. This functionality is not central to anything used by pmtk.)



