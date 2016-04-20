Explanation of directory structure of PMTK3

PMTK3 contains the following top-level directories (as of 3jan11):


  * demos - various demos that test and illustrate how to use the toolbox. Many are just scripts used to generate figures for ["Machine learning : a probabilistic approach"](http://www.cs.ubc.ca/~murphyk/MLbook/index.html).

  * docs - contains documentation which appears on [pmtk3.googlecode.com](http://pmtk3.googlecode.com). For most users this will be an empty directory

  * matlabTools - various generally useful matlab functions

  * pmtkdataCopy - used to store local copies of data folders that are auto-downloaded from [pmtkdata.googlecode.com](http://pmtkdata.googlecode.com). This will be initially empty and gradually gets filled after running loadData.

  * pmtkdataSmall - used to store small files for which it is not worth the effort to put them on the  pmtkdata website

  * pmtksupportCopy - used to store local copies of folders that are auto-downloaded from [pmtksupport.googlecode.com](http://pmtksupport.googlecode.com). This will be initially empty and gets filled after running initPmtk3.

  * pmtkTools - various utility functions that are specific to pmtk3

  * projects - scratch space for projects that use pmtk3 but which are not designed for public consumption (they are just free-riding off the svn site)

  * python - a place-holder for experiments concerning an (aborted) python port

  * toolbox - the **main directory** containing models and algorithms. Click [here](http://code.google.com/p/pmtk3/wiki/synopsisPages) for a list of all the files within this folder, complete with brief documentation