# Tags #

  * Files in PMTK are annotated with tags indicating meta information such as the author, date, the running time etc, and are the basis for all All [PMTK reports](http://code.google.com/p/pmtk3/wiki/updatingDocumentation).

  * Tags look like this, and can live anywhere in the file:
```
% PMTKauthor Matt Dunham
% PMTKdate  July 1, 2010
```

  * All tags begin with "PMTK". The remaining text after the space is the value of the tag.

  * Tags must be preceded by the Matlab "%" comment symbol, even if the file contains no Matlab code.

  * There are a number of tools that can help you obtain information about tags:

| [pmtkTagReport.m](http://pmtk3.googlecode.com/svn/trunk/localUtil/reports/sub/pmtkTagReport.m) | Generates a struct storing information on all tagged files in PMTK. |
|:-----------------------------------------------------------------------------------------------|:--------------------------------------------------------------------|
| [tagfinder.m](http://matlabtools.googlecode.com/svn/trunk/metaTools/tagfinder.m)               | Returns a list of all tags and their values in a specified file.    |
| [hasTag.m](http://matlabtools.googlecode.com/svn/trunk/metaTools/hasTag.m)                     | Returns true, if a specified file has a specified tag.              |
| [findAllFilesWithTag.m](http://matlabtools.googlecode.com/svn/trunk/metaTools/findAllFilesWithTag.m) | Returns a list of all files with the specified tag.                 |
| [getTagText.m](http://matlabtools.googlecode.com/svn/trunk/metaTools/getTagText.m)             | Returns the text appearing after the tag in the specified file.     |

  * Here is a list of commonly occurring tags:


PMTKauthor

PMTKdate

PMTKurl

PMTKemail

PMTKmodified

PMTKbroken

PMTKslow

PMTKreallySlow

PMTKinteractive

PMTKneedsMatlab

PMTKneedsStatstoobox

PMTKneedsBiotoolbox

PMTKneedsOptimtoolbox