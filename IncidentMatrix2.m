function [Nodes] = IncidentMatrix2(Map_plan2node,Plan,X_max,Y_max)
%   Summary of this function goes here
%   Detailed explanation goes here
z=abs(peaks(10));
z=2*(z+z');

Nodes=zeros(X_max*Y_max);

    for i=Map_plan2node(:)'
        [X_pos,Y_pos]=find(Map_plan2node==i);

        Node_ligne=zeros(1,X_max*Y_max);

        if Plan(X_pos,Y_pos)~=-1

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

            Node_ligne(Map_plan2node((X_pos+ligneHaut):(X_pos+ligneBas),(Y_pos+colGauche):(Y_pos+colDroite)))=1 ; % set all neighbours to 1

            neigh=find(Node_ligne==1); % neighbour nodes 
            for j=neigh
                Node_ligne(j)=z(i)+z(j)+1;
            end
            %Find neigbour nodes with obstacles
            Pos_obst_node = find(Plan(neigh)==-1);
            %clear nodes with obstacles form Mode_ligne
            Node_ligne(neigh(Pos_obst_node))=0;
            Node_ligne(i)=0; % set the node to zero.

        end
        Nodes(i,:)=Node_ligne;
    end


end

