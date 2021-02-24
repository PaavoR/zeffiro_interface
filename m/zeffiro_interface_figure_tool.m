zef.h_zeffiro = figure(...
'PaperUnits',get(0,'defaultfigurePaperUnits'),...
'Units','normalized',...
'Position',[0.5785    0.5118    0.2129    0.4278],...
'Renderer',get(0,'defaultfigureRenderer'),...
'Visible',get(0,'defaultfigureVisible'),...
'Color',get(0,'defaultfigureColor'),...
'CloseRequestFcn','closereq;',...
'CurrentAxesMode','manual',...
'IntegerHandle','off',...
'NextPlot',get(0,'defaultfigureNextPlot'),...
'Colormap',[0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 1;0.125 1 0.9375;0.1875 1 0.875;0.25 1 0.8125;0.3125 1 0.75;0.375 1 0.6875;0.4375 1 0.625;0.5 1 0.5625;0.5625 1 0.5;0.625 1 0.4375;0.6875 1 0.375;0.75 1 0.3125;0.8125 1 0.25;0.875 1 0.1875;0.9375 1 0.125;1 1 0.0625;1 1 0;1 0.9375 0;1 0.875 0;1 0.8125 0;1 0.75 0;1 0.6875 0;1 0.625 0;1 0.5625 0;1 0.5 0;1 0.4375 0;1 0.375 0;1 0.3125 0;1 0.25 0;1 0.1875 0;1 0.125 0;1 0.0625 0;1 0 0;0.9375 0 0;0.875 0 0;0.8125 0 0;0.75 0 0;0.6875 0 0;0.625 0 0;0.5625 0 0],...
'DoubleBuffer','off',...
'MenuBar','none',...
'ToolBar','figure',...
'Name','ZEFFIRO Interface: Figure tool',...
'NumberTitle','off',...
'HandleVisibility','callback',...
'DeleteFcn','if zef.h_zeffiro == gcbo; zef_figure_tool; end;',...
'Tag','figure1',...
'UserData',[],...
'WindowStyle',get(0,'defaultfigureWindowStyle'),...
'Resize',get(0,'defaultfigureResize'),...
'PaperPosition',get(0,'defaultfigurePaperPosition'),...
'PaperSize',[20.99999864 29.69999902],...
'PaperType',get(0,'defaultfigurePaperType'),...
'InvertHardcopy',get(0,'defaultfigureInvertHardcopy'),...
'ScreenPixelsPerInchMode','manual' );

addToolbarExplorationButtons(zef.h_zeffiro);

zef.stop_movie = 0;
zef.h_axes1 = uiaxes('Parent',zef.h_zeffiro,'visible','on','Units','normalized','Position',[0.05 0.43 0.9 0.55],'FontSize',0.587962962962963);
zef.h_stop_movie = uicontrol('Style','PushButton','Parent',zef.h_zeffiro,'visible','on','Units','normalized','Position',[0.67 0.34 0.15 0.06],'String','Stop','Callback','if zef.stop_movie == 1; zef.stop_movie = 0; set(zef.h_stop_movie,''foregroundcolor'',[0 0 0]); set(zef.h_stop_movie,''string'',''Stop'');else; zef.stop_movie = 1; set(zef.h_stop_movie,''foregroundcolor'',[1 0 0]); set(zef.h_stop_movie,''string'',''Stopped''); end; set(zef.h_stop_movie,''value'',zef.stop_movie);');
zef.h_pause_movie = uicontrol('Style','PushButton','Parent',zef.h_zeffiro,'visible','on','Units','normalized','Position',[0.82 0.34 0.15 0.06],'String','Pause','Callback','if zef.stop_movie == 1; zef.stop_movie = 0; set(zef.h_pause_movie,''foregroundcolor'',[0 0 0]); set(zef.h_pause_movie,''string'',''Pause'');else; zef.stop_movie = 1; set(zef.h_pause_movie,''foregroundcolor'',[1 0 0]); set(zef.h_pause_movie,''string'',''Paused''); end; set(zef.h_pause_movie,''value'',zef.stop_movie);');
zef.h_loop_movie = uicontrol('Style','Checkbox','Parent',zef.h_zeffiro,'visible','on','Units','normalized','Position',[0.3 0.35 0.25 0.04],'String','Loop on / count:','Callback','zef.loop_movie = get(zef.h_loop_movie,''value'');','HorizontalAlignment','left');
zef.h_loop_movie_count = uicontrol('Style','Edit','Parent',zef.h_zeffiro,'visible','on','Units','normalized','Position',[0.56 0.35 0.07 0.04],'String','Loop visualization','Callback','zef.loop_count = str2num(get(zef.h_loop_count,''string''));','HorizontalAlignment','right');
set(zef.h_loop_movie_count,'string',num2str(zef.loop_movie_count));

