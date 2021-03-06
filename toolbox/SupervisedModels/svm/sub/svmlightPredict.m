function yhat = svmlightPredict(model, Xtest)
% PMTK interface to svmlight
% which must be on the system path.
%
% model  - a struct generated by svmlightFit()
% yhat   - output is in {-1, 1}, (unless regression)

% This file is from pmtk3.googlecode.com


% You can use the addtosystempath function to add the directory containing
% svm_classify.exe.

testOptions = '';
tmp = tempdir();
testFile    = fullfile(tmp, 'test.svm');
modelFile   = model.file;
resultsFile = fullfile(tmp, 'results.svm');
svmlightWriteData(Xtest, zeros(size(Xtest, 1), 1), testFile, '%d');
command = sprintf('svm_classify %s %s %s %s',...
    testOptions, testFile, modelFile, resultsFile);
[iserror, response] = system(command);
if iserror
    error('There was a problem calling svmlight (svm_classify): %s', response);
end
yhat = dlmread(resultsFile);
if strcmp(model.problemType, 'classification')
    yhat = sign(yhat);
end
end
