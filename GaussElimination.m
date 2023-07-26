function [Out, X] = GaussElimination(A)


if size(A,1) ~= (size(A,2) - 1)
    error('given matrix dimensions is not n.(n+1), the last column should contain "b"' )
end
if det(A(:,1:end-1)) == 0
    error('given matrix is unsolvable because determinant is equal to zero')
end

for j = 1:size(A,2)
    for i = 1:size(A,1)
        if i>j && A(i,j)~=0
            k=i-j;
            mult  = A(i-k,j)/A(i,j);
            A(i,:)= mult*A(i,:);
            A(i,:)= A(i,:) - A(i-k,:);
        end
    end
end

 
 
for i = size(A,1):-1:1
    b(i)=A(i,end);
    sum = 0;
    for j = size(A,2)-1:-1:1
        if i==j
            x(j)= (b(i)- sum)/A(i,j);
        end
        if j>i
            sum = A(i,j)*x(j) + sum;
        end
    end
end
    
X=[x];

Out = A;


end