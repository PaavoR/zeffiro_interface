
function h_waitbar = waitbar(varargin)

progress_value = varargin{1};
progress_value = min(1,progress_value(:));
progress_value = max(0,progress_value(:));
progress_bar_text = '';


visible_value = evalin('base','zef.h_zeffiro.Visible');

if ishandle(varargin{2})
    h_waitbar = varargin{2};
    if length(varargin)>2
     progress_bar_text = varargin{3};
    else
    h_text = findobj(h_waitbar.Children,'Tag','progress_bar_text');
    progress_bar_text = h_text.String; 
    end
else
    if length(varargin) > 1
    progress_bar_text = varargin{2};
    end
h_waitbar = figure(...
'PaperUnits',get(0,'defaultfigurePaperUnits'),...
'Units','normalized',...
'Position',[0.375 0.45 0.2 0.1],...
'Renderer',get(0,'defaultfigureRenderer'),...
'Visible',visible_value,...
'Color',get(0,'defaultfigureColor'),...
'CloseRequestFcn','closereq;',...
'CurrentAxesMode','manual',...
'IntegerHandle','off',...
'NextPlot',get(0,'defaultfigureNextPlot'),...
'DoubleBuffer','off',...
'MenuBar','none',...
'ToolBar','none',...
'Name','ZEFFIRO Interface: Progress bar',...
'NumberTitle','off',...
'HandleVisibility','callback',...
'DeleteFcn','delete(gcf);',...
'Tag','progress_bar',...
'UserData',[],...
'WindowStyle',get(0,'defaultfigureWindowStyle'),...
'Resize',get(0,'defaultfigureResize'),...
'PaperPosition',get(0,'defaultfigurePaperPosition'),...
'PaperSize',[20.99999864 29.69999902],...
'PaperType',get(0,'defaultfigurePaperType'),...
'InvertHardcopy',get(0,'defaultfigureInvertHardcopy'),...
'ScreenPixelsPerInchMode','manual' );


h_axes = axes(h_waitbar,'Position',[0.1 0.2 0.8 0.6]);
h_axes.Visible = 'off';

uicontrol('Tag','progress_bar_text','Style','text','Parent',h_waitbar,'Units','normalized','String',progress_bar_text,'HorizontalAlignment','center','Position',[0.1 0.6 0.8 0.2]);



end

if isequal(h_waitbar.Visible,'on') || isequal(h_waitbar.Visible,1)

h_axes = h_waitbar.CurrentAxes;
h_text = findobj(h_waitbar.Children,'Tag','progress_bar_text');
h_text.String = progress_bar_text;
h_bar = barh(h_axes,[progress_value 1-progress_value; 0 0],'barlayout','stacked','showbaseline','off','edgecolor','none');

h_bar(1).FaceColor = [ 0 1 1];
h_bar(2).FaceColor = [ 0.145   0.624    0.631];
h_axes.Visible = 'off';
uistack(h_text,'top');

pause(1e-6)


end

if not(ishandle(varargin{2}))
    
    set(findobj(h_waitbar.Children,'-property','FontUnits'),'FontUnits','pixels');
set(findobj(h_waitbar.Children,'-property','FontSize'),'FontSize',evalin('base','zef.font_size'));


  %  set(h_waitbar,'AutoResizeChildren','off');
%h_waitbar.UserData = get(h_waitbar,'Position');
%set(h_waitbar,'SizeChangedFcn','set(gcf,''UserData'', zef_change_size_function(gcf,get(gcf,''UserData'')));');

    end

end