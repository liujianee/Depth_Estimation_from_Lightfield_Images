function Sout = Oracle_Random_Sampling( x0, sp)
    
     [rows cols]         = size(x0);
              n          = rows*cols;
   
     [gradx grady]       = gradient(x0);
      grad               = sqrt(gradx.^2+grady.^2);
     
      myfun              = @(v)objfun(v,grad(:),round(n*sp));
      tau                = fzero(myfun,[0,1e16]);
        p                = max(1e-16, min(1,grad*tau));
     
      Sout        = (rand(rows,cols)<=p);

end

