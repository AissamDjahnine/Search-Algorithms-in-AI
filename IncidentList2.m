function [ NodeList ] = IncidentList2(Map_plan2node,Plan,X_max,Y_max)
%   Summary of this function goes here
%   Detailed explanation goes here

z=abs(peaks(10));
z=2*(z+z');

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
            k=1; % dummy counter
            for j=1:length(neigh(:))' % for each neighbour
                if (neigh(j)~=i)&&(Plan(neigh(j))~=-1) % check whether link exist
                    NodeList(i).Neigh(k)=neigh(j);
                    NodeList(i).K(k)=z(i)+z(neigh(j))+1;
                    k=k+1;
                end
            end

        end
    end
end

