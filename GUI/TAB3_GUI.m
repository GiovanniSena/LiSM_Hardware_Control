function TAB3_GUI(tab)  
%%  Define content of tab #3
%   Contains controls for the webcam
%   The tab is divided in a grid so that it is easier to align objects.

    buttonW = 0.05; %Width of standard buttons
    buttonH = 0.06; %Height of standard buttons
    line1= 0.05;
    line2= 0.05+ buttonH + 0.01;
    line1_2 = (line1 + line2)/2;
    line3= 0.05+ 2*(buttonH + 0.01);
    line4= 0.05+ 3*(buttonH + 0.01);
    line5= 0.05+ 4*(buttonH + 0.01);
    line7= 0.05+ 6*(buttonH + 0.01);
    line9= 0.05+ 8*(buttonH + 0.01)-0.04;
    line11= 0.05+ 10*(buttonH + 0.01)-0.08;
    line13= 0.05+ 12*(buttonH + 0.01)-0.04;
    
    column1 = 0.05;
    column2 = 0.05+2*buttonW+0.01;
    column1_2 = (column1 + column2) /2;
    column3 = 0.05+2*(2*buttonW+0.01);
    column4 = 0.05+3*(2*buttonW+0.01);
    column5 = 0.05+4*(2*buttonW+0.01);
    
    uicontrol('Parent', tab, ...
        'Units', 'normalized', ...
        'Position', [column1 line2 2*buttonW buttonH], ...
        'String', 'WEB ON', ...
        'Style', 'pushbutton',...
        'Enable', 'Inactive',... 
        'HorizontalAlignment', 'center',...
        'Tag', 'WEB_ON',...
        'ButtonDownFcn', {@GUI_clickOther, gcf }, ...%%%
        'FontSize', 10);
       
    uicontrol('Parent', tab, ...
        'Units', 'normalized', ...
        'Position', [column2 line2 2*buttonW buttonH], ...
        'String', 'WEB OFF', ...
        'Style', 'pushbutton',...
        'Enable', 'Inactive',... 
        'HorizontalAlignment', 'center',...
        'Tag', 'WEB_OFF',...
        'ButtonDownFcn', {@GUI_clickOther, gcf }, ...%%%
        'FontSize', 10);
        
    webcamHaxes = axes(...
        'Parent', tab, ...
        'Box', 'off', ...
        'Units', 'normalized', ...
        'Position', [0.1 0.37 0.8 0.6]);
    
    blankimage = ones(640,480,3);
    blankimage(:,:,3) = 0.8; 
    webcamImage= imagesc(blankimage,'Parent', webcamHaxes);
    setappdata(gcf, 'webcamImage', webcamImage);
    
    web_LR_Sld = uicontrol('Parent', tab,...
        'Style', 'slider',...
        'Min', -50,...
        'Max', 50,...
        'Value', 0,...
        'Units', 'normalized',...
        'Position', [0.1 0.32  0.2 0.02],...
        'Tag', 'web_LR',...
        'Callback', {@GUI_webcam_set});
    
    web_UD_Sld = uicontrol('Parent', tab,...
        'Style', 'slider',...
        'Min', -50,...
        'Max', 50,...
        'Value', 0,...
        'Units', 'normalized',...
        'Position', [0.035 0.37  0.02 0.2],...
        'Tag', 'web_UD',...
        'Callback', {@GUI_webcam_set}); 
    
%   BRIGHTNESS SLIDER
     web_bright_Sld = uicontrol('Parent', tab,...
        'Style', 'slider',...
        'Min', -64,...
        'Max', 64,...
        'Value', 0,...
        'Units', 'normalized',...
        'Position', [0.55 0.25  0.2 0.02],...
        'Tag', 'web_BRG',...
        'Callback', {@GUI_webcam_set}); 
    
    web_bright_Lbl= uicontrol('Style','text',...
        'Units', 'normalized',...
        'Parent', tab,...
        'Position',[0.55 0.28 2*buttonW 0.02],...
        'String','BRIGTHNESS');
    
%   EXPOSURE SLIDER
     web_exp_Sld = uicontrol('Parent', tab,...
        'Style', 'slider',...
        'Min', -10,...
        'Max', -3,...
        'Value', -5,...
        'Units', 'normalized',...
        'Position', [0.55 0.17  0.2 0.02],...
        'Tag', 'web_EXP',...
        'Callback', {@GUI_webcam_set});
    
    web_exp_Lbl= uicontrol('Style','text',...
        'Units', 'normalized',...
        'Parent', tab,...
        'Position',[0.55 0.2 2*buttonW 0.02],...
        'String','EXPOSURE');
end