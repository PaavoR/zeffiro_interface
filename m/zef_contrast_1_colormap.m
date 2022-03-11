function [colormap_vec] = zef_contrast_1_colormap(colortune_param, colormap_size)

c_aux_1 = floor(colortune_param*colormap_size/3);
c_aux_2 = floor(colormap_size - colortune_param*colormap_size/3);
colormap_vec = [([20*(colormap_size/3)*[c_aux_1:-1:1]/c_aux_1 zeros(1,colormap_size-c_aux_1)]); ([15*(colormap_size/3)*[1: c_aux_1]/c_aux_1 15*(colormap_size/3)*[c_aux_2-c_aux_1:-1:1]/(c_aux_2-c_aux_1) zeros(1,colormap_size-c_aux_2)]) ; ([zeros(1,c_aux_1) 6*(colormap_size/3)*[1:c_aux_2-c_aux_1]/(c_aux_2-c_aux_1) 6*(colormap_size/3)*[colormap_size-c_aux_2:-1:1]/(colormap_size-c_aux_2)]);([zeros(1,c_aux_2) 7.5*(colormap_size/3)*[1:colormap_size-c_aux_2]/(colormap_size-c_aux_2)])];
colormap_vec([1 2],:) = colormap_vec([2 1],:);
colormap_vec(1,:) = colormap_vec(1,:) + colormap_vec(2,:);
colormap_vec(3,:) = colormap_vec(4,:) + colormap_vec(3,:);
colormap_vec(2,:) = colormap_vec(4,:) + colormap_vec(2,:);
colormap_vec(1,:) = colormap_vec(4,:) + colormap_vec(1,:);
colormap_vec = colormap_vec'/max(colormap_vec(:));
colormap_vec = flipud(colormap_vec);
colormap_vec = colormap_vec(:,1:3);

end
