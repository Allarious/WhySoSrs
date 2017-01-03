function out = select_method(number)

S.CNT = 0;
S.fh = figure('units','pixels',...
              'position',[500 500 200 (250 + number*30)],...
              'menubar','none',...
              'numbertitle','off',...
              'name','GUI_19',...
              'resize','off');
           S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (10 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Fit',...
               'callback',{@pb_call,S});
           S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (40 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Fit to a*exp(b*x)',...
               'callback',{@pb_call1,S});
                      S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (70 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Fit to a*ln(x) + b',...
               'callback',{@pb_call2,S});
                      S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (100 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Fit to a/x + b',...
               'callback',{@pb_call3,S});
                      S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (130 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Fit to 1/(a*x + b)',...
               'callback',{@pb_call4,S});
                      S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (160 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Fit polynomial 1st degree',...
               'callback',{@pb_call5,S});
                      S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (190 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Fit polynomial 2nd degree',...
               'callback',{@pb_call6,S});
                      S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (220 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Fit polynomial 3rd degree',...
               'callback',{@pb_call7,S});
          
           for i = 1:number
                a = 10 + 30*(i-1);
                S.pb(i) = uicontrol('style','edit',...
                     'units','pixels',...
                     'position',[10 a 85 30],...
                     'fontsize',14);
           end
          
          numberi = number * 2;
          
          for i = number + 1:numberi
              a = 10 + 30*(i- number - 1);
              S.pb(i) = uicontrol('style','edit',...
                    'units','pixels',...
                    'position',[100 a 85 30],...
                    'fontsize',14);
          end
         
          answer = 0;
          
          function [] = pb_call(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number), 'string'));
              end
              answer = findBestFittingCurve(X, Y)
          end
          function [] = pb_call1(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number), 'string'));
              end
              answer = exponentialCurveFitting(X, Y)
              
                            
                            S.fh = figure('units','pixels',...
              'position',[560 528 560 420],...
              'menubar','none',...
              'name','GUI_27',...
              'numbertitle','off',...
              'resize','off');
