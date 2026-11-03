# AlGaN/GaN HEMT Native Initialization
IMPORT TIFFile="/home/shyamsri/HEMT_Final/AlGaN_GaN_HEMT.tif"

PROFILE Type=Uniform Ion=Donor N.Peak=1.0e15 X.min=0.0 X.max=2.0 Y.min=-1.0 Y.max=-0.005
PROFILE Type=Uniform Ion=Donor N.Peak=1.0e19 X.min=0.0 X.max=0.3 Y.min=-0.1 Y.max=0.1
PROFILE Type=Uniform Ion=Donor N.Peak=1.0e19 X.min=1.7 X.max=2.0 Y.min=-0.1 Y.max=0.1
PROFILE Type=Uniform Ion=Donor N.Peak=5.0e18 X.min=0.0 X.max=2.0 Y.min=-0.002 Y.max=0.0

# Define the electrical boundaries (contacts)
BOUNDARY Type=Ohmic ID=Source V=0.0
BOUNDARY Type=Ohmic ID=Drain V=5.0
BOUNDARY Type=Schottky ID=Gate Workfunc=4.5 V=0.0

BOUNDARY ID=Interface_2DEG Qf=1.0e12

METHOD Type=Poisson NS=LineSearch LS=MUMPS Damping=Potential MaxIteration=200
SOLVE Type=EQUILIBRIUM
EXPORT TIF=equilibirum_poisson.tif

METHOD Type=DDML1 NS=Basic LS=MUMPS Damping=BankRose MaxIteration=150
SOLVE Type=EQUILIBRIUM
EXPORT TIF=equilibrium.tif

METHOD Type=DDML1 NS=Basic LS=MUMPS Damping=No MaxIteration=100
SOLVE Type=DCSWEEP Vscan=Drain Vstart=0.0 Vstep=0.25 Vstop=5.0 OUT.Prefix=result

END
