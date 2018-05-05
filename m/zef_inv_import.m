%Copyright © 2018, Sampsa Pursiainen
if not(isempty(zef.save_file_path)) & not(zef.save_file_path==0)  
[zef.file zef.file_path zef.file_type] = uigetfile({'*.mat','*.dat'},'Import',zef.save_file_path);
else
[zef.file zef.file_path zef.file_type] = uigetfile({'*.mat','*.dat'},'Import');
end
if zef.inv_import_type == 1;
    if not(isequal(zef.file,0));
    if zef.file_type == 1
    [zef.measurements] = struct2cell(load([zef.file_path zef.file]));
    zef.measurements = zef.measurements{1};
    else
[zef.measurements] = load([zef.file_path zef.file]);
    end
if iscell(zef.measurements)
    if isfield(zef,'h_inv_data_segment')
if ishandle(zef.h_inv_data_segment)
    set(zef.h_inv_data_segment,'enable','on');
end 
    end
end
if not(iscell(zef.measurements))
    if isfield(zef,'h_inv_data_segment')
if ishandle(zef.h_inv_data_segment)
    set(zef.h_inv_data_segment,'enable','off');
end 
    end
end
end
end
if zef.inv_import_type == 2;
if not(isequal(zef.file,0));
    if zef.file_type == 1
    [zef.reconstruction] = struct2cell(load([zef.file_path zef.file]));
    zef.reconstruction = zef.reconstruction{1};
    else
[zef.reconstruction] = load([zef.file_path zef.file]);
    end
    end
end

