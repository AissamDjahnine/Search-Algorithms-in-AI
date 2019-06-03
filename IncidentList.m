function [ NodeList ] = IncidentList(Map_plan2node,Plan,X_max,Y_max)
% This function creates the incident List based on the scneario defined
% on the graphical interface form script tp1.m
%
% The inputs are the Map_plan2node,Plan,X_max,Y_max
%
% The output is a structure in which NodeList(i).Neigh is a vector that 
% indicates the neighbours of Node "i". The associated cost for a 
% displacement from i to each of the neighbours is saved on the
% corresponding position of the vector NodeList(i).K


    NodeList=struct('Neigh',{},'K',{});
    for i=Map_plan2node(:)'

        [X_pos,Y_pos]=find(Map_plan2node==i);

        if Plan(X_pos,Y_pos)==-1
            NodeList(i).Neigh=[];
        else

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

            neigh=(Map_plan2node((X_pos+ligneHaut):(X_pos+ligneBas),(Y_pos+colGauche):(Y_pos+colDroite))) ; %find all neighbour nodes
            counter=1; % counter representing elements on the structure
            for j=1:length(neigh(:)) % for each neighbour
                if (neigh(j)~=i)&&(Plan(neigh(j))~=-1); % check whether link exist 
                    NodeList(i).Neigh(counter)=neigh(j);
                    % check whether displacement is on diagonal direction
                    [X_neigh,Y_neigh]=find(Map_plan2node==neigh(j));
                    if (X_pos~=X_neigh)&&(Y_pos~=Y_neigh) % row and column of current node and neighbour do not coincide
                        NodeList(i).K(counter)=sqrt(2);
                    else % displacement is either vertical or horizontal
                        NodeList(i).K(counter)=1;
                    end    
                    counter=counter+1;
                end
            end

        end
    end
end

