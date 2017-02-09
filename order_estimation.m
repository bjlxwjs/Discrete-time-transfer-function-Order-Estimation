function [ true_order ] = order_estimation( y , nn )
%% true_order:the outout
%% y:time domin
%% nn:suppose order

%suppose order d , d should bigger than the true order 
d=nn;
[ndat,ny]=size(y);

% block Toeplitz and block Hankel
N=ndat-2*d+1;
Yp = zeros(ny*d,N);
Yf = Yp;
sy=y'/sqrt(N);
for k=1:d
    Yp((d-k)*ny+1:(d-k+1)*ny,:)=sy(:,k:k+N-1);
    Yf((k-1)*ny+1:k*ny,:)=sy(:,d+k:d+k+N-1);
end

%LQ decomposition   
L0=triu(qr([Yp;Yf]'))';
L0=L0(1:2*d*ny,:);

%Square roots  
M = L0(1:d*ny,1:d*ny);
L2 = L0(d*ny+1:end,:);
Sff = L2*L2';
L = chol(Sff)';

%SVD
[U1,S1,V1] = svd(L\L2(:,1:d*ny));
ss=diag(S1);

%Bar graph of singular values,check the true order
bar(ss);
 
slope=[];
for k=1:(length(ss)-1)
     slope(k)=(ss(k)-ss(k+1))/ss(k);
end

%the first way to get the order
%nk=find(xielv==max(xielv));

%nk is is the true order
nk=[];
for k=1:(length(slope)-1)
     if slope(k)<slope(k+1)
	    nk=k+1;
		break
	 end
end	

true_order=nk;

end

