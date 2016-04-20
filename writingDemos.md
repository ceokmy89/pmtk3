# Writing Demos for Publishing #

Demos in PMTK3 are automatically published to html using the [publishDemos()](http://pmtk3.googlecode.com/svn/trunk/localUtil/reports/publishDemos.m) function. To ensure that these demos look as you expect, please format the comments as follows:

## Title ##

Every demo should have a title. This will appear in two places, the list of demos by chapter, and at the top of the demo itself.

  * The title must be a single line, and the very first line of the file, above even the    function header.
  * The title line must begin with two % signs followed by a single space, as in `%% Demo Title Here`.
  * Additional comments that pertain to the whole demo should immediately follow the title  without any blank lines and with each line beginning with a single % sign followed by a space.
  * This comment block, even if empty, must end with two %% signs before the first line of Matlab code.


```
%% Multiclass Logistic Regression 
% In this demo, we fit a multiclass logistic regression model by first
% performing various basis expansions of the input features. This is a
% simplification of logregMultinomKernelMinfuncDemo.
%%
function logregMultinomKernelDemo()
%% Setup Data
setSeed(0);
nClasses = 5;
nInstances = 100;
nVars = 2;
[X, y] = makeData('multinomialNonlinear', nInstances, nVars, nClasses);
.
.
.
```


## Sections ##

Break the demo into logical sections using two %% signs. The comment text on this line
is used as the section title and appears in the demos 'table' of contents.


```
%% Setup Data
setSeed(0);
nClasses = 5;
nInstances = 100;
nVars = 2;
[X, y] = makeData('multinomialNonlinear', nInstances, nVars, nClasses);
%% Settings
lambda    = 1e-2;
polyOrder = 2;
rbfScale  = 1;
%% No Kernel
modelLinear = logregFit(X, y, 'lambda', lambda);
%% 
fitkern = @(k,p)logregFit(X, y, 'lambda', lambda, 'kernelFn', k, 'kernelParam', p); 
%% Polynomial
modelPoly = fitkern(@kernelPoly, polyOrder); 
%% RBF
modelRBF = fitkern(@kernelRbfSigma, rbfScale); 
.
.
.
```

## Figures ##

Publishing automatically embeds any generated figures into the html document. You can control where these are placed in two ways: using %% double percent signs or by using the ` snapnow ` command. However, as Matlab simply executes the snapnow command when it sees %%, the latter is preferable.

Whenever publish encounters either of these, it immediately inserts any open figures, that have not already been inserted.

If you do not want the %% symbol to generate a subheading, do not include any text with it.

## Tags ##

We generate a number of [tables](contributingAuthors.md) automatically using various 'tags'. These are comment
strings that begin with PMTK as in `PMTKauthor, PMTKurl, PMTKdate PMTKslow `.
You should include these tags in the comments as in the following:

```
% PMTKauthor Matt Dunham
% PMTKurl www.mywebsite.com
% PMTKdate April 30, 2010
```

Include the PMTKslow tag if the demo takes more than 30 seconds to run. This just
excludes it from the debugDemos report. If the demo takes more than 30 minutes to
run, add the PMTKreallySlow tag, which tells publishDemos() not to actually run the
code, publishing only the text.

Place tags in their own comment block section, just after the title block section.

## Additional Formatting Options ##

There are a few other formatting options. Select the cell menu --> insert text markup
for details:
```
%%
% *BOLD TEXT* 
%%
% _ITALIC TEXT_ 
%%
% |MONOSPACED TEXT| 
%%
% <html>
% <table border=1><tr><td>one</td><td>two</td></tr></table>
% </html>
% 
%%
% 
%  PREFORMATTED
%  TEXT
% 
%%
% 
% <<FILENAME.PNG>>
% 
%%
% <http://www.mathworks.com The MathWorks> 
%%
% 
% * ITEM1
% * ITEM2
% 
%%
% 
% # ITEM1
% # ITEM2
% 
```
## Example ##

The published version looks like [this](http://pmtk3.googlecode.com/svn/trunk/docs/demoOutput/bookDemos/Discriminative_models_for_regression_and_classification/logregMultinomKernelDemo.html).

```

%% Multiclass Logistic Regression 
% In this demo, we fit a multiclass logistic regression model by first
% performing various basis expansions of the input features. This is a
% simplification of logregMultinomKernelMinfuncDemo.
%%
function logregMultinomKernelDemo()
%% Setup Data
setSeed(0);
nClasses = 5;
nInstances = 100;
nVars = 2;
[X, y] = makeData('multinomialNonlinear', nInstances, nVars, nClasses);
%% Settings
lambda    = 1e-2;
polyOrder = 2;
rbfScale  = 1;
%% No Kernel
modelLinear = logregFit(X, y, 'lambda', lambda);
%% 
fitkern = @(k,p)logregFit(X, y, 'lambda', lambda, 'kernelFn', k, 'kernelParam', p); 
%% Polynomial
modelPoly = fitkern(@kernelPoly, polyOrder); 
%% RBF
modelRBF = fitkern(@kernelRbfSigma, rbfScale); 
%% Compute training errors
[yhat, prob] = logregPredict(modelLinear, X); %#ok
trainErr_linear = mean(y~=yhat);
fprintf('Training error with raw features: %2.f%%\n', trainErr_linear*100);

[yhat, prob] = logregPredict(modelPoly, X); %#ok
trainErr_poly = mean(y~=yhat);
fprintf('Training error using a polynomial kernal of degree %d: %2.f%%\n', polyOrder,  trainErr_poly*100);

[yhat, prob] = logregPredict(modelRBF, X);
trainErr_rbf = mean(y~=yhat);
fprintf('Training error using an RBF kernel with scale %d: %2.f%%\n', rbfScale, trainErr_rbf*100);
%% Plot decision boundaries
plotDecisionBoundary(X, y, @(X)logregPredict(modelLinear, X));
title('Linear Multinomial Logistic Regression');
%%
predictFcn = @(Xtest) logregPredict(modelPoly, Xtest); 
plotDecisionBoundary(X, y, predictFcn);
title('Kernel-Poly Multinomial Logistic Regression');
%%
predictFcn = @(Xtest) logregPredict(modelRBF, Xtest); 
plotDecisionBoundary(X, y, predictFcn);
title('Kernel-RBF Multinomial Logistic Regression');
%%
end

```


## Preview your Demo ##

Once you're finished writing your demo, preview what the published version will look like using the [previewPublish()](http://matlabtools.googlecode.com/svn/trunk/metaTools/previewPublished.m) function.

```
previewPublish nameOfMyDemo
```


You can create a Matlab shortcut to preview the currently open document using this code:

```
shadowFunction({'pause', 'keyboard', 'input', 'placeFigures'});
SS = warning('query', 'all'); 
warning('off', 'all'); 
EDHANDLE = com.mathworks.mlservices.MLEditorServices;
CURRENTDOC = char(EDHANDLE.builtinGetActiveDocument);
[FPATH, DOC] = fileparts(CURRENTDOC);
previewPublished(DOC); 
warning(SS); 
clear EDHANDLE CURRENTDOC FPATH DOC SS
removeShadows();
```


## Things to Avoid ##

A few commands can interfere with publishing. In particular the command sequence
`figure(1); clf ` can cause problems. This is because Matlab publish uses
figure(1) itself. Its much better to create the figures explicitly and save the dynamically generate handles, as in

```
fig1 = figure()
fig2 = figure()
...
...
...
figure(fig1); clf
```


The use of ` close all ` should also be avoided.


Finally, do not include %% double percent signs within loops that will be executed many times. This significantly slows down publishing, as JIT compiling is turned off.