imagesc(zef.h_axes1,imread('zeffiro_interface.jpg'));
%axis(zef.h_axes1,'equal');

%***********************


uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','White matter',...
'Style','text',...
'Position',[0.0328282828282828 0.217118997912317 0.295454545454545 0.024],...
'BackgroundColor',[0.8 0.8 0.8],...
'Children',[],...
'Visible','off',...
'CreateFcn',  'set(gcbo,''backgroundcolor'',zef.w_color); set(gcbo,''visible'',''off'');zef.h_w_label = gcbo;',...
'Tag','text196',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Grey matter',...
'Style','text',...
'Position',[0.0328282828282828 0.192066805845511 0.295454545454545 0.024],...
'BackgroundColor',[0.35 0.35 0.35],...
'Children',[],...
'ForegroundColor',[1 1 1],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.g_color);set(gcbo,''visible'',''off'');zef.h_g_label = gcbo;' ,...
'Tag','text197',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Cerebrospinal fluid',...
'Style','text',...
'Position',[0.348484848484849 0.217118997912317 0.295454545454546 0.024],...
'BackgroundColor',[0.42 0.48 0.42],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.c_color);set(gcbo,''visible'',''off'');zef.h_c_label = gcbo;',...
'Tag','text198',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Skull',...
'Style','text',...
'Position',[0.348484848484849 0.192066805845511 0.295454545454546 0.024],...
'BackgroundColor',[0.7 0.7 0.6],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.sk_color);set(gcbo,''visible'',''off'');zef.h_sk_label = gcbo;' ,...
'Tag','text199',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Scalp',...
'Style','text',...
'Position',[0.0328282828282828 0.167014613778706 0.295454545454546 0.024],...
'BackgroundColor',[0.581 0.469 0.343],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.sc_color);set(gcbo,''visible'',''off'');zef.h_sc_label = gcbo;' ,...
'Tag','text200',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Sensors',...
'Style','text',...
'Position',[0.0328282828282828 0.242171189979123 0.295454545454545 0.024],...
'BackgroundColor',[0.1 0.1 0.1],...
'Children',[],...
'ForegroundColor',[1 1 1],...
'CreateFcn','set(gcbo,''backgroundcolor'',zef.s_color); zef.h_s_label = gcbo;' ,...
'Tag','text208',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');


uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 1',...
'Style','text',...
'Position',[0.666666666666667 0.217118997912317 0.295454545454546 0.024],...
'BackgroundColor',[0.7 0.7 1],...
'Children',[],...
'Visible','off',...
'CreateFcn','set(gcbo,''backgroundcolor'',zef.d1_color);set(gcbo,''visible'',''off'');zef.h_d1_label = gcbo;' ,...
'Tag','text1196',...
'FontSize',0.587962962962963,...
'FontWeight','bold');


uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 2',...
'Style','text',...
'Position',[0.666666666666667 0.192066805845511 0.295454545454546 0.024],...
'BackgroundColor',[1 0 1],...
'Children',[],...
'Visible','off',...
'CreateFcn',  'set(gcbo,''backgroundcolor'',zef.d2_color);set(gcbo,''visible'',''off'');zef.h_d2_label = gcbo;' ,...
'Tag','text2196',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 3',...
'Style','text',...
'Position',[0.348484848484849 0.167014613778706 0.295454545454545 0.024],...
'BackgroundColor',[0 0.5 0.5],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d3_color);set(gcbo,''visible'',''off'');zef.h_d3_label = gcbo;', ...
'Tag','text3196',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'String','Elements:',...
'Style','text',...
'Position',[0.0303951367781155 0.304689598445847 0.155015197568389 0.0305927342256214],...
'Children',[],...
'Tag','text277',...
'FontSize',0.461256944444444);

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'String','Nodes:',...
'Style','text',...
'Position',[0.345394736842105 0.304689598445847 0.148026315789474 0.0305927342256214],...
'Children',[],...
'Tag','text278',...
'FontSize',0.461256944444444);

 uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'String','0',...
