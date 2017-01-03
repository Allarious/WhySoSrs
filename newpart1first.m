function [] = GUI_35()
% Demonstrate how to use toggle buttons to mimic tabbed panels.  
% Creates a GUI with three toggle buttons which act as tabs.  One of the 
% tabs is not selectable until the user plots a random quartic by 
% pressing the pushbutton at the bottom of the screen.  The middle tab 
% shows the result of fitting (with polyfit) a polynomial to the "unknown" 
% quartic.  
%
% Suggested exercise:  Add another tab which contains help info for how to
% use the GUI.
%
% 
% Author:  Matt Fig
% Date:  7/15/2009

SCR = get(0,'Screensize');  % Get screensize.
S.fh = figure('numbertitle','off',...
              'menubar','none',...
              'units','pixels',...
              'position',[SCR(3)/2-200 ,SCR(4)/2-200 , 370, 450],...
              'name','Chapter 1',...
              'resize','off');
W = {'style','text','units','pixels','position'};  % Save some typing.  
S.tx2(7) = uicontrol(W{:},[-10 348 100 30],'string','Enter Formula');
S.tx2(6) = uicontrol(W{:},[-20 80 100 30],'string','f');
S.tx2(5) = uicontrol(W{:},[-20 120 100 30],'string','e');
S.tx2(4) = uicontrol(W{:},[-20 160 100 30],'string','d');
S.tx2(3) = uicontrol(W{:},[-20 200 100 30],'string','c');
S.tx2(2) = uicontrol(W{:},[-20 240 100 30],'string','b');
S.tx2(1) = uicontrol(W{:},[-20 280 100 30],'string','a');

S.tx1(6) = uicontrol(W{:},[150 80 100 30],'string','e(f)');
S.tx1(5) = uicontrol(W{:},[150 120 100 30],'string','e(e)');
S.tx1(4) = uicontrol(W{:},[150 160 100 30],'string','e(d)');
S.tx1(3) = uicontrol(W{:},[150 200 100 30],'string','e(c)');
S.tx1(2) = uicontrol(W{:},[150 240 100 30],'string','e(b)');
S.tx1(1) = uicontrol(W{:},[150 280 100 30],'string','e(a)');

S.ans = uicontrol(W{:},[80 350 270 40], 'visible' , 'off');

W = {'style','edit','units','pixels','position'};  % Save some typing.  
S.ed1(6) = uicontrol(W{:},[50 90 100 30]);
S.ed1(5) = uicontrol(W{:},[50 130 100 30]);
S.ed1(4) = uicontrol(W{:},[50 170 100 30]);
S.ed1(3) = uicontrol(W{:},[50 210 100 30]);
S.ed1(2) = uicontrol(W{:},[50 250 100 30]);
S.ed1(1) = uicontrol(W{:},[50 290 100 30]);

S.ed2(7) = uicontrol(W{:},[80 350 270 40]);
S.ed2(6) = uicontrol(W{:},[220 90 100 30]);
S.ed2(5) = uicontrol(W{:},[220 130 100 30]);
S.ed2(4) = uicontrol(W{:},[220 170 100 30]);
S.ed2(3) = uicontrol(W{:},[220 210 100 30]);
S.ed2(2) = uicontrol(W{:},[220 250 100 30]);
S.ed2(1) = uicontrol(W{:},[220 290 100 30]);

S.pb1 = uicontrol('style','pushbutton',...
                  'units','pixels',...
                  'position',[35 20 140 40],...
                  'string','Relative',...
                  'fontsize',12);
S.pb2 = uicontrol('style','pushbutton',...
                  'units','pixels',...
                  'position',[195 20 140 40],...
                  'string','Absolute',...
                  'fontsize',12);
% Toggles will act as the tabs.              
S.tg(1) = uicontrol('style','toggle',...
                    'units','pixels',...
                    'position',[5 405 60 40],...
                    'string','Data',...
                    'val',1);
S.tg(2) = uicontrol('style','toggle',...
                    'units','pixels',...
                    'position',[65 405 100 40],...
                    'string','Step By Step',...
                    'value',0,...
                    'enable','off');
S.tg(3) = uicontrol('style','toggle',...
                    'units','pixels',...
                    'position',[165 405 60 40],...
                    'string','Answer',...
                    'value',0,...
                    'enable','off');
S.tx = uicontrol('style','text',...
                 'units','pixels',...
                 'position',[20 20 360 300],...
                 'visible','off',...
                 'string',{' ','This is a GUI with', 'fake tabs.',...
                 'Hope you enjoy.',' ',' ','Copyright:',...
                 'Matt Fig 2009'},...
                 'fontsize',20,'fontweight','bold');
W = {'style','edit','units','pixels','position'};  % Save some typing.               
S.ed(5) = uicontrol(W{:},[50 100 300 30]);
S.ed(4) = uicontrol(W{:},[50 140 300 30]);
S.ed(3) = uicontrol(W{:},[50 180 300 30]);
S.ed(2) = uicontrol(W{:},[50 220 300 30]);
S.ed(1) = uicontrol(W{:},[50 260 300 30]);
% Set remaining properties.
set(S.pb1,'callback',{@pb_call1,S})  
set(S.pb2,'callback',{@pb_call2,S})  % Set the callbacks.
set(S.tg(:),{'callback'},{{@tg_call,S}})
set(S.ed(:),'visible','off','fontsize',12,'fontweight','bold',...
    'backgroundcolor',[1 1 1])



function [] = pb_call1(varargin)
% Callback for pushbutton.
     errStr  = relativeErrorCalculator(get(S.ed2(7), 'string'), S);
