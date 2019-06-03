function Plan = CreateScenario(X_max,Y_max)
%This array stores the coordinates of the map and the 
%Objects in each coordinate


% Obtain Obstacle, Target and Robot Position
% Initialize the Plan with input values
% Obstacle=-1,Target = 0,Robot=1,Space=1

Plan=ones(X_max,Y_max);
% 
% j=0;
% x_val = 1;
% y_val = 1;
axis([1 X_max+1 1 Y_max+1])
grid on;
hold on;
n=0;%Number of Obstacles

% BEGIN Interactive Obstacle, Target, Start Location selection
pause(1);
h=msgbox('Please Select the Target using the Left Mouse button');
uiwait(h,5);
if ishandle(h) == 1
    delete(h);
end
xlabel('Please Select the Target using the Left Mouse button','Color','black');
but=0;
while (but ~= 1) %Repeat until the Left button is not clicked
    [xval,yval,but]=ginput(1);
end
xval=floor(xval);
yval=floor(yval);
% xTarget=xval;%X Coordinate of the Target
% yTarget=yval;%Y Coordinate of the Target

Plan(xval,yval)=-2;%Initialize Plan with location of the target
plot(xval+.5,yval+.5,'gd');
text(xval+1,yval+.5,'Target')

pause(2);
h=msgbox('Select Obstacles using the Left Mouse button,to select the last obstacle use the Right button');
  xlabel('Select Obstacles using the Left Mouse button,to select the last obstacle use the Right button','Color','blue');
uiwait(h,10);
if ishandle(h) == 1
    delete(h);
end
while but == 1
    [xval,yval,but] = ginput(1);
    xval=floor(xval);
    yval=floor(yval);
    Plan(xval,yval)=-1;%Put on the closed list as well
    plot(xval+.5,yval+.5,'ro');
 end%End of While loop
 
pause(1);

h=msgbox('Please Select the Vehicle initial position using the Left Mouse button');
uiwait(h,5);
if ishandle(h) == 1
    delete(h);
end
xlabel('Please Select the Vehicle initial position ','Color','black');
but=0;
while (but ~= 1) %Repeat until the Left button is not clicked
    [xval,yval,but]=ginput(1);
    xval=floor(xval);
    yval=floor(yval);
end
% xStart=xval;%Starting Position
% yStart=yval;%Starting Position
Plan(xval,yval)=0;
 plot(xval+.5,yval+.5,'bo');
%End of obstacle-Target pickup

end

