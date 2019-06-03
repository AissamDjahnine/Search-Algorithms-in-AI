function [Nodes] = IncidentMatrix(Map_plan2node,Plan,X_max,Y_max)
% This function creates the incident matrix based on the scneario defined
% on the graphical interface form script tp1.m
%
% The inputs are the Map_plan2node,Plan,X_max,Y_max

    Nodes=zeros(X_max*Y_max); % Define incident matrix size filled with zeros

    for CurrentNode=Map_plan2node(:)' % for each node 
        [X_pos,Y_pos]=find(Map_plan2node==CurrentNode); % finds it X-Y positining on the Plan

        if Plan(X_pos,Y_pos)~=-1 % Collect the node numbers around the current node

            ligneHaut=-1; ligneBas=+1;
            colGauche=-1; colDroite=+1; 
            % gestion de valeurs au bord do plan
            if X_pos==1; 
                ligneHaut=0;
            end
            if X_pos==X_max;
                ligneBas=0;
            end
            if Y_pos==1;
                colGauche=0;
            end
            if Y_pos==Y_max
                colDroite=0;
            end
            
            neigh=Map_plan2node((X_pos+ligneHaut):(X_pos+ligneBas),(Y_pos+colGauche):(Y_pos+colDroite)) ; % find neihbours
            
            for j=1:length(neigh(:)) % for each neighbour
                if (neigh(j)~=CurrentNode)&&(Plan(neigh(j))~=-1) % check whether link exist
                    % if not supposed neighbour node is not the current node, and if
                    % it is not an obstacle
                    
                    % check whether displacement is on diagonal direction
                    [X_neigh,Y_neigh]=find(Map_plan2node==neigh(j)); % position of the neighbour node
                    if (X_pos~=X_neigh)&&(Y_pos~=Y_neigh) % if row and column of current node and neighbour do not coincide/ diagonal displacement
                        Nodes(CurrentNode,neigh(j))=sqrt(2); % displacement is diagonal
                    else % displacement is either vertical or horizontal
                         Nodes(CurrentNode,neigh(j))=1;
                    end    
                end
            end

        end

    end


end

