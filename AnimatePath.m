function []=AnimatePath(Path,Map_plan2node,c)
% Display on the scneario, the sequence of nodes given in input vector "Path", 
% according to the mapping Map_plan2node. The input "c" is a character that
% indicates the colour of the path (i.e. c='k'; c='b'; or c='r', etc). See
% Matlab LineSpec (Line Specification), Line specification string syntax
% for more information.

Path_x=[];
Path_y=[];

[x,y]=find(Map_plan2node==Path(1));
p=plot(x+0.5,y+0.5,'ko'); pause(0.2)
for i=2:length(Path)
    [x,y]=find(Map_plan2node==Path(i))
    Path_x=[Path_x; x];
    Path_y=[Path_y; y];
    pause(0.2)
    set(p,'XData',x+.5,'YData',y+.5); drawnow
end
plot(Path_x+0.5,Path_y+0.5,c)


