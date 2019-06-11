close all
clc

% Initialize the Plan with input values
% Obstacle=-1,Target = 0,Robot=1,Space=1
X_max=10;
Y_max=10;

figure
Plan=CreateScenario(X_max,Y_max);
title(' Sceanrio ')
% Generation of Map_plan2node
n=0;
for j=1:Y_max;
    for i=1:X_max
        n=n+1;
        Map_plan2node(i,j)=n;
    end
end

% Generation of NodeList
[NodeList] =IncidentList(Map_plan2node,Plan,X_max,Y_max);

% Generation of Nodes
[Nodes] = IncidentMatrix(Map_plan2node,Plan,X_max,Y_max);

% Identification of TargetNode and RootNode
[target_x,target_y]=find(Plan==-2);
TargetNode=Map_plan2node(target_x,target_y);
[root_x,root_y]=find(Plan==0);
RootNode=Map_plan2node(root_x,root_y);

%% Breadh First Search :
tic;[Path_BFS , NodeNumber_BFS ]= BFS( Nodes, NodeList , RootNode , TargetNode);temps_execution_largeur = toc;
Path_BFS=fliplr(Path_BFS);
AnimatePath(Path_BFS,Map_plan2node,'b');
legend(' BFS ')
h=msgbox('BFS is Finished , tap OK to continue ');
uiwait(h,40);
if ishandle(h) == 1
    delete(h);
end
%hold on
%% Depth :  
tic;[Path_DFS , NodeNumber_DFS ]= DFS( Nodes, NodeList , RootNode , TargetNode);temps_execution_profondeur=toc;
Path_DFS=fliplr(Path_DFS);
AnimatePath(Path_DFS,Map_plan2node,'r');
legend(' DFS ')
h=msgbox('DFS is Finished , tap OK to continue');
uiwait(h,40);
if ishandle(h) == 1
    delete(h);
end
%hold on
%% A Star (Euclidian Distance ) :  
[NodeList(:).x] = deal(X_max*Y_max);
[NodeList(:).y] = deal(X_max*Y_max);     % avoir les coordonnees
[NodeList(:).g] = deal(X_max*Y_max);      % Cout
[NodeList(:).h] = deal(X_max*Y_max);      % Heuristique
[NodeList(:).parent] = deal(X_max*Y_max); % Stocker parent

tic;[Astar_Chemin , NodeNumber_AStar_Euc ]= Astar( Nodes,NodeList,RootNode,TargetNode,Map_plan2node);temps_execution_Asatr=toc;
AnimatePath(Astar_Chemin,Map_plan2node,'y');
legend(' A * ')
h=msgbox('A* Euclidien distance is Finished, tap OK to continue');
uiwait(h,40);
if ishandle(h) == 1
    delete(h);
end

%% A Star Manhattan Distance : 
tic;[Astar_man_Chemin , NodeNumber_AStar_Man ]= AstarMan( Nodes,NodeList,RootNode,TargetNode,Map_plan2node);temps_execution_Asatr_man=toc;
AnimatePath(Astar_man_Chemin,Map_plan2node,'g*');
legend(' A* Manhatan')
h=msgbox('A* Manhattan is Finished, tap OK to continue ');
uiwait(h,40);
if ishandle(h) == 1
    delete(h);
end

%% Astar ( Variables costs ) :
[Nodes] = IncidentMatrix2(Map_plan2node,Plan,X_max,Y_max);
[NodeList] = IncidentList2(Map_plan2node,Plan,X_max,Y_max);

tic;[Astar_cout_Chemin , NodeNumber_AStar_Euc ]= Astar( Nodes,NodeList,RootNode,TargetNode,Map_plan2node);temps_execution_Asatr_c=toc;
AnimatePath(Astar_cout_Chemin,Map_plan2node,'p');
legend('A* Variable Cost')
h=msgbox('A* Variable Cost is Finished, tap OK to continue ');
uiwait(h,40);
if ishandle(h) == 1
    delete(h);
end
