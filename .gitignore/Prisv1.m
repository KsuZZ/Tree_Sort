function Prisv1(Tree, key) %поиск дерево
root=RootSearch(Tree);
Q=getfield(root, 'key')
W=getfield(root, 'left_child')
E=getfield(root, 'right_child')
if key<Q
    Tree(Tree(W)).type='rooteee';
    Tree(Q).type='notoooo';
    root;
    Prisv1(Tree, key)
    
elseif key>Q
    Tree(Tree(E)).type='rooteee';
    Tree(Q).type='notoooo';
    root;
    Prisv1(Tree, key)
    
else
    Tree(Q).type='rooteee';
    root
end
end