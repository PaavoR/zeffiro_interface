zef.file = 'multicompartment_head_project';
zef.file_path = [zef.program_path '/data/'];
zef_load;
zef_create_finite_element_mesh;
zef.save_switch = 1; 
zef.file = 'multicompartment_head_project_fem_mesh';
zef_save; 
zef.file = 'multicompartment_head_fem_mesh';
zef_export_fem_mesh_as;