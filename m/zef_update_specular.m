function  specular_val = zef_update_specular(varargin)

if not(isempty(varargin))
h_figure = varargin{1};
else
h_figure = evalin('base','zef.h_zeffiro');
end

h = findobj(get(h_figure,'Children'),'Tag','axes1');
h_object= findobj(get(h_figure,'Children'),'Tag','update_specular_slider');
if isempty(h_object)
h_figure = evalin('base','zef.h_zeffiro');    
h_object = findobj(get(h_figure,'Children'),'Tag','update_specular_slider');
end

specular_val = h_object.Value;
h = h.Children;

for i = 1 : length(h)

if not(isempty(find(ismember(properties(h(i)),'SpecularStrength'))))
h(i).SpecularStrength = specular_val;
end

end