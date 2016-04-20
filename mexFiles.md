### Mex ###

PMTK includes a few mex files, which are Matlab interfaces to compiled c code that can be executed as though they were regular .m files. Mex files must be generated for each type of OS. Currently we have only included 32 bit linux, and windows versions. If you are using another OS, the vast majority of PMTK should still function fine. Many 'backup' .m files exist, which are called automatically if a mex version cannot be found.

If you run into problems, however, or want increased speed, you may need to compile files manually. Here are some pointers.


  * Before you run the ` mex ` command for the first time, you need to type ` mex -setup ` to tell Matlab what compiler to use. This only has to be done once per Matlab installation.

  * Some versions of Matlab do not ship with a compiler. If this is the case, you can install the visual studio express 2008 C++ compiler available for free from [here](http://www.microsoft.com/express/Downloads/). Note, Matlab does not fully support the 2010 edition yet, (at least not without patches). The visual studio compiler may also generate better code than the built in Matlab lcc.

  * Compiling on a 64 bit windows system requires additional setup, in particular, the windows [SDK](http://www.microsoft.com/downloads/en/confirmation.aspx?familyId=c17ba869-9671-4330-a63e-1fd44e0e2505&displayLang=en) - see [this page](http://www.mathworks.com/support/solutions/en/data/1-6IJJ3L/?solution=1-6IJJ3L) for official details. However, I had to use the instructions and files from  [this](http://www.mathworks.com/matlabcentral/fileexchange/22689) file exchange posting to get it to work.

  * For standalone .c or .cpp files, (which do not link to other libraries), compilation is very easy. Suppose the file is called foo.c. Change to the directory containing foo.c, using ` cd `, and then type ` mex foo.c `.

  * On newer Matlab versions, (> 2006a) you should use the `-largeArrayDims` switch to mex, which lets the mex file handle arrays larger than 2.^32. This is required when compiling on a 64 bit OS. For example, the above command would become `mex -largeArrayDims foo.c`

  * If Matlab complains that your compiler is too new(!) see [this page](http://www.infohit.net/blog/post/alternative-gcc-compilers-on-ubuntu-intrepid-and-jaunty.html) on downgrading gcc on ubuntu.

  * Some packages found in [pmtkSupport](http://code.google.com/p/pmtksupport/) may require custom mex commands. See their documentation for details, or look for an installation script. Generally this involves linking to other source files. Simply specify the additional files to link to as in ` mex -largeArrayDims foo.c utils.h `. If you need to compile a file first for inclusion in multiple mex files, use e.g. ` mex -c utils.c utils.h`, which will create a `.o` file on linux and a `.obj` file in Matlab. You can the link to these using e.g. `mex -largeArrayDims foo.c utils.obj`.

  * If you do generate mex files for another OS, please send them to us so that we can include them in for others to use.

  * For more information on mex files, see [this tutorial](http://yagtom.googlecode.com/svn/trunk/html/external.html#36) or read the official documentation [here](http://www.mathworks.com/support/tech-notes/1600/1605.html).

### Octave ###

  * Octave now supports mex files, (as well as their own .oct interface), but we have not yet included any. One issue is that Octave uses the same mex extension, (simply .mex) for every OS making it difficult to include them for more than one platform. A solution for the future might be to have initPmtk3 automatically rename 'archived' versions depending on the detected system. The command to compile a .c file, (written as mex interface) is the same as in Matlab, (at least from within Octave): ` mex foo.c `. See [this page](http://www.gnu.org/software/octave/doc/interpreter/Dynamically-Linked-Functions.html#Dynamically-Linked-Functions) for more details.

### Automatic Compilation ###

  * In the future, we may add automatic compilation support. See the [compileC.m](http://matlabtools.googlecode.com/svn/trunk/metaTools/compileC.m) function for an existing basic implementation. Unfortunately, the majority of the packages in pmtkSupport require custom linking commands, and so we can't simply walk over all of the .c files found, calling mex.