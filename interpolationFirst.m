function out = select_method(number)

S.CNT = 0;
S.fh = figure('units','pixels',...
              'position',[500 500 200 (130 + number*30)],...
              'menubar','none',...
              'numbertitle','off',...
              'name','GUI_19',...
              'resize','off');
              S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (40 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Lagrange',...
               'callback',{@pb_call1,S});
              S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (70 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','Newton Divided Differences',...
               'callback',{@pb_call2,S});
              S.pb(1) = uicontrol('style','push',...
              'units','pixels',...
              'position',[10 (100 + 30*number) 170 30],...
              'fontsize',14, ...
              'string','NB, NF, NC',...
               'callback',{@pb_call3,S});
          
           for i = 1:number + 1
                a = 10 + 30*(i-1);
                S.pb(i) = uicontrol('style','edit',...
                     'units','pixels',...
                     'position',[10 a 85 30],...
                     'fontsize',14);
           end
          
          numberi = number * 2;
          
          for i = number + 2:numberi +1
              a = 10 + 30*(i- number - 1);
              S.pb(i) = uicontrol('style','edit',...
                    'units','pixels',...
                    'position',[100 a 85 30],...
                    'fontsize',14);
          end
         
          answer = 0;
          function [] = pb_call1(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number + 1), 'string'));
              end
              answer = LagrangeInterpolation(X, Y)
          end
            function [] = pb_call2(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number + 1), 'string'));
              end
              answer = NewtonDividedDifferencesInterpolation(X,Y)
           end
             function [] = pb_call3(varargin)
              for j = 1:number
                   X(j, 1) = str2num(get(S.pb(j), 'string'));
                   Y(j, 1) = str2num(get(S.pb(j + number + 1), 'string'));
              end
               answer = NewtonBackwardForwardCentralInterpoltion(X, Y, str2num(get(S.pb(number+1), 'string')))
             end
end