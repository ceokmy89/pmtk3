PMTK is a collection of Matlab/Octave functions, written by [Matt Dunham](http://ca.linkedin.com/pub/matt-dunham/75/185/47a), <a href='http://people.cs.ubc.ca/~murphyk/'> Kevin Murphy</a>
and [various other people](contributingAuthors.md)
The toolkit is
primarily designed to accompany Kevin Murphy's textbook,
<a href='http://people.cs.ubc.ca/~murphyk/MLbook/'>
Machine learning: a probabilistic perspective</a>, but can also be used independently of this book. The goal is to provide a unified conceptual and software framework encompassing machine learning, graphical models, and Bayesian statistics (hence the logo). (Some methods from frequentist statistics, such as cross validation, are also supported.) The toolbox is currently (December 2011) in maintenance mode, meaning that bugs will be fixed, but no new features will be added (at least not by Kevin or Matt).

PMTK supports a large
variety of probabilistic models, including
linear and logistic regression models (optionally with kernels), SVMs and gaussian processes, directed and undirected
graphical models,  various kinds of latent variable models (mixtures, PCA, HMMs, etc) , etc.  Several kinds of prior are supported,
including Gaussian (L2 regularization), Laplace (L1 regularization),
Dirichlet, etc.  Many algorithms are supported, for both
Bayesian inference (including dynamic programming,
variational Bayes and MCMC) and MAP/ML estimation (including EM,
conjugate and projected gradient methods, etc.)

PMTK builds on top of several existing packages, available from [pmtksupport](http://code.google.com/p/pmtksupport), and provides a unified interface to them. In addition, it provides readable "reference" implementations of many common machine learning techniques. The vast majority of the code is written in Matlab. (For a brief discussion of why we chose Matlab, click <a href='http://code.google.com/p/pmtk3/wiki/WhyMatlab'>here</a>.  Most of the code also runs on [Octave](http://code.google.com/p/yagtom/wiki/Octave), an open-source Matlab clone.) However, in a few cases we also provide wrappers to implementations written in C,  for speed reasons. PMTK currently (October 2010) has over [67,000 lines of code](http://pmtk3.googlecode.com/svn/trunk/docs/pmtkStats.html).

PMTK contains many demos of different methods applied to  many different kinds of data sets. The demos are listed [here](http://code.google.com/p/pmtk3/wiki/Demos), and the data is available from [pmktdata](http://code.google.com/p/pmtkdata/) (but will be downloaded automatically when a demo calls [loadData](http://code.google.com/p/pmtk3/source/browse/trunk/localUtil/dataTools/loadData.m)).

**Documentation**  <a href='http://code.google.com/p/pmtk3/wiki/pmtk3Documentation'>Click here</a> for information on how to download, install  and use the toolbox.

**Contributing code** Authorized users can  check in changes to the source
code and/or documentation using the <a href='http://code.google.com/p/pmtk3/source/checkout'>svn interface</a> (see [here](http://code.google.com/p/pmtk3/wiki/svnHintsAndTips) for some hints and tips). Also, they can edit the documentation via the <a href='http://code.google.com/p/pmtk3/w/list'>wiki interface</a>. To become an authorized user, send Kevin Murphy an email describing your credentials. Contributors of code  should follow the guidelines [here](http://code.google.com/p/pmtk3/wiki/GuidelinesForContributors).

**Reporting bugs** Please post bug reports [here](http://code.google.com/p/pmtk3/issues/list).

**Versions** As you can tell by the name, PMTK3 is the third version of PMTK. Older versions are obsolete, but are briefly described [here](http://code.google.com/p/pmtk3/wiki/pmtkVersions).

