if isequal(zef.lock_on,0)
zef.h_compartment_table.ColumnEditable = logical(ones(1,size(zef.h_compartment_table.Data,2)));
zef.h_menu_lock_on.Text = 'Toggle ''On'' unlocked';
zef.h_menu_lock_on.ForegroundColor = [0 0 0];
elseif isequal(zef.lock_on,1)
    zef.h_compartment_table.ColumnEditable = logical(ones(1,size(zef.h_compartment_table.Data,2)));
    zef.h_compartment_table.ColumnEditable(3) = 0;
    zef.h_menu_lock_on.Text = 'Toggle ''On'' locked';
zef.h_menu_lock_on.ForegroundColor = [1 0 0];
end