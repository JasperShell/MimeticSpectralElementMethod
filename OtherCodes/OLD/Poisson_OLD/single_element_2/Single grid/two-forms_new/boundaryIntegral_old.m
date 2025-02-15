function BC = boundaryIntegral(e,IN)

global N w

if size(IN)~=2
    warning('Wrong number of input arguments')
end

in1 = IN(1);
in2 = IN(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if in1 == 0 && in2 == 1

    BC = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elseif in1 == 1 && in2 == 2

    Db = zeros(4*N,2*N*(N+1));
    for i=1:N
        Db(2*i-1,1+(i-1)*(N+1)) = -1;
        Db(2*i,i*(N+1)) = +1;
        Db(2*i-1+2*N,1+(i-1)*(N+1)+N*(N+1)) = -1;
        Db(2*i+2*N,i*(N+1)+N*(N+1)) = 1;
    end
    Db = sparse(Db);

    ebc =  [ e(:,1) e(:,N+1) ];

    Ibq1 = kron(e,speye(2));
    Ibq  = kron(speye(2),Ibq1);

    W1 = kron(spdiags(w',0,N+1,N+1),speye(2));
    W  = kron(speye(2),W1);

    Ibu1 = kron(e',ebc');
    Ibu  = sparse([ Ibu1 ; Ibu1 ]);

    BC = Db'*Ibq*W*Ibu;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end