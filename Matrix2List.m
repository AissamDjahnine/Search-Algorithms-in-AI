function S=Matrix2List(M)
% Converts an incident matrix to an incident list.

S=struct('Neigh',{},'K',{}); % creat empty list
for CurrentNode=1:length(M)  % for each node,
    children=find(M(CurrentNode,:)~=0); % find connected nodes
    pos=1; % set position of the connected node on the list
    for j=children
        S(CurrentNode).Neigh(pos)=j; %add connected node to list
        S(CurrentNode).K(pos)=M(CurrentNode,j); % add corresponding cost
        pos=pos+1; % increment position for next connecting node.
    end
end