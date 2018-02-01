function Tree = Prisv0(A)
if length(A) > 1
    L = sort(A);
elseif length(A) == 1
    L = 1 : A;
end
m=0;

TreeL = Pri(L, m);

for i = 1 : length(L)
    Tree(i).key = L(i);
    Tree(i).parent = TreeL(i);
    Tree(i).left_child = [];
    Tree(i).right_child = [];
    Tree(i).type='leaveee';
    for j = 1 : length(L)
        if L(i) == TreeL(j)
            if L(i) > L(j)
                Tree(i).left_child = L(j);
            elseif L(i) < L(j)
                Tree(i).right_child = L(j);
            end
        end
    end
end
for i=1:length(Tree)
    if ~isempty(Tree(i).left_child) || ~isempty(Tree(i).right_child)
        Tree(i).type='general';
    end
end
n=ceil(length(Tree)/2);
Tree(n).type='rooteee';
end

function Tree = Pri(Tree, m)
if length(unique(Tree)) ~= length(Tree)
    error 'В дереве поиска не должно быть повторяющихся элементов!'
end
if isempty(Tree)
    return
elseif length(Tree) == 1
    Tree = m;
    return
else
    index = ceil(length(Tree) / 2);
    elem = Tree(index);
    left_child = Pri(Tree(1 : index-1), elem);
    right_child = Pri(Tree(index+1 : end), elem);
    if nargin == 1 %проверка
        m = 0;     %Number of function input arguments
    end
    Tree = [left_child m right_child];
end
end