'Style','text',...
'Position',[0.487373737373737 0.304689598445847 0.151515151515152 0.0305927342256214],...
'Children',[],...
'CreateFcn', 'zef.h_text_nodes=gcbo;',...
'Tag','text_nodes',...
'FontSize',0.461256944444444);

 uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'String','0',...
'Style','text',...
'Position',[0.169191919191919 0.304689598445847 0.151515151515152 0.0305927342256214],...
'Children',[],...
'CreateFcn', 'zef.h_text_elements=gcbo;', ...
'Tag','text_elements',...
'FontSize',0.461256944444444);

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'String','Image:',...
'Style','text',...
'Position',[0.664473684210526 0.304689598445847 0.157894736842105 0.0305927342256214],...
'Children',[],...
'Tag','text283',...
'FontSize',0.461256944444444);


uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'String',blanks(0),...
'Style','text',...
'Position',[0.805555555555556 0.304689598445847 0.151515151515152 0.0305927342256214],...
'Children',[],...
'CreateFcn', 'zef.h_text_image=gcbo;',...
'Tag','text_image',...
'UserData',[],...
'FontSize',0.461256944444444);


uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 6',...
'Style','text',...
'Position',[0.348484848484849 0.1419624217119 0.295454545454545 0.024],...
'BackgroundColor',[0.4 0.6 0.1],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d6_color);set(gcbo,''visible'',''off'');zef.h_d6_label= gcbo;' ,...
'Tag','d6_label',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'String','Scale:',...
'Style','text',...
'Position',[0.0303951367781155 0.272013530886893 0.151515151515152 0.0305927342256214],...
'Children',[],...
'Tag','text325',...
'FontSize',0.461256944444443);

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'ListboxTop',get(0,'defaultuicontrolListboxTop'),...
'Max',get(0,'defaultuicontrolMax'),...
'Min',get(0,'defaultuicontrolMin'),...
'SliderStep',get(0,'defaultuicontrolSliderStep'),...
'String','Field:',...
'Style','text',...
'Value',get(0,'defaultuicontrolValue'),...
'Position',[0.345394736842105 0.272013530886893 0.148026315789474 0.0305927342256214],...
'BackgroundColor',get(0,'defaultuicontrolBackgroundColor'),...
'Callback',blanks(0),...
'Children',[],...
'ForegroundColor',get(0,'defaultuicontrolForegroundColor'),...
'Enable',get(0,'defaultuicontrolEnable'),...
'TooltipString',blanks(0),...
'Visible',get(0,'defaultuicontrolVisible'),...
'HandleVisibility',get(0,'defaultuicontrolHandleVisibility'),...
'ButtonDownFcn',blanks(0),...
'DeleteFcn',blanks(0),...
'Tag','text326',...
'UserData',[],...
'KeyPressFcn',blanks(0),...
'KeyReleaseFcn',blanks(0),...
'FontSize',0.461256944444443,...
'FontName',get(0,'defaultuicontrolFontName'),...
'FontAngle',get(0,'defaultuicontrolFontAngle'),...
'FontWeight',get(0,'defaultuicontrolFontWeight'));


uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'String',blanks(0),...
'Style','text',...
'Position',[0.487373737373737 0.272013530886893 0.151515151515152 0.0305927342256214],...
'Children',[],...
'CreateFcn', 'zef.h_text_field=gcbo;',...
'Tag','text327',...
'FontSize',0.461256944444443);

 uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'ListboxTop',get(0,'defaultuicontrolListboxTop'),...
