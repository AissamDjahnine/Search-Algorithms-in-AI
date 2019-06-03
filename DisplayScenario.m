function DisplayScenario(Plan)
%This array stores the coordinates of the map and the 
%Objects in each coordinate


% Obtain Obstacle, Target and Robot Position
% Initialize the Plan with input values
% Obstacle=-1,Target = 0,Robot=1,Space=1

X_max = size(Plan,2);
Y_max = size(Plan,1);

figure(), axis([1 X_max+1 1 Y_max+1]),grid on, hold on;

[i,j] = find(Plan==-1);
for k = 1:length(i)
   plot(i(k)+0.5,j(k)+0.5,'ro');
end

[i,j] = find(Plan==0);
plot(i+0.5,j+0.5,'gd');

[i,j] = find(Plan==-2);
plot(i+0.5,j+0.5,'bo');

