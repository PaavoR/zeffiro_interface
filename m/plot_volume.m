%Copyright © 2018, Sampsa Pursiainen
function [void] = plot_volume(void);

void = [];

aux_wm_ind = -1;

number_of_frames = evalin('base','zef.number_of_frames');
axes(evalin('base','zef.h_axes1'));
cla(evalin('base','zef.h_axes1'));
set(evalin('base','zef.h_axes1'),'layer','top');
set(evalin('base','zef.h_axes1'),'YDir','normal');
h_axes_text = findobj(evalin('base','zef.h_zeffiro'),'tag','image_details');
if not(isempty(h_axes_text))
delete(h_axes_text); 
h_axes_text = [];
end
h_colorbar = findobj(evalin('base','zef.h_zeffiro'),'tag','Colorbar');
if not(isempty(h_colorbar))
colorbar(h_colorbar,'delete'); 
h_colorbar = [];
end

hold on;
light('Position',[0 0 1],'Style','infinite');
light('Position',[0 0 -1],'Style','infinite');


cp_a = evalin('base','zef.cp_a');
cp_b = evalin('base','zef.cp_b');
cp_c = evalin('base','zef.cp_c');
cp_d = evalin('base','zef.cp_d');
cp2_a = evalin('base','zef.cp2_a');
cp2_b = evalin('base','zef.cp2_b');
cp2_c = evalin('base','zef.cp2_c');
cp2_d = evalin('base','zef.cp2_d');
cp3_a = evalin('base','zef.cp3_a');
cp3_b = evalin('base','zef.cp3_b');
cp3_c = evalin('base','zef.cp3_c');
cp3_d = evalin('base','zef.cp3_d');

sensors = evalin('base','zef.sensors');
surface_triangles = evalin('base','zef.surface_triangles');
nodes = evalin('base','zef.nodes');
[X_s, Y_s, Z_s] = sphere(20);
if size(sensors,2) == 6 & ismember(evalin('base','zef.imaging_method'), [1 3 4])
    electrode_model = 2;
else
    electrode_model = 1;
end

