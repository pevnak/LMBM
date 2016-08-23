# LMBM

This is an interface to the library implemeting Limited Memory Bundle Method taken from http://napsu.karmitsa.fi/lmbm/ allowing the library to be called from Julia. The original Fortran code is located in deps directory and I have just created a wrapper around it. Look in test directory to see, how to use it. Please, visit the original page for license or question for permissions. Note that the original fortran code is included in deps. Below is the coped text from Napsu Karmitsa's webpage.

LMBM is a limited memory bundle method for general, possible nonconvex, nonsmooth (nondifferentiable) large-scale minimization. Both the unconsrained version of the method and the version for bound constrained problems are available. You can also use the code LDGB as Fortran 95 version of LMBM (unconstrained case). Due to some implementational facts it might use less subgradient evaluations than the version here.

If you use the method in research work, you should mention one of the following papers
References

* N. Karmitsa, "LMBM — FORTRAN Subroutines for Large-Scale Nonsmooth Minimization: User's Manual", TUCS Technical Report, No. 856, Turku Centre for Computer Science, Turku, 2007.
* N. Haarala, K. Miettinen, M. M. Mäkelä, "Globally Convergent Limited Memory Bundle Method for Large-Scale Nonsmooth Optimization" (author version), Mathematical Programming, Vol. 109, No. 1, 2007, 181-205. The original publication is available online at www.springerlink.com.
* M. Haarala, K. Miettinen, M. M. Mäkelä, "New Limited Memory Bundle Method for Large-Scale Nonsmooth Optimization" (author version), Optimization Methods and Software, Vol. 19, No. 6, 2004, 673-692. The original publication is available online at http://journalsonline.tandf.co.uk.
* M. Haarala, "Large-Scale Nonsmooth Optimization: Variable Metric Bundle Method with Limited Memory", Doctoral Thesis, Department of Mathematical Information Technology, University of Jyväskylä, Jyväskylä, 2004.


The software is free for academic teaching and research purposes but I ask you to refer at least one of the references given below if you use it.
