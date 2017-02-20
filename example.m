num=[1.2 0.3];
den=[1 1.2 0.7 0.2];
t= 0:1/1000:2;
Ts=0.001;
G=tf(num,den,Ts);

  %              1.2 z + 0.3
  % G(Z)= ---------------------------
  %        z^3 + 1.2 z^2 + 0.7 z + 0.2

x = chirp(t,0,1,250);  
[y,t]=lsim(G,x,t);
nn=6;
true_order=order_estimation( y , nn )