aux_ind = []; 
if evalin('base','zef.s_visible')
sphere_scale = 3.7;    
X_s = sphere_scale*X_s;
Y_s = sphere_scale*Y_s;
Z_s = sphere_scale*Z_s;
if evalin('base','zef.cp_on');
if not(isempty(aux_ind))
aux_ind = intersect(aux_ind,find(sum(sensors(:,1:3).*repmat([cp_a cp_b cp_c],size(sensors,1),1),2) >= cp_d));
else
aux_ind = [find(sum(sensors(:,1:3).*repmat([cp_a cp_b cp_c],size(sensors,1),1),2) >= cp_d)];
end
end
if evalin('base','zef.cp2_on');
if not(isempty(aux_ind))
aux_ind = intersect(aux_ind,find(sum(sensors(:,1:3).*repmat([cp2_a cp2_b cp2_c],size(sensors,1),1),2) >= cp2_d));
else
aux_ind = [find(sum(sensors(:,1:3).*repmat([cp2_a cp2_b cp2_c],size(sensors,1),1),2) >= cp2_d)];
end
end
if evalin('base','zef.cp3_on');
if not(isempty(aux_ind))
aux_ind = intersect(aux_ind,find(sum(sensors(:,1:3).*repmat([cp3_a cp3_b cp3_c],size(sensors,1),1),2) >= cp3_d));
else
aux_ind = [find(sum(sensors(:,1:3).*repmat([cp3_a cp3_b cp3_c],size(sensors,1),1),2) >= cp3_d)];
end
end
if evalin('base','zef.cp_on') || evalin('base','zef.cp2_on') || evalin('base','zef.cp3_on')
if evalin('base','zef.cp_mode') == 1
sensors = sensors(aux_ind,:);
elseif evalin('base','zef.cp_mode') == 2
aux_ind = setdiff([1:size(sensors,1)]',aux_ind);
sensors = sensors(aux_ind,:);   
end
end
aux_ind = [];

if electrode_model == 1 & evalin('base','zef.attach_electrodes') & ismember(evalin('base','zef.imaging_method'),[1 3 4]) 
sensors = attach_sensors_volume(sensors); 
elseif electrode_model==2  & ismember(evalin('base','zef.imaging_method'),[1 3 4]) 
sensors = attach_sensors_volume(sensors);
end

if electrode_model == 1
for i = 1 : size(sensors,1)
h = surf(sensors(i,1) + X_s, sensors(i,2) + Y_s, sensors(i,3) + Z_s);
set(h,'facecolor',evalin('base','zef.s_color'));
set(h,'edgecolor','none');
set(h,'specularstrength',0.1);
set(h,'diffusestrength',0.3);
set(h,'ambientstrength',0.3);
set(h,'facealpha',evalin('base','zef.layer_transparency'));
end
else
h = trisurf(sensors(:,2:4),nodes(:,1),nodes(:,2),nodes(:,3));
set(h,'facecolor',evalin('base','zef.s_color'));
set(h,'edgecolor',evalin('base','zef.s_color')); 
set(h,'specularstrength',0.1);
set(h,'diffusestrength',0.3);
set(h,'ambientstrength',0.3);
set(h,'facealpha',evalin('base','zef.layer_transparency'));
set(h,'edgealpha',evalin('base','zef.layer_transparency'));    
end
if evalin('base','zef.imaging_method')==2
sensors(:,4:6) = sensors(:,4:6)./repmat(sqrt(sum(sensors(:,4:6).^2,2)),1,3);
h=coneplot(sensors(:,1) + 4.5*sensors(:,4),sensors(:,2) + 4.5*sensors(:,5),sensors(:,3) + 4.5*sensors(:,6),8*sensors(:,4),8*sensors(:,5),8*sensors(:,6),0,'nointerp');
set(h,'facecolor',evalin('base','zef.s_color'));
set(h,'edgecolor','none'); 
set(h,'specularstrength',0.1);
set(h,'diffusestrength',0.3);
set(h,'ambientstrength',0.3);
set(h,'facealpha',evalin('base','zef.layer_transparency'));
end
end



i = 0;
length_reuna = 0;
sigma_vec = [];
priority_vec = [];
visible_vec = [];
color_cell = cell(0);
for k = 1 : 9   
switch k
    case 1
        var_0 = 'zef.d1_on';
        var_1 = 'zef.d1_sigma';
        var_2 = 'zef.d1_priority';
        var_3 = 'zef.d1_visible';
    color_str = evalin('base','zef.d1_color');
     case 2
        var_0 = 'zef.d2_on';
        var_1 = 'zef.d2_sigma';   
        var_2 = 'zef.d2_priority';
        var_3 = 'zef.d2_visible';
        color_str = evalin('base','zef.d2_color');
     case 3
        var_0 = 'zef.d3_on';
        var_1 = 'zef.d3_sigma';   
        var_2 = 'zef.d3_priority';
        var_3 = 'zef.d3_visible';
        color_str = evalin('base','zef.d3_color');
     case 4
        var_0 = 'zef.d4_on';
        var_1 = 'zef.d4_sigma';   
        var_2 = 'zef.d4_priority';
        var_3 = 'zef.d4_visible';
        color_str = evalin('base','zef.d4_color');
    case 5
        var_0 = 'zef.w_on';
        var_1 = 'zef.w_sigma';    
        var_2 = 'zef.w_priority';
        var_3 = 'zef.w_visible';
        color_str = evalin('base','zef.w_color');
    case 6
        var_0 = 'zef.g_on';
        var_1 = 'zef.g_sigma';
        var_2 = 'zef.g_priority';
        var_3 = 'zef.g_visible';
        color_str = evalin('base','zef.g_color');
    case 7
        var_0 = 'zef.c_on';
        var_1 = 'zef.c_sigma';
        var_2 = 'zef.c_priority';
        var_3 = 'zef.c_visible';
        color_str = evalin('base','zef.c_color');
     case 8
        var_0 = 'zef.sk_on';
        var_1 = 'zef.sk_sigma';
        var_2 = 'zef.sk_priority';
        var_3 = 'zef.sk_visible';
        color_str = evalin('base','zef.sk_color');
     case 9
        var_0 = 'zef.sc_on';
        var_1 = 'zef.sc_sigma';
        var_2 = 'zef.sc_priority';
        var_3 = 'zef.sc_visible';
        color_str = evalin('base','zef.sc_color');
     end
on_val = evalin('base',var_0);      
sigma_val = evalin('base',var_1);  
priority_val = evalin('base',var_2);
visible_val = evalin('base',var_3);
if on_val
i = i + 1;
sigma_vec(i,1) = sigma_val;
priority_vec(i,1) = priority_val;
color_cell{i} = color_str;
visible_vec(i,1) = i*visible_val;
if k == 6;
    aux_brain_ind = i;
end
if k == 5;
    aux_wm_ind = i;
end
end
end

johtavuus = evalin('base','zef.sigma');
johtavuus = johtavuus(:,2);
 
I = find(ismember(johtavuus,visible_vec));
johtavuus = johtavuus(I);
tetra = evalin('base','zef.tetra');
tetra = tetra(I,:);
tetra_c = (1/4)*(nodes(tetra(:,1),:) + nodes(tetra(:,2),:) + nodes(tetra(:,3),:) + nodes(tetra(:,4),:));

aux_ind = [];
if evalin('base','zef.cp_on');

aux_ind = [find(sum(tetra_c.*repmat([cp_a cp_b cp_c],size(tetra_c,1),1),2) >= cp_d)];
end
if evalin('base','zef.cp2_on');

if not(isempty(aux_ind))
aux_ind = intersect(aux_ind,find(sum(tetra_c.*repmat([cp2_a cp2_b cp2_c],size(tetra_c,1),1),2) >= cp2_d));
else
aux_ind = [find(sum(tetra_c.*repmat([cp2_a cp2_b cp2_c],size(tetra_c,1),1),2) >= cp2_d)];
end
end
if evalin('base','zef.cp3_on');

if not(isempty(aux_ind))
aux_ind = intersect(aux_ind,find(sum(tetra_c.*repmat([cp3_a cp3_b cp3_c],size(tetra_c,1),1),2) >= cp3_d));
else
aux_ind = [find(sum(tetra_c.*repmat([cp3_a cp3_b cp3_c],size(tetra_c,1),1),2) >= cp3_d)];
end
end

if evalin('base','zef.cp_on') || evalin('base','zef.cp2_on') || evalin('base','zef.cp3_on')
if evalin('base','zef.cp_mode') == 1
tetra = tetra(aux_ind,:);
elseif evalin('base','zef.cp_mode') == 2
aux_ind = setdiff([1:size(tetra,1)]',aux_ind);
tetra = tetra(aux_ind,:);   
elseif evalin('base','zef.cp_mode') == 3
aux_ind = union(aux_ind,find(johtavuus==aux_brain_ind));
tetra = tetra(aux_ind,:);  
elseif evalin('base','zef.cp_mode') == 4
aux_ind = setdiff([1:size(tetra,1)]',aux_ind);
aux_ind = union(aux_ind,find(johtavuus==aux_brain_ind));
tetra = tetra(aux_ind,:);  
end
else
aux_ind = [1:size(tetra,1)]';
end;
I_aux = I(aux_ind);

 ind_m = [ 2 4 3 ;
           1 3 4 ;
           1 4 2 ; 
           1 2 3 ]; 

tetra_sort = [tetra(:,[2 4 3]) ones(size(tetra,1),1) [1:size(tetra,1)]'; 
              tetra(:,[1 3 4]) 2*ones(size(tetra,1),1) [1:size(tetra,1)]'; 
              tetra(:,[1 4 2]) 3*ones(size(tetra,1),1) [1:size(tetra,1)]'; 
              tetra(:,[1 2 3]) 4*ones(size(tetra,1),1) [1:size(tetra,1)]';];
tetra_sort(:,1:3) = sort(tetra_sort(:,1:3),2);
tetra_sort = sortrows(tetra_sort,[1 2 3]);
tetra_ind = zeros(size(tetra_sort,1),1);
I = find(sum(abs(tetra_sort(2:end,1:3)-tetra_sort(1:end-1,1:3)),2)==0);
tetra_ind(I) = 1;
tetra_ind(I+1) = 1;
I = find(tetra_ind == 0);
tetra_ind = sub2ind(size(tetra),repmat(tetra_sort(I,5),1,3),ind_m(tetra_sort(I,4),:));
surface_triangles = tetra(tetra_ind);
tetra_ind = tetra_sort(I,5);
clear tetra_sort;

n_compartments = i;

max_abs_reconstruction = -Inf;
min_rec = Inf;
max_rec = -Inf;
frame_start = 1;
frame_stop = 1;
frame_step = 1;
if iscell(evalin('base','zef.reconstruction')) &  evalin('base','zef.visualization_type') == 2
length_reconstruction_cell = length(evalin('base','zef.reconstruction'));
s_i_ind = evalin('base','zef.source_interpolation_ind{1}');
frame_start = evalin('base','zef.frame_start');
frame_stop = evalin('base','zef.frame_stop');
frame_step = evalin('base','zef.frame_step');
if frame_start == 0
    frame_start = 1;
end
if frame_stop == 0
    frame_stop = length_reconstruction_cell;
end
frame_start = max(frame_start,1);
frame_start = min(length_reconstruction_cell,frame_start);
frame_stop = max(frame_stop,1);
frame_stop = min(length_reconstruction_cell,frame_stop);
number_of_frames = length([frame_start : frame_step : frame_stop]);
for f_ind = frame_start : frame_step : frame_stop
reconstruction = evalin('base',['zef.reconstruction{' int2str(f_ind) '}']);
reconstruction = reconstruction(:);  
reconstruction = reshape(reconstruction,3,length(reconstruction)/3);
reconstruction = sqrt(sum(reconstruction.^2))';
reconstruction = sum(reconstruction(s_i_ind),2)/4;
max_abs_reconstruction = max([max_abs_reconstruction ; abs(reconstruction(:))]);
min_rec = min([min_rec ; (reconstruction(:))]);
max_rec = max_abs_reconstruction;
end
if evalin('base','zef.inv_scale') == 1
min_rec = 10*log10(max(min_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
max_rec = 10*log10(max(max_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
elseif evalin('base','zef.inv_scale') == 2
min_rec = (max(min_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
max_rec = (max(max_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
elseif evalin('base','zef.inv_scale') == 3
min_rec = sqrt(max(min_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));    
max_rec = sqrt(max(max_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));    
end
elseif  evalin('base','zef.visualization_type') == 2
s_i_ind = evalin('base','zef.source_interpolation_ind{1}');
reconstruction = evalin('base','zef.reconstruction');
reconstruction = reconstruction(:);  
reconstruction = reshape(reconstruction,3,length(reconstruction)/3);
reconstruction = sqrt(sum(reconstruction.^2))';
reconstruction = sum(reconstruction(s_i_ind),2)/4;
max_abs_reconstruction = max([max_abs_reconstruction ; abs(reconstruction(:))]);
min_rec = min([min_rec ; (reconstruction(:))]);
max_rec = max_abs_reconstruction;
if evalin('base','zef.inv_scale') == 1
min_rec = 10*log10(max(min_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
max_rec = 10*log10(max(max_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
elseif evalin('base','zef.inv_scale') == 2
min_rec = (max(min_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
max_rec = (max(max_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
elseif evalin('base','zef.inv_scale') == 3
min_rec = sqrt(max(min_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));    
max_rec = sqrt(max(max_rec/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));    
end
end
if  iscell(evalin('base','zef.reconstruction')) & evalin('base','zef.visualization_type') == 2
h_waitbar = waitbar(1/number_of_frames,['Frame ' int2str(1) ' of ' int2str(number_of_frames) '.']);    
set(h_waitbar,'handlevisibility','off');
end
f_ind_aux = 1;
for f_ind = frame_start : frame_start
if  iscell(evalin('base','zef.reconstruction')) & evalin('base','zef.visualization_type') == 2    
waitbar(f_ind_aux/number_of_frames,h_waitbar,['Frame ' int2str(f_ind_aux) ' of ' int2str(number_of_frames) '.']);    
set(h_waitbar,'handlevisibility','off');
end
axes(evalin('base','zef.h_axes1'));
if not(isempty(h_colorbar))
colorbar(h_colorbar,'delete'); 
h_colorbar = [];
end
hold on;
%**************************************************************************
if evalin('base','zef.visualization_type') == 2
brain_ind = evalin('base','zef.brain_ind');
[aux_vec, brain_ind, I_2] = intersect(I_aux,brain_ind);
clear aux_vec;
johtavuus(aux_ind(brain_ind))=0;
if iscell(evalin('base','zef.reconstruction'))
reconstruction = evalin('base',['zef.reconstruction{' int2str(f_ind) '}']);
else
reconstruction = evalin('base','zef.reconstruction');  
end
reconstruction = reconstruction(:);  
reconstruction = reshape(reconstruction,3,length(reconstruction)/3);

if evalin('base','zef.reconstruction_type') == 1
reconstruction = sqrt(sum(reconstruction.^2))';
reconstruction = sum(reconstruction(s_i_ind),2)/4;
reconstruction = reconstruction(I_2);
I_2_b_rec = I_2;
I_3 = find(ismember(tetra_ind,brain_ind));
I_3_rec = I_3;
I_2 = zeros(length(aux_ind),1);
I_2(brain_ind) = [1:length(brain_ind)]';
I_2_rec = I_2;
I_1 = tetra_ind(I_3);
I_1_rec = I_1;
reconstruction = reconstruction(I_2(I_1));
end

if evalin('base','zef.reconstruction_type') > 1
rec_x = reconstruction(1,:)';
rec_y = reconstruction(2,:)';
rec_z = reconstruction(3,:)';
rec_x = sum(rec_x(s_i_ind),2)/4;
rec_y = sum(rec_y(s_i_ind),2)/4;
rec_z = sum(rec_z(s_i_ind),2)/4;
rec_x = rec_x(I_2);
rec_y = rec_y(I_2);
rec_z = rec_z(I_2);
I_2_b_rec = I_2;
I_3 = find(ismember(tetra_ind,brain_ind));
I_3_rec = I_3;
I_2 = zeros(length(aux_ind),1);
I_2(brain_ind) = [1:length(brain_ind)]';
I_2_rec = I_2;
I_1 = tetra_ind(I_3);
I_1_rec = I_1;
rec_x = rec_x(I_2(I_1));
rec_y = rec_y(I_2(I_1));
rec_z = rec_z(I_2(I_1));
n_vec_aux = cross(nodes(surface_triangles(I_3,2),:)' - nodes(surface_triangles(I_3,1),:)',...
nodes(surface_triangles(I_3,3),:)' - nodes(surface_triangles(I_3,1),:)')';
n_vec_aux = n_vec_aux./repmat(sqrt(sum(n_vec_aux.^2,2)),1,3);
end 

if evalin('base','zef.reconstruction_type') > 1
reconstruction = sqrt((rec_x.*n_vec_aux(:,1)).^2 + (rec_y.*n_vec_aux(:,2)).^2 + (rec_z.*n_vec_aux(:,3)).^2);
end

if evalin('base','zef.reconstruction_type') == 3
reconstruction = sqrt((rec_x - reconstruction.*n_vec_aux(:,1)).^2 + (rec_y - reconstruction.*n_vec_aux(:,2)).^2 + (rec_z - reconstruction.*n_vec_aux(:,3)).^2);
end

if evalin('base','zef.reconstruction_type') == 4
aux_rec = rec_x.*n_vec_aux(:,1) + rec_y.*n_vec_aux(:,2) + rec_z.*n_vec_aux(:,3);
I_aux_rec = find(aux_rec > 0);
reconstruction(I_aux_rec) = 0;
%reconstruction = reconstruction./max(abs(reconstruction(:)));
end

if evalin('base','zef.reconstruction_type') == 5 
aux_rec = rec_x.*n_vec_aux(:,1) + rec_y.*n_vec_aux(:,2) + rec_z.*n_vec_aux(:,3);
I_aux_rec = find(aux_rec <= 0);
reconstruction(I_aux_rec) = 0;
%reconstruction = reconstruction./max(abs(reconstruction(:)));
end

if evalin('base','zef.reconstruction_type') > 1
reconstruction = smooth_field(surface_triangles(I_3,:), reconstruction, size(nodes,1),3);
end

if evalin('base','zef.inv_scale') == 1
reconstruction = 10*log10(max(reconstruction/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
elseif evalin('base','zef.inv_scale') == 2
reconstruction = (max(reconstruction/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));    
elseif evalin('base','zef.inv_scale') == 3
reconstruction = sqrt(max(reconstruction/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));    
end


colormap_size = 4096;
if evalin('base','zef.inv_colormap') == 1
c_aux_1 = floor(colormap_size/3);
c_aux_2 = floor(2*colormap_size/3);
colormap_vec_aux = [([20*[c_aux_1:-1:1] zeros(1,colormap_size-c_aux_1)]); ([15*[1: c_aux_1] 15*[c_aux_2-c_aux_1:-1:1] zeros(1,colormap_size-c_aux_2)]) ; ([zeros(1,c_aux_1) 6*[1:c_aux_2-c_aux_1] 6*[colormap_size-c_aux_2:-1:1]]);([zeros(1,c_aux_2) 7.5*[1:colormap_size-c_aux_2]])];
colormap_vec = zeros(3,size(colormap_vec_aux,2));
colormap_vec = colormap_vec + 0.52*[50*colormap_vec_aux(1,:) ; 50*colormap_vec_aux(1,:) ; 50*colormap_vec_aux(1,:)];
colormap_vec = colormap_vec + 0.5*[85*colormap_vec_aux(3,:) ; 197*colormap_vec_aux(3,:) ; 217*colormap_vec_aux(3,:)];
colormap_vec = colormap_vec + 0.1*[2*colormap_vec_aux(2,:) ; 118*colormap_vec_aux(2,:) ; 132*colormap_vec_aux(2,:)];
colormap_vec = colormap_vec + [203*colormap_vec_aux(4,:) ; 203*colormap_vec_aux(4,:) ; 100*colormap_vec_aux(4,:)];
clear colormap_vec_aux;
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = colormap_vec(:,1:3);
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 2
c_aux_1 = floor(colormap_size/3);
c_aux_2 = floor(2*colormap_size/3);
colormap_vec = zeros(3,colormap_size);
colormap_vec(1,:) =10*([colormap_size:-1:1]/colormap_size);
colormap_vec(2,:) = [10*( (3/2)*[c_aux_2:-1:1]/colormap_size) zeros(1,colormap_size-c_aux_2)];
colormap_vec(3,:) = [10*((3)*[c_aux_1:-1:1]/colormap_size) zeros(1,colormap_size-c_aux_1)];  
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
colormap_vec = colormap_vec(:,1:3);
colormap_vec = colormap_vec + repmat(0.2*([colormap_size:-1:1]'/colormap_size),1,3);
colormap_vec = colormap_vec/max(colormap_vec(:));
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 3
c_aux_1 = floor(colormap_size/3);
c_aux_2 = floor(2*colormap_size/3);
colormap_vec = zeros(3,colormap_size);
colormap_vec(2,:) = 10*([colormap_size:-1:1]/colormap_size);
colormap_vec(1,:) = [10*(3/2)*[c_aux_2:-1:1]/colormap_size zeros(1,colormap_size-c_aux_2)];
colormap_vec(3,:) = [10*(3*[c_aux_1:-1:1]/colormap_size) zeros(1,colormap_size-c_aux_1)];
%colormap_vec([1 3 2],:) = 0.75*colormap_vec([1 3 2],:) + 0.25*colormap_vec([1 2 3],:);
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
colormap_vec = colormap_vec(:,1:3);
colormap_vec = colormap_vec + repmat(0.2*([colormap_size:-1:1]'/colormap_size),1,3);
colormap_vec = colormap_vec/max(colormap_vec(:));
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 4
c_aux_1 = floor(colormap_size/3);
c_aux_2 = floor(2*colormap_size/3);
colormap_vec = zeros(3,colormap_size);
colormap_vec(3,:) = 10*([colormap_size:-1:1]/colormap_size);
colormap_vec(2,:) = [10*(3/2)*[c_aux_2:-1:1]/colormap_size zeros(1,colormap_size-c_aux_2)];
colormap_vec(1,:) = [10*(3*[c_aux_1:-1:1]/colormap_size) zeros(1,colormap_size-c_aux_1)];
%colormap_vec([1 3 2],:) = 0.75*colormap_vec([1 3 2],:) + 0.25*colormap_vec([1 2 3],:);
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
colormap_vec = colormap_vec(:,1:3);
colormap_vec = colormap_vec + repmat(0.2*([colormap_size:-1:1]'/colormap_size),1,3);
colormap_vec = colormap_vec/max(colormap_vec(:));
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 5
c_aux_1 = floor(colormap_size/3);
c_aux_2 = floor(2*colormap_size/3);
colormap_vec = [([20*[c_aux_1:-1:1] zeros(1,colormap_size-c_aux_1)]); ([15*[1: c_aux_1] 15*[c_aux_2-c_aux_1:-1:1] zeros(1,colormap_size-c_aux_2)]) ; ([zeros(1,c_aux_1) 6*[1:c_aux_2-c_aux_1] 6*[colormap_size-c_aux_2:-1:1]]);([zeros(1,c_aux_2) 7.5*[1:colormap_size-c_aux_2]])];
colormap_vec([1 2],:) = colormap_vec([2 1],:);
colormap_vec(1,:) = colormap_vec(1,:) + colormap_vec(2,:);
colormap_vec(3,:) = colormap_vec(4,:) + colormap_vec(3,:);
colormap_vec(2,:) = colormap_vec(4,:) + colormap_vec(2,:);
colormap_vec(1,:) = colormap_vec(4,:) + colormap_vec(1,:);
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
colormap_vec = colormap_vec(:,1:3);
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 6
c_aux_1 = floor(colormap_size/3);
c_aux_2 = floor(2*colormap_size/3);
c_aux_3 = floor(colormap_size/2);
colormap_vec = [([20*[c_aux_3:-1:1] zeros(1,colormap_size-c_aux_3)]); ([15*[1: c_aux_1] 15*[c_aux_2-c_aux_1:-1:1] zeros(1,colormap_size-c_aux_2)]) ; ([zeros(1,c_aux_1) 7*[1:c_aux_2-c_aux_1] 7*[colormap_size-c_aux_2:-1:1]]);([zeros(1,c_aux_2) 10.5*[1:colormap_size-c_aux_2]])];
colormap_vec(3,:) = colormap_vec(4,:) + colormap_vec(3,:);
colormap_vec(2,:) = colormap_vec(4,:) + colormap_vec(2,:);
colormap_vec(1,:) = colormap_vec(4,:) + colormap_vec(1,:);
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
colormap_vec = colormap_vec(:,1:3);
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 7
c_aux_1 = floor(colormap_size/2);    
colormap_vec = [10*[c_aux_1:-1:1] zeros(1,colormap_size-c_aux_1); 3*[1: c_aux_1] 3*[colormap_size-c_aux_1:-1:1]; zeros(1,c_aux_1) 3.8*[1:colormap_size-c_aux_1]];
colormap_vec([1 2],:) = colormap_vec([2 1],:);
colormap_vec(1,:) = colormap_vec(1,:) + colormap_vec(2,:);
colormap_vec(1,:) = colormap_vec(3,:) + colormap_vec(1,:);
colormap_vec(2,:) = colormap_vec(3,:) + colormap_vec(2,:);
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 8
c_aux_1 = floor(colormap_size/2);    
colormap_vec = [10*[c_aux_1:-1:1] zeros(1,colormap_size-c_aux_1); 3*[1: c_aux_1] 3*[colormap_size-c_aux_1:-1:1]; zeros(1,c_aux_1) 3.8*[1:colormap_size-c_aux_1]];
colormap_vec([2 3],:) = colormap_vec([3 2],:);
colormap_vec(1,:) = colormap_vec(2,:) + colormap_vec(1,:);
colormap_vec(3,:) = colormap_vec(2,:) + colormap_vec(3,:);
colormap_vec = colormap_vec+100;
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 9
c_aux_1 = floor(colormap_size/2);    
colormap_vec = [10*[c_aux_1:-1:1] zeros(1,colormap_size-c_aux_1); 2*[1: c_aux_1] 2*[colormap_size-c_aux_1:-1:1]; zeros(1,c_aux_1) 3.8*[1:colormap_size-c_aux_1]];
colormap_vec(1,:) = colormap_vec(3,:) + colormap_vec(1,:);
colormap_vec(2,:) = colormap_vec(3,:) + colormap_vec(2,:);
colormap_vec = colormap_vec+100;
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 10
c_aux_1 = floor(colormap_size/2);    
colormap_vec = [10*[c_aux_1:-1:1] zeros(1,colormap_size-c_aux_1); 8*[1: c_aux_1] 8*[colormap_size-c_aux_1:-1:1]; zeros(1,c_aux_1) 5*[1:colormap_size-c_aux_1]];
colormap_vec = colormap_vec+100;
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 11
colormap_vec = [(colormap_size/5)^3 + colormap_size^2*[1 : colormap_size] ; (colormap_size/2)^3 + ((colormap_size)/2)*[1:colormap_size].^2 ; ...
    (0.7*colormap_size)^3+(0.5*colormap_size)^2*[1:colormap_size]];
colormap_vec = colormap_vec'/max(colormap_vec(:));
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
elseif evalin('base','zef.inv_colormap') == 12
colormap_vec = [[1:colormap_size] ; 0.5*[1:colormap_size] ; 0.5*[colormap_size:-1:1] ];
colormap_vec = colormap_vec'/max(colormap_vec(:));
set(evalin('base','zef.h_zeffiro'),'colormap',colormap_vec);
end

h_surf_2 = trimesh(surface_triangles(I_3,:),nodes(:,1),nodes(:,2),nodes(:,3),reconstruction);
set(h_surf_2,'edgecolor','none','facecolor','flat','facelighting','flat','CDataMapping','scaled');
set(gca,'CLim',[min_rec max_rec]); 
set(h_surf_2,'specularstrength',0.2);
set(h_surf_2,'specularexponent',0.8);
set(h_surf_2,'SpecularColorReflectance',0.8);
set(h_surf_2,'diffusestrength',1);
set(h_surf_2,'ambientstrength',1);
h_colorbar = colorbar('EastOutside','Position',[0.95 0.647 0.01 0.29]);
%set(h_colorbar,'layer','bottom');
lighting phong;
end

%**************************************************************************


for i = 1 : n_compartments

if visible_vec(i)    
I_2 = find(johtavuus(aux_ind) == i);
I_3 = find(ismember(tetra_ind,I_2));
% I = sub2ind(size(tetra),repmat(tetra_ind(I_3),1,3),ind_m(face_ind(I_3),:));
% surface_triangles = tetra(I);
color_str = color_cell{i};
if not(isempty(I_3))
h_surf = trimesh(surface_triangles(I_3,:),nodes(:,1),nodes(:,2),nodes(:,3),'edgecolor','none','facecolor',color_str,'facelighting','flat');
set(h_surf,'specularstrength',0.1);
set(h_surf,'diffusestrength',0.5);
set(h_surf,'ambientstrength',0.85);
if not(evalin('base','zef.visualization_type') == 2) || not(i == aux_wm_ind )
set(h_surf,'facealpha',evalin('base','zef.layer_transparency'));
end
lighting phong;
end
end
end

view(evalin('base','zef.azimuth'),evalin('base','zef.elevation'));
axis('image');
camva(evalin('base','zef.cam_va'));
if not(isempty(h_axes_text))
delete(h_axes_text); 
h_axes_text = [];
end

 if evalin('base','zef.visualization_type') == 2
  h_axes_text = axes('position',[0.656 0.95 0.5 0.05],'visible','off');
  set(h_axes_text,'tag','image_details');
  h_text = text(0, 0.5, ['Time: ' num2str(evalin('base','zef.inv_time_1') + evalin('base','zef.inv_time_2')/2 + frame_step*(f_ind_aux - 1)*evalin('base','zef.inv_time_3'),'%0.9f') ' s']);
  set(h_text,'visible','on');
  set(h_axes_text,'layer','bottom');
end
if evalin('base','zef.axes_visible')
set(evalin('base','zef.h_axes1'),'visible','on');
set(evalin('base','zef.h_axes1'),'xGrid','on');
set(evalin('base','zef.h_axes1'),'yGrid','on');
set(evalin('base','zef.h_axes1'),'zGrid','on');
else
set(evalin('base','zef.h_axes1'),'visible','off');
set(evalin('base','zef.h_axes1'),'xGrid','off');
set(evalin('base','zef.h_axes1'),'yGrid','off');
set(evalin('base','zef.h_axes1'),'zGrid','off');
end
drawnow;
hold off;

end

%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


for f_ind = frame_start + frame_step : frame_step : frame_stop
pause(1/30);
f_ind_aux = f_ind_aux + 1;
if  iscell(evalin('base','zef.reconstruction')) & evalin('base','zef.visualization_type') == 2    
waitbar(f_ind_aux/number_of_frames,h_waitbar,['Frame ' int2str(f_ind_aux) ' of ' int2str(number_of_frames) '.']); 
set(h_waitbar,'handlevisibility','off');
end
delete(h_text);
delete(h_surf_2);
axes(evalin('base','zef.h_axes1'));
hold on;

if iscell(evalin('base','zef.reconstruction'))
reconstruction = evalin('base',['zef.reconstruction{' int2str(f_ind) '}']);
else
reconstruction = evalin('base','zef.reconstruction');  
end
reconstruction = reconstruction(:);  
reconstruction = reshape(reconstruction,3,length(reconstruction)/3);

if evalin('base','zef.reconstruction_type') == 1
reconstruction = sqrt(sum(reconstruction.^2))';
reconstruction = sum(reconstruction(s_i_ind),2)/4;
reconstruction = reconstruction(I_2_b_rec);
reconstruction = reconstruction(I_2_rec(I_1_rec));
end

if evalin('base','zef.reconstruction_type') > 1
rec_x = reconstruction(1,:)';
rec_y = reconstruction(2,:)';
rec_z = reconstruction(3,:)';
rec_x = sum(rec_x(s_i_ind),2)/4;
rec_y = sum(rec_y(s_i_ind),2)/4;
rec_z = sum(rec_z(s_i_ind),2)/4;
rec_x = rec_x(I_2_b_rec);
rec_y = rec_y(I_2_b_rec);
rec_z = rec_z(I_2_b_rec);
rec_x = rec_x(I_2_rec(I_1_rec));
rec_y = rec_y(I_2_rec(I_1_rec));
rec_z = rec_z(I_2_rec(I_1_rec));
end 

if evalin('base','zef.reconstruction_type') > 1
reconstruction = sqrt((rec_x.*n_vec_aux(:,1)).^2 + (rec_y.*n_vec_aux(:,2)).^2 + (rec_z.*n_vec_aux(:,3)).^2);
end

if evalin('base','zef.reconstruction_type') == 3
reconstruction = sqrt((rec_x - reconstruction.*n_vec_aux(:,1)).^2 + (rec_y - reconstruction.*n_vec_aux(:,2)).^2 + (rec_z - reconstruction.*n_vec_aux(:,3)).^2);
end

if evalin('base','zef.reconstruction_type') == 4
aux_rec = rec_x.*n_vec_aux(:,1) + rec_y.*n_vec_aux(:,2) + rec_z.*n_vec_aux(:,3);
I_aux_rec = find(aux_rec > 0);
reconstruction(I_aux_rec) = 0;
%reconstruction = reconstruction./max(abs(reconstruction(:)));
end

if evalin('base','zef.reconstruction_type') == 5 
aux_rec = rec_x.*n_vec_aux(:,1) + rec_y.*n_vec_aux(:,2) + rec_z.*n_vec_aux(:,3);
I_aux_rec = find(aux_rec <= 0);
reconstruction(I_aux_rec) = 0;
%reconstruction = reconstruction./max(abs(reconstruction(:)));
end

if evalin('base','zef.reconstruction_type') > 1
reconstruction = smooth_field(surface_triangles(I_3_rec,:), reconstruction, size(nodes,1),3);
end

if evalin('base','zef.inv_scale') == 1
reconstruction = 10*log10(max(reconstruction/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));
elseif evalin('base','zef.inv_scale') == 2
reconstruction = (max(reconstruction/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));    
elseif evalin('base','zef.inv_scale') == 3
reconstruction = sqrt(max(reconstruction/max_abs_reconstruction,1/evalin('base','zef.inv_dynamic_range')));    
end


h_surf_2 = trimesh(surface_triangles(I_3_rec,:),nodes(:,1),nodes(:,2),nodes(:,3),reconstruction);
set(h_surf_2,'edgecolor','none','facecolor','flat','facelighting','flat','CDataMapping','scaled');
set(gca,'CLim',[min_rec max_rec]); 
set(h_surf_2,'specularstrength',0.2);
set(h_surf_2,'specularexponent',0.8);
set(h_surf_2,'SpecularColorReflectance',0.8);
set(h_surf_2,'diffusestrength',1);
set(h_surf_2,'ambientstrength',1);
lighting phong;
camorbit(frame_step*evalin('base','zef.orbit_1')/15,frame_step*evalin('base','zef.orbit_2')/15);

  h_axes_text = axes('position',[0.656 0.95 0.5 0.05],'visible','off');
  set(h_axes_text,'tag','image_details');
  h_text = text(0, 0.5, ['Time: ' num2str(evalin('base','zef.inv_time_1') + evalin('base','zef.inv_time_2')/2 + frame_step*(f_ind_aux - 1)*evalin('base','zef.inv_time_3'),'%0.9f') ' s']);
  set(h_text,'visible','on');
  set(h_axes_text,'layer','bottom');
  drawnow;

end


%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


rotate3d on;

if  iscell(evalin('base','zef.reconstruction')) &  evalin('base','zef.visualization_type') == 2    
close(h_waitbar);     
end