% Now make a simple plot.
x = -100:.001:100;
plot(x,answer(2) * exp(answer(1) * x));
S.ax = gca;
set(S.ax,'unit','pix','position',[40 40 480 340]);
axis([-100 100 -100 100])
% Fill the structure with data.
S.XLM = get(S.ax,'xlim');
S.YLM = get(S.ax,'ylim');
S.AXP = get(S.ax,'pos');
S.DFX = diff(S.XLM);
S.DFY = diff(S.YLM);
S.tx(1) = uicontrol('style','tex',...
                    'unit','pix',...
                    'posit',[50 390 250 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold',... 
                    'string','Current Pointer Location:');
% This textbox will display the current position of the mouse.
S.tx(2) = uicontrol('style','tex',...
                    'unit','pix',...
                    'position',[310 390 120 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold' );
            
set(S.fh,'windowbuttonmotionfcn',{@fh_wbmfcn,S}) % Set the motion detector.

function [] = fh_wbmfcn(varargin)
% WindowButtonMotionFcn for the figure.
S = varargin{3};  % Get the structure.
F = get(S.fh,'currentpoint');  % The current point w.r.t the figure.
% Figure out of the current point is over the axes or not -> logicals.
tf1 = S.AXP(1) <= F(1) && F(1) <= S.AXP(1) + S.AXP(3);
tf2 = S.AXP(2) <= F(2) && F(2) <= S.AXP(2) + S.AXP(4);

if tf1 && tf2
    % Calculate the current point w.r.t. the axes.
    Cx =  S.XLM(1) + (F(1)-S.AXP(1)).*(S.DFX/S.AXP(3));
    Cy =  S.YLM(1) + (F(2)-S.AXP(2)).*(S.DFY/S.AXP(4));
    set(S.tx(2),'str',num2str([Cx,Cy],2))
end
end
              

              
          end
            function [] = pb_call2(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number), 'string'));
              end
              answer = naturalLogarithmCurveFitting(X,Y)
              
              
                            S.fh = figure('units','pixels',...
              'position',[560 528 560 420],...
              'menubar','none',...
              'name','GUI_27',...
              'numbertitle','off',...
              'resize','off');
% Now make a simple plot.
x = -100:.001:100;
plot(x,answer(2) * log(x) + answer(1));
S.ax = gca;
set(S.ax,'unit','pix','position',[40 40 480 340]);
axis([-100 100 -100 100])
% Fill the structure with data.
S.XLM = get(S.ax,'xlim');
S.YLM = get(S.ax,'ylim');
S.AXP = get(S.ax,'pos');
S.DFX = diff(S.XLM);
S.DFY = diff(S.YLM);
S.tx(1) = uicontrol('style','tex',...
                    'unit','pix',...
                    'posit',[50 390 250 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold',... 
                    'string','Current Pointer Location:');
% This textbox will display the current position of the mouse.
S.tx(2) = uicontrol('style','tex',...
                    'unit','pix',...
                    'position',[310 390 120 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold' );
            
set(S.fh,'windowbuttonmotionfcn',{@fh_wbmfcn,S}) % Set the motion detector.

function [] = fh_wbmfcn(varargin)
% WindowButtonMotionFcn for the figure.
S = varargin{3};  % Get the structure.
F = get(S.fh,'currentpoint');  % The current point w.r.t the figure.
% Figure out of the current point is over the axes or not -> logicals.
tf1 = S.AXP(1) <= F(1) && F(1) <= S.AXP(1) + S.AXP(3);
tf2 = S.AXP(2) <= F(2) && F(2) <= S.AXP(2) + S.AXP(4);

if tf1 && tf2
    % Calculate the current point w.r.t. the axes.
    Cx =  S.XLM(1) + (F(1)-S.AXP(1)).*(S.DFX/S.AXP(3));
    Cy =  S.YLM(1) + (F(2)-S.AXP(2)).*(S.DFY/S.AXP(4));
    set(S.tx(2),'str',num2str([Cx,Cy],2))
end
end
              
              
           end
             function [] = pb_call3(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number), 'string'));
              end
               answer = commandoHomographicCurveFitting(X,Y, 1)
               
               
                             S.fh = figure('units','pixels',...
              'position',[560 528 560 420],...
              'menubar','none',...
              'name','GUI_27',...
              'numbertitle','off',...
              'resize','off');
% Now make a simple plot.
x = -100:.001:100;
plot(x,answer(2)./x + answer(1));
S.ax = gca;
set(S.ax,'unit','pix','position',[40 40 480 340]);
axis([-100 100 -100 100])
% Fill the structure with data.
S.XLM = get(S.ax,'xlim');
S.YLM = get(S.ax,'ylim');
S.AXP = get(S.ax,'pos');
S.DFX = diff(S.XLM);
S.DFY = diff(S.YLM);
S.tx(1) = uicontrol('style','tex',...
                    'unit','pix',...
                    'posit',[50 390 250 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold',... 
                    'string','Current Pointer Location:');
% This textbox will display the current position of the mouse.
S.tx(2) = uicontrol('style','tex',...
                    'unit','pix',...
                    'position',[310 390 120 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold' );
            
set(S.fh,'windowbuttonmotionfcn',{@fh_wbmfcn,S}) % Set the motion detector.

function [] = fh_wbmfcn(varargin)
% WindowButtonMotionFcn for the figure.
S = varargin{3};  % Get the structure.
F = get(S.fh,'currentpoint');  % The current point w.r.t the figure.
% Figure out of the current point is over the axes or not -> logicals.
tf1 = S.AXP(1) <= F(1) && F(1) <= S.AXP(1) + S.AXP(3);
tf2 = S.AXP(2) <= F(2) && F(2) <= S.AXP(2) + S.AXP(4);

if tf1 && tf2
    % Calculate the current point w.r.t. the axes.
    Cx =  S.XLM(1) + (F(1)-S.AXP(1)).*(S.DFX/S.AXP(3));
    Cy =  S.YLM(1) + (F(2)-S.AXP(2)).*(S.DFY/S.AXP(4));
    set(S.tx(2),'str',num2str([Cx,Cy],2))
end
end
               
               
               
           end
             function [] = pb_call4(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number), 'string'));
              end
               answer = generalHomographicCurveFitting(X,Y,1)
               
               
                             S.fh = figure('units','pixels',...
              'position',[560 528 560 420],...
              'menubar','none',...
              'name','GUI_27',...
              'numbertitle','off',...
              'resize','off');
% Now make a simple plot.
x = -100:.001:100;
plot(x,1/(answer(2)*x + answer(1)));
S.ax = gca;
set(S.ax,'unit','pix','position',[40 40 480 340]);
axis([-100 100 -100 100])
% Fill the structure with data.
S.XLM = get(S.ax,'xlim');
S.YLM = get(S.ax,'ylim');
S.AXP = get(S.ax,'pos');
S.DFX = diff(S.XLM);
S.DFY = diff(S.YLM);
S.tx(1) = uicontrol('style','tex',...
                    'unit','pix',...
                    'posit',[50 390 250 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold',... 
                    'string','Current Pointer Location:');
% This textbox will display the current position of the mouse.
S.tx(2) = uicontrol('style','tex',...
                    'unit','pix',...
                    'position',[310 390 120 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold' );
            
set(S.fh,'windowbuttonmotionfcn',{@fh_wbmfcn,S}) % Set the motion detector.

function [] = fh_wbmfcn(varargin)
% WindowButtonMotionFcn for the figure.
S = varargin{3};  % Get the structure.
F = get(S.fh,'currentpoint');  % The current point w.r.t the figure.
% Figure out of the current point is over the axes or not -> logicals.
tf1 = S.AXP(1) <= F(1) && F(1) <= S.AXP(1) + S.AXP(3);
tf2 = S.AXP(2) <= F(2) && F(2) <= S.AXP(2) + S.AXP(4);

if tf1 && tf2
    % Calculate the current point w.r.t. the axes.
    Cx =  S.XLM(1) + (F(1)-S.AXP(1)).*(S.DFX/S.AXP(3));
    Cy =  S.YLM(1) + (F(2)-S.AXP(2)).*(S.DFY/S.AXP(4));
    set(S.tx(2),'str',num2str([Cx,Cy],2))
end
end
               
               
            end
             function [] = pb_call5(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number), 'string'));
              end
               answer = polynomialCurveFitting(X, Y, 1)
               
               
                             S.fh = figure('units','pixels',...
              'position',[560 528 560 420],...
              'menubar','none',...
              'name','GUI_27',...
              'numbertitle','off',...
              'resize','off');
% Now make a simple plot.
x = -100:.001:100;
plot(x,answer(2)*x.^1 + answer(1));
S.ax = gca;
set(S.ax,'unit','pix','position',[40 40 480 340]);
axis([-100 100 -100 100])
% Fill the structure with data.
S.XLM = get(S.ax,'xlim');
S.YLM = get(S.ax,'ylim');
S.AXP = get(S.ax,'pos');
S.DFX = diff(S.XLM);
S.DFY = diff(S.YLM);
S.tx(1) = uicontrol('style','tex',...
                    'unit','pix',...
                    'posit',[50 390 250 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold',... 
                    'string','Current Pointer Location:');
% This textbox will display the current position of the mouse.
S.tx(2) = uicontrol('style','tex',...
                    'unit','pix',...
                    'position',[310 390 120 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold' );
            
set(S.fh,'windowbuttonmotionfcn',{@fh_wbmfcn,S}) % Set the motion detector.

function [] = fh_wbmfcn(varargin)
% WindowButtonMotionFcn for the figure.
S = varargin{3};  % Get the structure.
F = get(S.fh,'currentpoint');  % The current point w.r.t the figure.
% Figure out of the current point is over the axes or not -> logicals.
tf1 = S.AXP(1) <= F(1) && F(1) <= S.AXP(1) + S.AXP(3);
tf2 = S.AXP(2) <= F(2) && F(2) <= S.AXP(2) + S.AXP(4);

if tf1 && tf2
    % Calculate the current point w.r.t. the axes.
    Cx =  S.XLM(1) + (F(1)-S.AXP(1)).*(S.DFX/S.AXP(3));
    Cy =  S.YLM(1) + (F(2)-S.AXP(2)).*(S.DFY/S.AXP(4));
    set(S.tx(2),'str',num2str([Cx,Cy],2))
end
end
               
               
               
            end
             function [] = pb_call6(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number), 'string'));
            end
               answer = polynomialCurveFitting(X, Y, 2)
               
               
                             S.fh = figure('units','pixels',...
              'position',[560 528 560 420],...
              'menubar','none',...
              'name','GUI_27',...
              'numbertitle','off',...
              'resize','off');
% Now make a simple plot.
x = -100:.001:100;
plot(x,answer(3)*x.^2 + answer(2)*x.^1 + answer(1));
S.ax = gca;
set(S.ax,'unit','pix','position',[40 40 480 340]);
axis([-100 100 -100 100])
% Fill the structure with data.
S.XLM = get(S.ax,'xlim');
S.YLM = get(S.ax,'ylim');
S.AXP = get(S.ax,'pos');
S.DFX = diff(S.XLM);
S.DFY = diff(S.YLM);
S.tx(1) = uicontrol('style','tex',...
                    'unit','pix',...
                    'posit',[50 390 250 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold',... 
                    'string','Current Pointer Location:');
% This textbox will display the current position of the mouse.
S.tx(2) = uicontrol('style','tex',...
                    'unit','pix',...
                    'position',[310 390 120 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold' );
            
set(S.fh,'windowbuttonmotionfcn',{@fh_wbmfcn,S}) % Set the motion detector.

function [] = fh_wbmfcn(varargin)
% WindowButtonMotionFcn for the figure.
S = varargin{3};  % Get the structure.
F = get(S.fh,'currentpoint');  % The current point w.r.t the figure.
% Figure out of the current point is over the axes or not -> logicals.
tf1 = S.AXP(1) <= F(1) && F(1) <= S.AXP(1) + S.AXP(3);
tf2 = S.AXP(2) <= F(2) && F(2) <= S.AXP(2) + S.AXP(4);

if tf1 && tf2
    % Calculate the current point w.r.t. the axes.
    Cx =  S.XLM(1) + (F(1)-S.AXP(1)).*(S.DFX/S.AXP(3));
    Cy =  S.YLM(1) + (F(2)-S.AXP(2)).*(S.DFY/S.AXP(4));
    set(S.tx(2),'str',num2str([Cx,Cy],2))
end
end
               
               
            end
             function [] = pb_call7(varargin)  
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number), 'string'));
              end
               answer = polynomialCurveFitting(X, Y, 3)
                
               
               S.fh = figure('units','pixels',...
              'position',[560 528 560 420],...
              'menubar','none',...
              'name','GUI_27',...
              'numbertitle','off',...
              'resize','off');
% Now make a simple plot.
x = -100:0.001:100;
plot(x,answer(4)*x.^3 + answer(3)*x.^2 + answer(2)*x.^1 + answer(1));
S.ax = gca;
set(S.ax,'unit','pix','position',[40 40 480 340]);
axis([-100 100 -100 100])
% Fill the structure with data.
S.XLM = get(S.ax,'xlim');
S.YLM = get(S.ax,'ylim');
S.AXP = get(S.ax,'pos');
S.DFX = diff(S.XLM);
S.DFY = diff(S.YLM);
S.tx(1) = uicontrol('style','tex',...
                    'unit','pix',...
                    'posit',[50 390 250 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold',... 
                    'string','Current Pointer Location:');
% This textbox will display the current position of the mouse.
S.tx(2) = uicontrol('style','tex',...
                    'unit','pix',...
                    'position',[310 390 120 20],...
                    'backg',get(S.fh,'color'),...
                    'fontsize',14,'fontweight','bold' );
            
set(S.fh,'windowbuttonmotionfcn',{@fh_wbmfcn,S}) % Set the motion detector.

function [] = fh_wbmfcn(varargin)
% WindowButtonMotionFcn for the figure.
S = varargin{3};  % Get the structure.
F = get(S.fh,'currentpoint');  % The current point w.r.t the figure.
% Figure out of the current point is over the axes or not -> logicals.
tf1 = S.AXP(1) <= F(1) && F(1) <= S.AXP(1) + S.AXP(3);
tf2 = S.AXP(2) <= F(2) && F(2) <= S.AXP(2) + S.AXP(4);

if tf1 && tf2
    % Calculate the current point w.r.t. the axes.
    Cx =  S.XLM(1) + (F(1)-S.AXP(1)).*(S.DFX/S.AXP(3));
    Cy =  S.YLM(1) + (F(2)-S.AXP(2)).*(S.DFY/S.AXP(4));
    set(S.tx(2),'str',num2str([Cx,Cy],2))
end
end
end
end