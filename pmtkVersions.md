There are several versions of pmtk.

  * <a href='http://people.cs.ubc.ca/~murphyk/pmtk/pmtk1/index.html'>v1</a> is object-oriented and contains many examples, but was abandoned because it was growing organically and lacked a coherent overall design. It needs Matlab 2008a or newer.

  * <a href='http://people.cs.ubc.ca/~murphyk/pmtk/pmtk2/index.html'>v2</a> has a much better object-oriented design, but was abandoned due to excessive complexity of the class system (e.g., see <a href='http://people.cs.ubc.ca/~murphyk/pmtk/pmtk2/pmtk2-class-diagram.pdf'>this diagram</a>). It needs Matlab 2008a or newer.


  * <a href='http://code.google.com/p/pmtk3/'>v3</a> is the latest version (started January 2010), and is much simpler. It needs Matlab 2007a `(R14)` or newer (see [here](MatlabCompatibility.md) for info on making it work on older versions of Matlab). In v3, the basic design philosophy changed from object-oriented to functional, e.g., instead of passing in a model object, with fit and predict methods, to the cross validation routine, you must now pass in fit and predict function handles. The principal advantage of this is that the code (mostly) runs on  [Octave](http://code.google.com/p/pmtk3/wiki/Octave). In addition, this lightweight functional style is more familiar to most Matlab programmers.