vectorX = [S.ed1(1), S.ed1(2), S.ed1(3), S.ed1(4), S.ed1(5), S.ed1(6)];
vectorErrX = [S.ed2(1), S.ed2(2), S.ed2(3), S.ed2(4), S.ed2(5), S.ed2(6)];
for i = 1:6
    if(isempty(get(vectorX(i), 'string')) == 0 )
        vectorXNew(i) = str2num(get(vectorX(i), 'string'));
    else
        vectorXNew(i) = 1587456;
    end
        if(isempty(get(vectorErrX(i), 'string')) == 0)
        vectorErrXNew(i) = str2num(get(vectorErrX(i), 'string'));
    else
        vectorErrXNew(i) = 1587456;
    end
end

a = calculateErrorBasedOnVariables(errStr, vectorXNew, vectorErrXNew);
% c = num2str(double(a));

set(S.ans,'string',a);

% f = figure('units','pixels',...
%        'menubar','none',...
%        'position',[750 510 200 100]); % Create a new GUI.
% E = uicontrol('style','text',...
%               'units','pixels',...
%               'position',[10 20 180 60],...
%               'string',c);
set(varargin{3}.tg(2),'enable','on');  % Turn on 'Fit' tab.
set(varargin{3}.tg(3),'enable','on');
end

function [] = pb_call2(varargin)
% Callback for pushbutton.
     errStr  = absoluteErrorCalculator(get(S.ed2(7), 'string'));
vectorX = [S.ed1(1), S.ed1(2), S.ed1(3), S.ed1(4), S.ed1(5), S.ed1(6)];
vectorErrX = [S.ed2(1), S.ed2(2), S.ed2(3), S.ed2(4), S.ed2(5), S.ed2(6)];
for i = 1:6
    if(isempty(get(vectorX(i), 'string')) == 0 )
        vectorXNew(i) = str2num(get(vectorX(i), 'string'));
    else
        vectorXNew(i) = 1587456;
    end
        if(isempty(get(vectorErrX(i), 'string')) == 0)
        vectorErrXNew(i) = str2num(get(vectorErrX(i), 'string'));
    else
        vectorErrXNew(i) = 1587456;
    end
end

a = calculateErrorBasedOnVariables(errStr, vectorXNew, vectorErrXNew);
%  c = num2str(double(a));

set(S.ans,'string',a);

% f = figure('units','pixels',...
%        'menubar','none',...
%        'position',[750 510 200 100]); % Create a new GUI.
% E = uicontrol('style','text',...
%               'units','pixels',...
%               'position',[10 20 180 60],...
%               'string',c);
set(varargin{3}.tg(2),'enable','on');  % Turn on 'Fit' tab.
set(varargin{3}.tg(3),'enable','on');
end

end

function [] = tg_call(varargin)
% Callback for togglebuttons.
[h,S] = varargin{[1,3]};  % Get calling handle ans structure.

if get(h,'val')==0  % Here the Toggle is already pressed.
    set(h,'val',1) % To keep the Tab-like functioning.
end

% Each case of the switch has one toggle associated with it.  When a toggle
% is selected the uicontrols which belong to it are made visible, and the
% others are made invisible.  This way each toggle has, in effect, its own 
% GUI.  All uicontrols are part of the main GUI, some are simply hidden
% when each toggle is selected.  This mimics the action of tabs.
switch h
    case S.tg(1)
         set(S.ans,{'visible'},{'off'});
         set(S.tg([2,3]),'val',0)   
         set(S.tg([1,3]),{'val'},{0})
         for j = 1:6
             set(S.ed1(j),{'visible'},{'on'});
         end
         for j = 1:7
             set(S.ed2(j),{'visible'},{'on'});
         end
         for j = 1:6
             set(S.tx1(j),{'visible'},{'on'});
         end
         for j = 1:7
             set(S.tx2(j),{'visible'},{'on'});
         end
         set(S.pb2,{'visible'},{'on'});
         set(S.pb1,{'visible'},{'on'});
%         set([S.ax,S.pb1,L],{'visible'},{'on'})
%         set([S.ed(:);S.tx],{'visible'},{'off'})
    case S.tg(2)
         set(S.ans,{'visible'},{'off'});
         set(S.tg([1,3]),{'val'},{0})
         for j = 1:6
             set(S.ed1(j),{'visible'},{'off'});
         end
         for j = 1:7
             set(S.ed2(j),{'visible'},{'off'});
         end
         for j = 1:6
             set(S.tx1(j),{'visible'},{'off'});
         end
         for j = 1:7
             set(S.tx2(j),{'visible'},{'off'});
         end
         set(S.pb2,{'visible'},{'off'});
         set(S.pb1,{'visible'},{'off'});
%         set(S.ed(:),{'visible'},{'on'})
%         set([S.ax,S.pb1,L,S.tx],{'visible'},{'off'})
%         STR = 'The x^0 coefficient is:  ';
%         p = round(polyfit(get(L,'xdata'),get(L,'ydata'),4));
%         for ii = 0:4
%             STR(7) = num2str(ii);
%             set(S.ed(5-ii),'str',[STR,num2str(p(5-ii))])
%         end
    otherwise
         set(S.ans,{'visible'},{'on'});
         set(S.tg([1,2]),{'val'},{0})
                  set(S.tg([1,3]),{'val'},{0})
         for j = 1:6
             set(S.ed1(j),{'visible'},{'off'});
         end
         for j = 1:7
             set(S.ed2(j),{'visible'},{'off'});
         end
         for j = 1:6
             set(S.tx1(j),{'visible'},{'off'});
         end
         for j = 1:7
             set(S.tx2(j),{'visible'},{'off'});
         end
         set(S.pb2,{'visible'},{'off'});
         set(S.pb1,{'visible'},{'off'});
%         set(S.tx,'visible','on')
%         set([S.ax;S.pb1;L;S.ed(:)],{'visible'},{'off'})     
end
end