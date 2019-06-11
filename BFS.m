function [ Chemin , NombreDeNoeud ]=RechercheEnLargeur(Nodes, NodeList , RootNode , TargetNode)
Chemin = [];
NombreDeNoeud = 0;
Open = [];                              % Open Nodes
Closed = [];                            % Closed Nodes         

Open = [Open RootNode];                 % enqueue(Start, Open);
Closed=[Closed RootNode];               % insert(Start, Closed)

    while length(Chemin)==0             
        
        if length(Open) == 0           %if Open is empty return fail
            error('The queue is empty , FAIL');
            break;
        end
        Node = NodeList( Open( 1 ) ).Neigh
        for i = 1 : length( Node )   % for each Child of Node do
                if Node(i) == TargetNode
                    Chemin = [Chemin Node(i)];          %if Node is  targetNode Stop;
                    break
                end
                if ismember( Node(i) ,Closed ) ~= true
                    Open = [Open   Node(i)];            % enqueue(Child, Open)
                    Closed(end +1 ) = Node(i) ;         % insert( Node , Closed)
                end
        end
        Open = Open( 2 :end );      
       
    end
    
    Chemin_temp=[];
    for i = length(Closed):-1:2
        if Nodes( Closed(i) , Closed(i-1) ) == 0      % Relation entre les noeuds ?
            Closed(i-1)=Closed(i);
            Closed=Closed(1:end);
        else
            Chemin_temp=[Chemin_temp Closed(i)]
        end
        
    end
    Closed = unique(Closed,'stable');
    Chemin=[Chemin fliplr(Closed)];
    
    disp(' Nombre de noeudds explores : ' )
    NombreDeNoeud = length(Chemin);
    end
