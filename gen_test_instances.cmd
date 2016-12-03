@echo off
set nl=20
set nb=20
set mval=0.5
set weight=100
set cost=250
set kval=1.0
set dval=0

cd ./knapgen

rem maximum cost generator
for /L %%c in (50 50 500) do @(kgen.exe -n %nl% -N %nb% -m %mval% -W %weight% -C %%c -k %kval% -d %dval% > knap_%nl%_%mval%_%weight%_%%c_%kval%_%dval%.inst.dat) && @(timeout /t 1)

rem maximum weight generator
for /L %%w in (60 40 420) do @(kgen.exe -n %nl% -N %nb% -m %mval% -W %%w -C %cost% -k %kval% -d %dval% > knap_%nl%_%mval%_%%w_%cost%_%kval%_%dval%.inst.dat) && @(timeout /t 1)

rem generator of knapsack weight to total weight ratio
for %%m in (0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9) do @(kgen.exe -n %nl% -N %nb% -m %%m -W %weight% -C %cost% -k %kval% -d %dval% > knap_%nl%_%%m_%weight%_%cost%_%kval%_%dval%.inst.dat) && @(timeout /t 1)

rem granularity exponent generator
for %%k in (0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0) do @(kgen.exe -n %nl% -N %nb% -m %mval% -W %weight% -C %cost% -k %%k -d %dval% > knap_%nl%_%mval%_%weight%_%cost%_%%k_%dval%.inst.dat) && @(timeout /t 1)

rem granularity generator
rem for %%d in (-1 0 1) do @(kgen.exe -n %nl% -N %nb% -m %mval% -W %weight% -C %cost% -k %kval% -d %%d > knap_%nl%_%mval%_%weight%_%cost%_%kval%_%%d.inst.dat) && @(timeout /t 1)

cd ..