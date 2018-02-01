function Tree=Prisv2(Tree, key) %вставка дерево
root=RootSearch(Tree);
Q=getfield(root, 'key')
W=getfield(root, 'left_child');
E=getfield(root, 'right_child');
if key<Q
    if ~isempty(W)
        Tree(W).type='rooteee';
        Tree(Q).type='notoooo';
        root;
    else
        Tree=Prisv2(Tree, key)
        Tree(Q+1).type='leaveee';
        Tree(Q+1).left_child=[];
        Tree(Q+1).right_child=[];
        Tree(Q+1).parent=Q;
        Tree(Q+1).key=key;
        Tree(Q).left_child=Tree(Q+1).key;
    end
elseif key>Q
    if ~isempty(E)
        Tree(E).type='rooteee';
        Tree(Q).type='notoooo';
        root;
        Tree=Prisv2(Tree, key)
    else
        Tree(Q+1).type='leaveee';
        Tree(Q+1).left_child=[];
        Tree(Q+1).right_child=[];
        Tree(Q+1).parent=Q;
        Tree(Q+1).key=key;
        Tree(Q).right_child=Tree(Q+1).key;
    end
else
    Tree(Q).type='rooteee';
    root
end
end