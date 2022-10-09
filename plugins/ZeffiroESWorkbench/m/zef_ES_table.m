function [vec, variable_names, metacriteria_list, metacriteria_type, metacriteria_ind] = zef_ES_table(zef)

if nargin==0
zef = evalin('base','zef');
end


variable_names = {'Total dose (mA)', ...
    'Residual difference measure (%) [min]', ...
    'Maximum current (mA) [max]', ...
    'Sparsity (L2/L1-norm) ratio (%) [max]',...
    'Focused current density (A/m^2) [max]', ...
    'Angle error (deg) [min]', ...
    'Relative magnitude difference (%) [min]', ...
    'Relative difference measure (%) [min]', ...
    'Field ratio (Focality) [max]',...
    'NNZ [min]',...
    'Run time (s)',...
    'Alpha (dB)', ...
    'Beta (dB)',...
    'Optimizer flag value'};

metacriteria_type = {'none','minimum','maximum','maximum','maximum','minimum','minimum','minimum','maximum','minimum','none','none','none','none'};
metacriteria_ind = find(not(ismember(metacriteria_type,'none')));
metacriteria_list = variable_names(metacriteria_ind);
metacriteria_type = metacriteria_type(metacriteria_ind);

if isfield(zef,'y_ES_interval')
    load_aux = eval('zef.y_ES_interval');
else
    zef.y_ES_interval = cell(0);
    load_aux = zef.y_ES_interval;
end
    description_string = ['Optimizer: ' eval('zef.ES_search_type_list{zef.ES_search_type}') ', Algorithm: ' eval('zef.ES_algorithm') '.'];

    ES_y =[];
    ES_residual = [];
    ES_max = [];
    ES_cp_ratio = [];
    ES_amplitude = [];
    ES_angle_error = [];
    ES_mag = [];
    ES_rdm = [];
    ES_field_ratio = [];
    ES_nnz = [];
    ES_run_time = [];
    ES_alpha = [];
    ES_beta = [];
    ES_flag = [];

if not(isempty(load_aux))

    if isfield(load_aux,'y_ES')
     ES_y               = zeros(size(load_aux.y_ES));   
     ES_cp_ratio        = zeros(size(load_aux.y_ES));
     ES_max             = zeros(size(load_aux.y_ES));
    end
    
    if isfield(load_aux,'residual')
     ES_residual        = 100*cell2mat(load_aux.residual);
    end
    
    if isfield(load_aux,'flag')
     ES_flag            = cell2mat(load_aux.flag')';
    end
    
   if isfield(load_aux,'field_source')   
    ES_amplitude      = cell2mat(load_aux.field_source.amplitude')';
    ES_angle_error     = cell2mat(load_aux.field_source.angle')';
   ES_mag       = 100*cell2mat(load_aux.field_source.relative_norm_error')';
   ES_rdm      = 100*cell2mat(load_aux.field_source.relative_error')';
   ES_off_field       = cell2mat(load_aux.field_source.avg_off_field')';
  end
  
  if isfield(load_aux,'run_time')
   ES_run_time = cell2mat(load_aux.run_time')';
  end
  
  if and(not(isempty(ES_amplitude)),not(isempty(ES_off_field)))
   ES_field_ratio           = max(0, ES_amplitude./ES_off_field);
  end
      
  if isfield(load_aux,'alpha')
   ES_alpha           = db(load_aux.alpha);
  end
      
  if isfield(load_aux,'beta')    
   ES_beta            = db(load_aux.beta);
  end
   
  if isfield(load_aux,'nnz')
   ES_nnz             = cell2mat(load_aux.nnz')';
  end

for i = 1:size(load_aux.y_ES, 1)
    for j = 1:size(load_aux.y_ES, 2)
        ES_y(i,j)   =        1000* norm(cell2mat(load_aux.y_ES(i,j)), 1);
        ES_max(i,j) =          1000*max(abs(cell2mat(load_aux.y_ES(i,j))));
        ES_cp_ratio(i,j) = 100*sqrt(2)*norm(cell2mat(load_aux.y_ES(i,j)),2)/norm(cell2mat(load_aux.y_ES(i,j)),1);
    end
end

end

vec = array2table({...
    ES_y, ...
    ES_residual, ...
    ES_max, ...
    ES_cp_ratio, ...
ES_amplitude,...
    ES_angle_error, ...
    ES_mag, ...
    ES_rdm, ...
    ES_field_ratio, ...
    ES_nnz,...
    ES_run_time,...
    ES_alpha, ...
    ES_beta,...
ES_flag});


vec.Properties.VariableNames = variable_names;

vec.Properties.Description = description_string;

end
   
