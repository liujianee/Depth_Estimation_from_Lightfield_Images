function Sout = Oracle_Random_Sampling_with_PCA( x0, sp, S_pilot )
   [rows cols]  = size(x0);
   n            = rows*cols;
  win           = 3;
 [grad unused]  = gradient_pca(x0, win);

   idx          = (S_pilot==0);
  grad          = grad.*idx;
  
  myfun         = @(v)objfun(v,grad(:),round(n*sp));
  tau           = fzero(myfun,[0,1e16]);
   p            = max(1e-16, min(1,grad*tau));
   Stmp         = (rand(rows,cols)<=p);
   Sout         = (S_pilot|Stmp);
   
end

