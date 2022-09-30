
h1 = figure(...
'PaperUnits',get(0,'defaultfigurePaperUnits'),...
'Units','normalized',...
'Position',[0.4325 0.754529914529915 0.184722222222222 0.271111111111111],...
'Visible',get(0,'defaultfigureVisible'),...
'Color',get(0,'defaultfigureColor'),...
'IntegerHandle','off',...
'Colormap',[0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 1;0.125 1 0.9375;0.1875 1 0.875;0.25 1 0.8125;0.3125 1 0.75;0.375 1 0.6875;0.4375 1 0.625;0.5 1 0.5625;0.5625 1 0.5;0.625 1 0.4375;0.6875 1 0.375;0.75 1 0.3125;0.8125 1 0.25;0.875 1 0.1875;0.9375 1 0.125;1 1 0.0625;1 1 0;1 0.9375 0;1 0.875 0;1 0.8125 0;1 0.75 0;1 0.6875 0;1 0.625 0;1 0.5625 0;1 0.5 0;1 0.4375 0;1 0.375 0;1 0.3125 0;1 0.25 0;1 0.1875 0;1 0.125 0;1 0.0625 0;1 0 0;0.9375 0 0;0.875 0 0;0.8125 0 0;0.75 0 0;0.6875 0 0;0.625 0 0;0.5625 0 0],...
'MenuBar','none',...
'ToolBar','none',...
'Name','IAS MAP estimation',...
'NumberTitle','off',...
'HandleVisibility','off',...
'Tag','figure1',...
'UserData',[],...
'Resize',get(0,'defaultfigureResize'),...
'PaperPosition',get(0,'defaultfigurePaperPosition'),...
'PaperSize',[20.99999864 29.69999902],...
'PaperType',get(0,'defaultfigurePaperType'),...
'InvertHardcopy',get(0,'defaultfigureInvertHardcopy'),...
'ScreenPixelsPerInchMode','manual',...
'CreateFcn', '' );

zef.h_butterfly_plot = h1;

h2 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'ListboxTop',0,...
'String','Sampling frequency (Hz):',...
'Style','text',...
'Position',[0.037593984962406 0.881147540983607 0.469924812030075 0.0655737704918032],...
'Children',[],...
'Tag','text10',...
'UserData',[],...
'FontSize',0.44324942791762,...
'CreateFcn', '' );


h3 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'ListboxTop',0,...
'String','1025',...
'Style','edit',...
'Value',1,...
'Position',[0.785714285714286 0.877049180327869 0.180451127819549 0.0737704918032787],...
'BackgroundColor',[1 1 1],...
'Callback','zef.bf_sampling_frequency = str2num(get(gcbo,''string''));',...
'Children',[],...
'CreateFcn', '',...
'Tag','edit6',...
'FontSize',0.397787948131197);

zef.h_bf_sampling_frequency = h3;

h4 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'ListboxTop',0,...
'String','Low-cut frequency (Hz):',...
'Style','text',...
'Position',[0.037593984962406 0.770491803278689 0.469924812030075 0.0655737704918032],...
'Children',[],...
'Tag','text11',...
'UserData',[],...
'FontSize',0.44324942791762,...
'CreateFcn', '' );


h5 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'ListboxTop',0,...
'String','7',...
'Style','edit',...
'Value',1,...
'Position',[0.785714285714286 0.766393442622951 0.180451127819549 0.0737704918032787],...
'BackgroundColor',[1 1 1],...
'Callback','zef.bf_low_cut_frequency = str2num(get(gcbo,''string''));',...
'Children',[],...
'CreateFcn', '',...
'Tag','edit7',...
'FontSize',0.397787948131198);

zef.h_bf_low_cut_frequency = h5;

h6 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'ListboxTop',0,...
'String','High-cut frequency (Hz):',...
'Style','text',...
'Position',[0.037593984962406 0.659836065573771 0.469924812030075 0.0655737704918032],...
'Children',[],...
'Tag','text12',...
'UserData',[],...
'FontSize',0.443249427917621,...
'CreateFcn', '');

h7 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'ListboxTop',0,...
'String','9',...
'Style','edit',...
'Value',1,...
'Position',[0.785714285714286 0.655737704918033 0.180451127819549 0.0737704918032787],...
'BackgroundColor',[1 1 1],...
'Callback','zef.bf_high_cut_frequency = str2num(get(gcbo,''string''));',...
'Children',[],...
'CreateFcn', '' ,...
'Tag','edit8',...
'FontSize',0.397787948131197);

zef.h_bf_high_cut_frequency = h7;

