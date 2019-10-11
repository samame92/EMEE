% Call: emee(A,M,L,alpha)
% The 1st measure, EMEE, measure of enhancement by entropy calculation
% of the image X of size MxM by using blocks of size LxL
%
function E=emee(X,L,alpha)
    [M,~]=size(X);

	how_many=floor(M/L);
	
	E=0.; 
	B1=zeros(L);
	m1=1;
	for m=1:how_many
	    n1=1;
	    for n=1:how_many
	    	B1=X(m1:m1+L-1,n1:n1+L-1);
            b_min=min(min(B1));
            b_max=max(max(B1));

            if b_min>0 
                b_ratio=b_max/b_min;
                E=E+alpha*(b_ratio^alpha)+log(b_ratio);	  
            end

            n1=n1+L;	              
        end
	    m1=m1+L;
    end
	E=(E/how_many)/how_many;
