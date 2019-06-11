function [ Chemin , NombreDeNoeud ]=RechercheEnProfondeur(Nodes, NodeList , RootNode , TargetNode)

Chemin = [];
NombreDeNoeud = 0;             
Visited =[RootNode];  %RootNode Exploré
S=[NodeList( RootNode ).Neigh ];  % S prend les fils de RootNode
Parent=[];
Child=[];
for i=1:length( NodeList(RootNode).Neigh )
    Child(i) = NodeList(RootNode).Neigh(i);
    Parent(i)= RootNode;
end

    while length(Chemin)== 0

        if length( Visited ) == 0 
            disp(' FAIL ' );
            break
        end
        
        Current_Node = S(1);     % Noeud a exploré
        S=S(2:end);        % L'nlever de S 
        
        if Current_Node == TargetNode
            disp(' **** Chemin trouvé **** ' )
            Chemin = [Chemin Current_Node];        %if (Goal_test(Node)) return Node;
            Visited=[Visited Current_Node];
            break
        end

        if ismember(Current_Node , Visited) ~= true
            Visited =[Visited Current_Node] ;    % Le noeud exploré se met en Visited
            if length( NodeList( Current_Node ).Neigh) ~= 0     % Le noeud exploré a t il des fils ?
                S=[NodeList(Current_Node).Neigh S];    % Si oui on les met en première position dans S pour les explorer en premier
            end
            j=1;
            for i = length(Parent)+1:length(Parent)+ length( NodeList(Current_Node).Neigh )
                if ismember( NodeList(Current_Node).Neigh(j),Visited ) ~=true
                    Child(i) = NodeList(Current_Node).Neigh(j);
                    Parent(i)= Current_Node;
                end
            j = j+1;
            end
        end
    end
    while 1
        flag = 0;
        j=1;
        while flag == 0
            if Child(j) == Current_Node
                index = j;
                flag = 1;
            else 
                j = j+1;
            end 
        end
            Current_Node = Parent( j );
            Chemin = [Chemin Current_Node];
            if Current_Node == RootNode 
                break
            end
    end
    NombreDeNoeud = length(Chemin);
end