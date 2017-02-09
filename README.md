use state sub-space way to estimation the order of Discrete-time transfer function.

you should better make the predict order not too big, if it is far from the true oder may lead a wrong oder.

The model is given by           A(z) y(t) = B(z)u(t)

also can be written as          y(t)/u(t) = B(z)/A(z)

where:
  y : output of the system.
  
  u : control action (input to the system).
  
  A(z) = 1 + a_1 z^-1 + a_2 z^-2 + ... + a_na z^(-na). 
   --[denominator polynomail]
  
  B(z) = b_0 + b_1 z^-1 + b_2 z^-2 + ... + b_nb z^(-nb). 
   --[numerator polynomail]

Function inputs

y : onput of the system 

nn : suppose order of the denominator polynomail [A(z)]
     
     nn should bigger than the true order

Function Output

true_order : final estimated order.

An example is added to illustrate how to use the funcrtion.

# bjlxwjs
