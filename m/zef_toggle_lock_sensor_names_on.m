if isequal(zef.lock_sensor_names_on,0)
zef.h_sensors_table.ColumnEditable = logical(ones(1,size(zef.h_sensors_name_table.Data,2)));
zef.h_menu_lock_sensor_names_on.Text = 'Toggle ''On'' unlocked';
zef.h_menu_lock_sensor_names_on.ForegroundColor = [0 0 0];
elseif isequal(zef.lock_sensor_names_on,1)
    zef.h_sensors_name_table.ColumnEditable = logical(zeros(1,size(zef.h_sensors_name_table.Data,2)));
    zef.h_sensors_name_table.ColumnEditable(4) = 0;
    zef.h_menu_lock_sensor_names_on.Text = 'Toggle ''On'' locked';
zef.h_menu_lock_sensor_names_on.ForegroundColor = [1 0 0];
end