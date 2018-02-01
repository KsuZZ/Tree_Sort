function [Tree, root]=Prisv3(Tree, key) %��������
Prisv1(Tree, key);           %������� ������
root=RootSearch(Tree)
root=getfield(root, 'key');
W=getfield(root, 'left_child');
E=getfield(root, 'right_child');

%������� �1____
%�������� �������� ��� ��������
p = Tree(root).parent;
if root == E
    E=Tree(root).right_child;
else root == W
    W=Tree(root).left_child;
end
Tree = Tree([1:root-1, root+1])
end

%������� �2____
%������� ������������ ������ ��� ���������� ��������
A=[Tree([1:root-1, root+1:end]).key];
A=sort(A);
Tree = Prisv0(A)

%������� �3____
%�������� �� ��������� ������ �������
if ~isempty(left_child)
    if Tree(W).left_child < root
        Tree(root+1).left_child = W;
    elseif Tree(E).left_child > root
        Tree(root+1).right_child = E;
    end
    
    if key ~= root
        next_right=Tree(E+1).right_child;
        next_parent=Tree(E+1).parent;
        next_right_n=H(Tree, next_right);
        Tree(next_right_n).parent=next_parent;
    end
    Tree(E).parent = t_key(Tree, key);
    
    if root ~= 0
        if t_key(Tree, key) < root
            Tree(root).left_child=t_key(Tree, key);
            
        elseif t_key(Tree, key) > root
            Tree(root).right_child=t_key(Tree, key);
        end
    end
end

%������� �4____
%�������� �� ��������� ������� �������
if ~ isempty(right_child)
    if Tree(W).left_child < root
        Tree(root+1).left_child = W;
    elseif Tree(E).left_child > root
        Tree(root+1).right_child = E;
    end
    
    if key ~= root
        next_left=Tree(W+1).left_child;
        next_parent=Tree(W+1).parent;
        next_left_n=H(Tree, next_left);
        Tree(next_left_n).parent=next_parent;
    end
    Tree(W).parent = t_key(Tree, key);
    
    if root ~= 0
        if t_key(Tree, key) < root
            Tree(root).left_child=t_key(Tree, key);
        elseif t_key(Tree, key) > root
            Tree(root).right_child=t_key(Tree, key);
        end
    end
end

%������� �5____
%�������� �����
if isempty(left_child) && isempty(right_child)
    Tree = Tree([1:root-1])
end

%������� �6____
%���� �������� �� ����������
K = [Tree.key];
if isempty(find(K ~= key)) %����� ������� ��������� ���������
    disp('������ ����� ���')
end
end