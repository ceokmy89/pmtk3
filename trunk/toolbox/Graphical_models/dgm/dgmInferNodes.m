function [nodeBels, logZ] = dgmInferNodes(dgm, varargin)
%% Return all node beliefs (single marginals)
%% Inputs
%
% dgm    - a struct created by dgmCreate
% 
%% Optional named inputs
%
% 'clamped'  - a sparse vector of size 1-by-nnodes
%
% 'softev'   - softev(j, t) = p(Y(:, t) | S(t) = j, localCPD) as created by 
%              e.g. mkSoftEvidence. Use NaN columns for nodes without soft
%              evidence, and pad the ends of columns with NaNs for nodes
%              with nstates < max(nstates). softev is
%              max(nstates)-by-nnodes.
%
% 'localev'  - a d-by-nnodes matrix representing a (usually continuous)
%              observation sequence, which will be converted to factors
%              using localCPDs specified to dgmCreate. Use NaNs for 
%              unobserved nodes. 
%
% * you can specify both softev and localev, but not for the same node. 
%% Outputs
% 
% nodeBels   - a cell array of tabularFactors representing the normalized 
%              node beliefs (single marginals). 
%
% logZ       - log of the partition sum (if this is all you want, use
%              dgmLogZ)
%% Setup
[clamped, softev, localev] = process_options(varargin, ...
    'clamped', [], ...
    'softev' , [], ...
    'localev', []); 

engine    = dgm.infEngine; 
nnodes    = dgm.nnodes;
localFacs = dgmEv2LocalFacs(dgm, localev, softev); 
visVars   = find(clamped); 
hidVars   = setdiffPMTK(1:nnodes, visVars); 
G         = dgm.G; 
%% Run inference
switch lower(engine)
    
    case 'jtree' 
        
        if isfield(dgm, 'jtree') 
            jtree     = jtreeSliceCliques(dgm.jtree, clamped); 
        else                     
            doSlice   = true; 
            factors   = cpds2Factors(dgm.CPDs, G, dgm.CPDpointers);   
            factors   = addEvidenceToFactors(factors, clamped, doSlice); 
            jtree     = jtreeInit(factorGraphCreate(factors, G));
        end
        jtree         = jtreeAddFactors(jtree, localFacs); 
        [jtree, logZ] = jtreeCalibrate(jtree); 
        nodeBels      = jtreeQuery(jtree, num2cell(hidVars)); 
        
    case 'libdaijtree' 
        
        assert(isWeaklyConnected(G)); % libdai segfaults on disconnected graphs
        doSlice          = false;     % libdai often segfaults when slicing
        factors          = cpds2Factors(dgm.CPDs, G, dgm.CPDpointers);   
        factors          = addEvidenceToFactors(factors, clamped, doSlice); 
        [logZ, nodeBels] = libdaiJtree([factors(:); localFacs(:)]); 
        
    case 'varelim' 
        
        doSlice          = true; 
        factors          = cpds2Factors(dgm.CPDs, G, dgm.CPDpointers);   
        factors          = addEvidenceToFactors(factors, clamped, doSlice); 
        factors          = multiplyInLocalFactors(factors, localFacs);
        fg               = factorGraphCreate(factors, G);
        [logZ, nodeBels] = variableElimination(fg, num2cell(hidVars)); 
        
    case 'enum' 
        
        factors  = cpds2Factors(dgm.CPDs, G, dgm.CPDpointers);   
        factors  = multiplyInLocalFactors(factors, localFacs);
        joint    = tabularFactorMultiply(factors); 
        nodeBels = cell(nnodes, 1); 
        for i=1:nnodes
           [nodeBels{i}, logZ] = tabularFactorCondition(joint, i, clamped); 
        end
        
    otherwise, error('%s is not a valid inference engine', dgm.infEngine);
        
end
%%
nodeBels = insertClampedBels(nodeBels, visVars, hidVars);
end


function padded = insertClampedBels(nodeBels, visVars, hidVars)
% We insert unit factors for the clamped vars to maintain a one-to-one 
% corresponence between cell array position and domain, and to return
% consistent results regardless of the inference method. 
if isempty(visVars)
    padded = nodeBels; 
    return; 
end
nvars = numel(visVars) + numel(hidVars); 
padded = cell(nvars, 1);
if numel(nodeBels) == nvars
    padded(hidVars) = nodeBels(hidVars);     
else
    padded(hidVars) = nodeBels; 
end

for v = visVars
   padded{v} = tabularFactorCreate(1, v); 
end

end