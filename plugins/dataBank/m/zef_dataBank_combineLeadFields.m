function [L, y] = zef_dataBank_combineLeadFieLds(tree, workingHashes, varargin)

L_aux = cell(0);
y_aux = cell(0);
data_ind = 0; 
lf_ind = 0; 

approach = 'frobenius';

start_time = [];
end_time = [];
sampling_rate = [];

if not(isempty(varargin))

if length(varargin) > 0 
approach = varargin{1};
end

if length(varargin) > 1
start_time = varargin{2};
end
  
if length(varargin) > 1
end_time = varargin{3};
end

if length(varargin) > 1
sampling_rate = varargin{4};
end

if not(isempty(sampling_rate))
 y_ind_1 = round(start_time*sampling_rate);
 y_ind_2 = round(end_time*sampling_rate);
end

end

for i = 1 : length(workingHashes)

    if isequal(tree.(workingHashes{i}).data.type,'data')
data_ind = data_ind + 1;   
y_aux{data_ind} = tree.(workingHashes{i}).data.measurements;
    elseif  isequal(tree.(workingHashes{i}).data.type,'leadfield')
        lf_ind = lf_ind + 1;
        L_aux{lf_ind} = tree.(workingHashes{i}).data.L;
    end  


end

fro_L_aux = cell(0);
amp_L_aux = zeros(length(L_aux),1);
size_L_aux = zeros(length(L_aux),1);

for i = 1 : length(L_aux)
   
    if isequal(approach,'fuchs')
    fro_L_aux{i} = std(y_aux{i}(:,y_ind_1:y_ind_2),0,2);
    elseif isequal(approach,'source_space_std')
    fro_L_aux{i} = std(L_aux{i},0,2);
    elseif isequal(approach,'frobenius')
    fro_L_aux{i} = norm(L_aux{i},'fro')/size(L_aux{i},1);
    end
    amp_L_aux(i) = max(abs(L_aux{i}(:)));
    size_L_aux(i) = size(L_aux{i},1);
    
end

L = zeros(sum(size_L_aux), size(L_aux{1},2));
y = zeros(sum(size_L_aux), size(y_aux{1},2));
subs_ind = 0;
max_amp_L_aux = max(amp_L_aux);

for i = 1 : length(L_aux)
    
    L_aux{i} = L_aux{i}./repmat(fro_L_aux{i},1,size(L_aux{i},2));
    y_aux{i} = y_aux{i}./repmat(fro_L_aux{i},1,size(y_aux{i},2));
   
    L(subs_ind + 1:subs_ind + size_L_aux(i), :) = L_aux{i};
    y(subs_ind + 1:subs_ind + size_L_aux(i), :) = y_aux{i};
    subs_ind = subs_ind + size_L_aux(i);
    
end

max_amp_L = max(abs(L(:)));
L = max_amp_L_aux*L/max_amp_L;
y = max_amp_L_aux*y/max_amp_L;

end