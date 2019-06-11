function [chemin,NombreDeNoeud] = AstarMan(Nodes,NodeList,RootNode,TargetNode,Map_plan2node)
Closed = [];
Open = [RootNode];
chemin=[];
NombreDeNoeud = 0;
NodeList(RootNode).g = 0;
[NodeList(TargetNode).x,NodeList(TargetNode).y] = find(Map_plan2node == TargetNode);     %trouver les coordonnées de Target
[NodeList(RootNode).x,NodeList(RootNode).y] = find(Map_plan2node == RootNode);  %trouver les coordonnées de RootNode
NodeList(RootNode).h = abs(square(NodeList(TargetNode).x-NodeList(RootNode).x)+square(NodeList(TargetNode).y-NodeList(RootNode).y)); %Heuristique de Rootnode
while length(Open) ~= 0
    nbest = Open(1);
    NombreDeNoeud = NombreDeNoeud + 1;
    chemin(end+1)= nbest;
    Open = Open(2:end);
    Closed(end+1) = nbest;
    if(nbest == TargetNode)
        break;
    end
    for i = 1:length(NodeList(nbest).Neigh)        %Pour chaque fils
        if(not(ismember(NodeList(nbest).Neigh(i),Closed)))     %Pas dans Closed
            if(not(ismember(NodeList(nbest).Neigh(i),Open)))    %Pas dans Open
                NodeList(NodeList(nbest).Neigh(i)).parent = nbest;    
                Open(end+1) = NodeList(nbest).Neigh(i);     % Ajouter nBest dans Open
                NodeList(NodeList(nbest).Neigh(i)).g = NodeList(nbest).g + NodeList(nbest).K(i);    %Calcul de la nouvelle valeur de f
                [NodeList(NodeList(nbest).Neigh(i)).x,NodeList(NodeList(nbest).Neigh(i)).y]=find(Map_plan2node == NodeList(nbest).Neigh(i));  %trouver les coordonnées de nBest
                NodeList(NodeList(nbest).Neigh(i)).h = abs(square(NodeList(TargetNode).x-NodeList(NodeList(nbest).Neigh(i)).x)+square(NodeList(TargetNode).y-NodeList(NodeList(nbest).Neigh(i)).y));  %Heuristique du nBest's child
            else
                if(NodeList(nbest).g + NodeList(nbest).K(i) < NodeList(NodeList(nbest).Neigh(i)).g)
                    NodeList(NodeList(nbest).Neigh(i)).parent = nbest;
                    NodeList(NodeList(nbest).Neigh(i)).g = NodeList(nbest).g + NodeList(nbest).K(i);
                end
            end
        end
    end
    
    for i = 1:length(Open)-1
        flag = false;
        for k = 1:length(Open)-1    %Vérification des cas 
            if(NodeList(Open(k)).g + NodeList(Open(k)).h > NodeList(Open(k+1)).g + NodeList(Open(k+1)).h)  % f est supérieur
                [Open(k+1),Open(k)]=deal(Open(k),Open(k+1));  
                flag = true;
            elseif(NodeList(Open(k)).g + NodeList(Open(k)).h == NodeList(Open(k+1)).g + NodeList(Open(k+1)).h) %Si f égale vérificationde g
                if(NodeList(Open(k)).g < NodeList(Open(k+1)).g) % g décroissant
                    [Open(k+1),Open(k)] = deal(Open(k),Open(k+1));
                    flag = true;
                end
            end            
        end
        if(not(flag))
            break
        end
    end
end

chemin_temp = [TargetNode];
for i = length(chemin):-1:2
    if(NodeList(chemin(i)).parent == chemin(i-1))     %Fiding the parent
        chemin_temp = [chemin(i-1),chemin_temp];      
    else
        chemin(i-1) = chemin(i);
    end
end
chemin = chemin_temp;
NombreDeNoeud = length( chemin );
end