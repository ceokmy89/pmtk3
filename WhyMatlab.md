  * We chose Matlab for several reasons: it is ideally suited to mathematical code, having an almost 1:1 mapping between equations and commands; it is widely used in machine learning; and we have a large existing code base in Matlab.

  * In pmtk3, we deliberately avoided using the nice object oriented features of matlab so that the code will still run on octave. This has the advantage of being free. Our preferred mode of operation is to develop code locally in matlab, exploiting its excellent graphics and integrated developement environment (editor, profiler, debugger), then run large scale code on a network of computers running octave.

  * We did not choose R for several reasons: while R has many useful statistical packages, many of them are merely wrappers to C or Fortan code, making it hard to understand and/or modify the algorithms; Matlab is about 2-5 times faster than R (click <a href='http://mlg.eng.cam.ac.uk/dave/rmbenchmark.php'>here</a> for a comparison); R was originally designed for frequentist statistics, whereas Matlab is neutral in this respect (not being designed for statistics at all), and thus makes a more natural foundation for Bayesian software; Matlab sourcecode is easier to read. For example, compare the following code fragments in Matlab and R

```
A = reshape([6,2,0,2,6,0,0,0,36],3,3);
[V,L] = eig(A);
AA = V*L*V';
```

```
A = matrix(c(6,2,0,2,6,0,0,0,36), nrow=3))
res = eigen(A, symmetric=T)
AA = res$vec %*% diag(res$val) %*% t(res$vec)
```

  * In the future we may port to python. This seems to be growing in popularity within the machine learning community.