h8 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Plot',...
'Position',[0.413533834586466 0.0286885245901644 0.169172932330827 0.102459016393443],...
'Callback','zef_update_butterfly_plot; zef_make_butterfly_plot(zef);',...
'Children',[],...
'CreateFcn', '',...
'Tag','pushbutton12',...
'FontSize',0.280661496737012);

zef.h_bf_plot = h8;

h9 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Close',...
'Position',[0.0526315789473684 0.0286885245901644 0.169172932330827 0.102459016393443],...
'Callback','close(zef.h_butterfly_plot);',...
'Children',[],...
'CreateFcn', '',...
'Tag','pushbutton13',...
'FontSize',0.280661496737012);

zef.h_bf_cancel = h9;

h10 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'String','Apply',...
'Position',[0.2331 0.0286885245901644 0.169172932330827 0.102459016393443],...
'Callback','zef_update_ias;',...
'Children',[],...
'CreateFcn', '' ,...
'Tag','pushbutton14',...
'FontSize',0.280661496737012);

zef.h_bf_apply = h10;

h11 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'ListboxTop',0,...
'String','Data normalization:',...
'Style','text',...
'Position',[0.037593984962406 0.204918032786886 0.469924812030075 0.0655737704918033],...
'Children',[],...
'Tag','text25',...
'UserData',[],...
'FontSize',0.44324942791762,...
'CreateFcn', '' );

h12 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'String',{  'Maximum entry'; 'Maximum column norm'; 'Average column norm'; 'None' },...
'Style','popupmenu',...
'Value',1,...
'Position',[0.571428571428571 0.192622950819673 0.402255639097744 0.0737704918032787],...
'BackgroundColor',[1 1 1],...
'Callback','zef.bf_normalize_data = get(gcbo,''value'');',...
'Children',[],...
'CreateFcn', '',...
'Tag','popupmenu8',...
'UserData',[],...
'FontSize',0.397787948131197);

zef.h_bf_normalize_data = h12;

h13 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'ListboxTop',0,...
'String','Time interval start (s):',...
'Style','text',...
'Position',[0.037593984962406 0.549180327868853 0.469924812030075 0.0655737704918032],...
'Children',[],...
'Tag','text26',...
'UserData',[],...
'FontSize',0.44324942791762,...
'CreateFcn', '' );

h14 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'ListboxTop',0,...
'String','0',...
'Style','edit',...
'Value',1,...
'Position',[0.785714285714286 0.545081967213115 0.180451127819549 0.0737704918032787],...
'BackgroundColor',[1 1 1],...
'Callback','zef.bf_time_1 = str2num(get(gcbo,''string''));',...
'Children',[],...
'CreateFcn', '',...
'Tag','edit14',...
'FontSize',0.397787948131197);

zef.h_bf_time_1 = h14;

h15 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'ListboxTop',0,...
'String','Time window length (s):',...
'Style','text',...
'Position',[0.037593984962406 0.438524590163935 0.469924812030075 0.0655737704918033],...
'Children',[],...
'Tag','text27',...
'UserData',[],...
'FontSize',0.44324942791762,...
'CreateFcn', '' );

h16 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'ListboxTop',0,...
'String','0',...
'Style','edit',...
'Value',1,...
'Position',[0.785714285714286 0.434426229508197 0.180451127819549 0.0737704918032787],...
'BackgroundColor',[1 1 1],...
'Callback','zef.bf_time_2 = str2num(get(gcbo,''string''));',...
'Children',[],...
'CreateFcn', '' ,...
'Tag','edit15',...
'FontSize',0.397787948131197);

zef.h_bf_time_2= h16;

h17 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','left',...
'ListboxTop',0,...
'String','Data segment:',...
'Style','text',...
'Position',[0.037593984962406 0.327868852459017 0.469924812030075 0.0655737704918033],...
'Children',[],...
'Tag','text30',...
'UserData',[],...
'FontSize',0.44324942791762,...
'CreateFcn', '' );

h18 = uicontrol(...
'Parent',h1,...
'Units','normalized',...
'FontUnits','normalized',...
'HorizontalAlignment','right',...
'ListboxTop',0,...
'String','1',...
'Style','edit',...
'Value',1,...
'Position',[0.785714285714286 0.323770491803279 0.180451127819549 0.0737704918032787],...
'BackgroundColor',[1 1 1],...
'Callback','zef.bf_data_segment = str2num(get(gcbo,''string''));',...
'Children',[],...
'CreateFcn', '',...
'Tag','edit18',...
'FontSize',0.397787948131197);

zef.h_bf_data_segment = h18;