'Max',get(0,'defaultuicontrolMax'),...
'Min',get(0,'defaultuicontrolMin'),...
'SliderStep',get(0,'defaultuicontrolSliderStep'),...
'String',blanks(0),...
'Style','text',...
'Value',get(0,'defaultuicontrolValue'),...
'Position',[0.169191919191919 0.272013530886893 0.151515151515152 0.0305927342256214],...
'BackgroundColor',get(0,'defaultuicontrolBackgroundColor'),...
'Callback',blanks(0),...
'Children',[],...
'ForegroundColor',get(0,'defaultuicontrolForegroundColor'),...
'Enable',get(0,'defaultuicontrolEnable'),...
'TooltipString',blanks(0),...
'Visible',get(0,'defaultuicontrolVisible'),...
'HandleVisibility',get(0,'defaultuicontrolHandleVisibility'),...
'ButtonDownFcn',blanks(0),...
'CreateFcn', 'zef.h_text_scale=gcbo;',...
'DeleteFcn',blanks(0),...
'Tag','text328',...
'UserData',[],...
'KeyPressFcn',blanks(0),...
'KeyReleaseFcn',blanks(0),...
'FontSize',0.461256944444443,...
'FontName',get(0,'defaultuicontrolFontName'),...
'FontAngle',get(0,'defaultuicontrolFontAngle'),...
'FontWeight',get(0,'defaultuicontrolFontWeight'));

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'String','Part:',...
'Style','text',...
'Position',[0.664473684210526 0.272013530886893 0.157894736842105 0.0305927342256214],...
'Children',[],...
'Tag','text329',...
'FontSize',0.461256944444443);

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'String',blanks(0),...
'Style','text',...
'Position',[0.805555555555556 0.272013530886893 0.151515151515152 0.0305927342256214],...
'Children',[],...
'CreateFcn', 'zef.h_text_part=gcbo;', ...
'Tag','text330',...
'UserData',[],...
'FontSize',0.461256944444443);

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 7',...
'Style','text',...
'Position',[0.666666666666667 0.1419624217119 0.295454545454545 0.024],...
'BackgroundColor',[0 1 0],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d7_color); set(gcbo,''visible'',''off'');zef.h_d7_label = gcbo;' ,...
'Tag','d7_label',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 10',...
'Style','text',...
'Position',[0.666666666666667 0.116910229645094 0.295454545454545 0.024],...
'BackgroundColor',[0.35 0.75 1],...
'Children',[],...
'ForegroundColor',get(0,'defaultuicontrolForegroundColor'),...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d10_color);set(gcbo,''visible'',''off'');zef.h_d10_label = gcbo;' ,...
'Tag','d10_label',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 4',...
'Style','text',...
'Position',[0.666666666666667 0.167014613778706 0.295454545454545 0.024],...
'BackgroundColor',[1 0.5 0.2],...
'Children',[],...
'ForegroundColor',get(0,'defaultuicontrolForegroundColor'),...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d4_color);set(gcbo,''visible'',''off'');zef.h_d4_label = gcbo;',...
'Tag','text4196',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');


uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 5',...
'Style','text',...
'Position',[0.0328282828282828 0.1419624217119 0.295454545454546 0.024],...
'BackgroundColor',[0.5 0 1],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d5_color);set(gcbo,''visible'',''off'');zef.h_d5_label = gcbo;' ,...
'Tag','d5_label',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 8',...
'Style','text',...
'Position',[0.0328282828282828 0.116910229645094 0.295454545454546 0.024],...
'BackgroundColor',[1 0 0],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d8_color);set(gcbo,''visible'',''off'');zef.h_d8_label = gcbo;' ,...
'Tag','d8_label',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 11',...
'Style','text',...
'Position',[0.0328282828282828 0.0918580375782881 0.295454545454546 0.024],...
'BackgroundColor',[0 1 0.8],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d11_color);set(gcbo,''visible'',''off'');zef.h_d11_label = gcbo;', ...
'Tag','d11_label',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 9',...
'Style','text',...
'Position',[0.348484848484849 0.116910229645094 0.295454545454545 0.024],...
'BackgroundColor',[0 0.3 1],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d9_color);set(gcbo,''visible'',''off'');zef.h_d9_label = gcbo;' ,...
'Tag','d9_label',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 12',...
'Style','text',...
'Position',[0.348484848484849 0.0918580375782881 0.295454545454545 0.024],...
'BackgroundColor',[1 0.85 0],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d12_color);set(gcbo,''visible'',''off'');zef.h_d12_label = gcbo;' ,...
'Tag','d12_label',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');


uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 13',...
'Style','text',...
'Position',[0.666666666666667 0.0918580375782881 0.295454545454546 0.024],...
'BackgroundColor',[0.8 0.3 0.6],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d13_color);set(gcbo,''visible'',''off'');zef.h_d13_label = gcbo;',...
'Tag','d13_label',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 16',...
'Style','text',...
'Position',[0.666666666666667 0.0668058455114822 0.295454545454545 0.024],...
'BackgroundColor',[0 1 0],...
'Children',[],...
'Visible','off',...
'CreateFcn',  'set(gcbo,''backgroundcolor'',zef.d16_color); set(gcbo,''visible'',''off'');zef.h_d16_label = gcbo;' ,...
'Tag','text353',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 19',...
'Style','text',...
'Position',[0.666666666666667 0.0417536534446764 0.295454545454545 0.024],...
'BackgroundColor',[0.35 0.75 1],...
'Children',[],...
'ForegroundColor',get(0,'defaultuicontrolForegroundColor'),...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d19_color);set(gcbo,''visible'',''off'');zef.h_d19_label = gcbo;' ,...
'Tag','text354',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 14',...
'Style','text',...
'Position',[0.0328282828282828 0.0668058455114822 0.295454545454546 0.024],...
'BackgroundColor',[0.5 0 1],...
'Children',[],...
'Visible','off',...
'CreateFcn','set(gcbo,''backgroundcolor'',zef.d14_color);set(gcbo,''visible'',''off'');zef.h_d14_label = gcbo;', ...
'Tag','text355',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 17',...
'Style','text',...
'Position',[0.0328282828282828 0.0417536534446764 0.295454545454546 0.024],...
'BackgroundColor',[1 0 0],...
'Children',[],...
'Visible','off','CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d17_color);set(gcbo,''visible'',''off'');zef.h_d17_label = gcbo;' ,...
'Tag','text356',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 20',...
'Style','text',...
'Position',[0.0328282828282828 0.0166579679888657 0.295454545454546 0.024],...
'BackgroundColor',[0 1 0.8],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d20_color);set(gcbo,''visible'',''off'');zef.h_d20_label = gcbo;' ,...
'Tag','text357',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 18',...
'Style','text',...
'Position',[0.348484848484849 0.0417536534446764 0.295454545454546 0.024],...
'BackgroundColor',[0 0.3 1],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d18_color);set(gcbo,''visible'',''off'');zef.h_d18_label = gcbo;' ,...
'Tag','text358',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 21',...
'Style','text',...
'Position',[0.348484848484849 0.0167014613778706 0.295165394402036 0.024],...
'BackgroundColor',[1 0.85 0],...
'Children',[],...
'Visible','off',...
'CreateFcn','set(gcbo,''backgroundcolor'',zef.d21_color);set(gcbo,''visible'',''off'');zef.h_d21_label = gcbo;' ,...
'Tag','text359',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 22',...
'Style','text',...
'Position',[0.666666666666667 0.0166579679888657 0.295454545454545 0.024],...
'BackgroundColor',[0.8 0.3 0.6],...
'Children',[],...
'ForegroundColor',get(0,'defaultuicontrolForegroundColor'),...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d22_color);set(gcbo,''visible'',''off'');zef.h_d22_label = gcbo;',...
'Tag','text360',...
'UserData',[],...
'FontSize',0.587962962962963,...
'FontWeight','bold');

uicontrol(...
'Parent',zef.h_zeffiro,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Detail 15',...
'Style','text',...
'Position',[0.348484848484849 0.0668058455114822 0.295454545454546 0.024],...
'BackgroundColor',[0.4 0.6 0.1],...
'Children',[],...
'Visible','off',...
'CreateFcn', 'set(gcbo,''backgroundcolor'',zef.d15_color);set(gcbo,''visible'',''off'');zef.h_d15_label = gcbo;' ,...
'Tag','text361',...
'FontSize',0.587962962962963,...
'FontWeight','bold');

axis(zef.h_axes1,'tight');
%set(zef.h_axes1,'xticklabel',[]);
%set(zef.h_axes1,'yticklabels',[]);
%set(zef.h_axes1,'visible','off');

