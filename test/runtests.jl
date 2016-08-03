# write your own tests here
using LMBM

function testFun2(n::Cint,xp::Ptr{Cdouble},gp::Ptr{Cdouble})
  x=pointer_to_array(xp,n,false);
  g=pointer_to_array(gp,n,false);

  f = 0.0;
  g[1] = 0.0;

  for i=1:n-1
    g[i+1] = 0.0;
    a = -x[i]-x[i+1];
    b = -x[i]-x[i+1]+(x[i]*x[i]+x[i+1]*x[i+1]-1.0);

    if (a >= b)
      f = f+a;
      g[i] = g[i]-1.0;
      g[i+1] = -1.0;
    else
      f = f+b;  
      g[i] = g[i]-1.0+2.0*x[i];
      g[i+1] = -1.0+2*x[i+1];
    end
  end
  return(convert(Cdouble,f))
end

function testFun1(n::Cint,xp::Ptr{Cdouble},gp::Ptr{Cdouble})
  x=pointer_to_array(xp,n,false);
  g=pointer_to_array(gp,n,false);

  f = 0;
  for j = 1:length(n)
    f = f + x[j]*x[j];
    g[j] = 2*x[j];
  end
  return(convert(Cdouble,f))
end

x=randn(100);
LMBM.lmbm(testFun1,x;printinfo=true)
println()
println()
x=randn(100);
LMBM.lmbm(testFun2,x;printinfo=true)
