if not(isempty(zef.zeffiro_current_size)); zef.zeffiro_current_size{str2num(get(gcf,'Tag'))} = zef_change_size_function(gcf,zef.zeffiro_current_size{str2num(get(gcf,'Tag'))},[],{'Colorbar','image_details'}); end;
