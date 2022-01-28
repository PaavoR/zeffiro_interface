zef.compartment_table_size = 9;
zef.h_compartment_table.ColumnName(1:zef.compartment_table_size) =     {'ID','On','Name','Visible','Surface nodes','Surface triangles','Merge','Invert normal','Activity' };
zef.h_compartment_table.ColumnEditable(1:zef.compartment_table_size) = logical([1 1 1 1 0 0 1 1 1]);
zef.h_compartment_table.ColumnFormat(1:zef.compartment_table_size) = {'numeric','logical','char','logical','numeric','numeric','logical','logical',zef.compartment_activity};
zef.aux_field_1{zef_i,1} = zef_i;
zef.aux_field_1{zef_i,2}  = evalin('base',['zef.' zef.compartment_tags{zef_j} '_on']);
zef.aux_field_1{zef_i,3}  = evalin('base',['zef.' zef.compartment_tags{zef_j} '_name']);
zef.aux_field_1{zef_i,4}  = evalin('base',['zef.' zef.compartment_tags{zef_j} '_visible']);
zef.aux_field_1{zef_i,5} = evalin('base',['size(zef.' zef.compartment_tags{zef_j} '_points,1)']);
zef.aux_field_1{zef_i,6} = evalin('base',['size(zef.' zef.compartment_tags{zef_j} '_triangles,1)']);
zef.aux_field_1{zef_i,7} = evalin('base',['zef.' zef.compartment_tags{zef_j} '_merge']);
zef.aux_field_1{zef_i,8} = evalin('base',['zef.' zef.compartment_tags{zef_j} '_invert']);
zef.aux_field_1{zef_i,9} = zef.h_compartment_table.ColumnFormat{9}{evalin('base',['zef.' zef.compartment_tags{zef_j} '_sources'])+2};