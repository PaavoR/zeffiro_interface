function lights_vec = zef_update_lights(varargin)

if not(isempty(varargin))
    h_1 = varargin{1};
else
    h_1 = evalin('base','zef.h_axes1');
end

h_2 = evalin('base','zef.h_update_lights');
h_3 = findobj(h_1.Children,'Type','Light');
lights_vec = evalin('base','zef.update_lights');

if h_2.Value == 1

delete(h_3);
    
light(h_1,'Position',[0 0 1],'Style','infinite');
light(h_1,'Position',[0 0 -1],'Style','infinite');

lights_vec = 1;
   
elseif h_2.Value == 2

delete(h_3);
lights_vec = [];    

elseif h_2.Value == 3

light(h_1,'Position',[1 0 0],'Style','infinite');
light(h_1,'Position',[-1 0 0 ],'Style','infinite');

lights_vec = [lights_vec ; 3];


elseif h_2.Value == 4

light(h_1,'Position',[0 1 0],'Style','infinite');
light(h_1,'Position',[0 -1 0 ],'Style','infinite');
    
lights_vec = [lights_vec ; 4];

elseif h_2.Value == 5

light(h_1,'Position',[0 0 1],'Style','infinite');
light(h_1,'Position',[0 0 -1 ],'Style','infinite');
    
lights_vec = [lights_vec ; 5];

elseif h_2.Value == 6

camlight(h_1,'headlight')
lights_vec = [lights_vec ; 6];
    
end

end