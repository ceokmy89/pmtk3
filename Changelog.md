Changelog

A list of changes in reverse chronological order. (KPM=Kevin P Murphy, MD = Matt Dunham).

  * jan11. KPM uploads minor changes, so that more demos run without errors. Thanks to
Albert Zevelev for his help spotting bugs.

  * 5Dec11. KPM uploads minor changes, mostly new figures for the book. However, a few demo files have been modified so they no longer rely on hard-coded filenames specific to kpmurphy. Thus runDemos should now work for everyone without modification.

  * 2Apr11. KPM uploads new version. Main changes. (1) The mixture model code has been refactored, so there is no longer a generic mixtureModel class. Instead you need to use mixGauss, mixDiscrete, mixGaussDiscrete, mixStudent, etc. Although this results in a small amount of code duplication internally, it is much simpler to understand and modify the source. In addition, some functionality (eg predictMissing) is only supported for certain kinds of mixutre models. (2) pmtksuport/lightspeed now restored logsumexp to its original form, which assumes by default than you want to normalize over dimension 1, whereas PMTK had modified this to dimension2 . All calls to logsumexp have had to be modified; they are now explicit about the dimension. (3) Added experimental code from Emtiyaz, supporting categorical factor analysis (catFA).

  * 23Feb11. KPM gets 'runDemos' to work on MAC OS X and on Linux. This requires replacing requireXtoolbox (which breaks runDemos) with the idiom 'if ~Xinstalled then return', for various packages.

  * 23Feb11. KPM moved files from demos/bookDemos/folder and demos/otherDemos/folder/ to demos. This  make it easier to find the demos. In addition, the bookDemos/folders had long and unwieldy names, which no longer corresponded to the book chapter titles. The current structure is completely flat, and is uncoupled from the book.

  * 23Feb11. Renamed 'external' to 'pmtkSupportCopy', 'data' to 'pmtkdataCopy', 'localUtil' to 'pmtkTools' and added 'pmtkdataSmall' for local files not in the pmtkdata web site

  * 21Feb11. Added 'addOnes=true' to linregRbfDemo.

  * 23nov10. KPM uploads a new zip file. Now the folders in bookDemos match the chapter names in the 22nov10 version of the book (http://www.cs.ubc.ca/~murphyk/MLbook/index.html) However, there are still bugs left over from the last release that I have not fixed yet (see http://pmtk3.googlecode.com/svn/trunk/docs/debugReport.html).

  * 24oct10: MD uploads a new zip file. This contains pmtk3 and matlabtools. The site http://code.google.com/p/matlabtools/ is now deprecated.

  * 31aug10: MD uploads a new zip file. This is a considered a 'milestone release', since it marks the end of Matt's work contract. This version is stable and has been well debugged.

  * 1jan10: pmtk3 was born.

  * Spring 2009. pmtk2 was born.

  * Fall 2008. pmtk1 was born.