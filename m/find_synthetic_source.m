%Copyright © 2018, Sampsa Pursiainen
if ispc | ismac
zef.h_find_synthetic_source = open('find_synthetic_source_alt.fig');
else
zef.h_find_synthetic_source = open('find_synthetic_source.fig');
end
zef_init_fss;
uistack(flipud([zef.h_inv_synth_source_1;  zef.h_inv_synth_source_2;  zef.h_inv_synth_source_3;  
zef.h_inv_synth_source_4; zef.h_inv_synth_source_5;  zef.h_inv_synth_source_6; zef.h_inv_synth_source_7; zef.h_inv_synth_source_8;
 zef.h_inv_synth_source_9; zef.h_inv_synth_source_10  ]),'top'); 


