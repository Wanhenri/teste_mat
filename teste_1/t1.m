ncid = netcdf.open('/stornext/online8/mcga/w.santos/TQ0299L064/MAY2015_24Z_12Z_NCEP.nc','NOWRITE');
varname = netcdf.inqVar(ncid,10); %numero 10 relacionado a variavel prec
whos data %verifica a grade e tempo
[dimname,dimlength]=netcdf.inqDim(ncid,0);
[dimname,dimlength]=netcdf.inqDim(ncid,1);
[dimname,dimlength]=netcdf.inqDim(ncid,3);
precMay = netcdf.getVar(ncid,10,[0 0 0],[900 450 1],'double');
lon1 = netcdf.getVar(ncid,0,0,900);
lat1 = netcdf.getVar(ncid,1,0,450);
for p = 1:900
for q = 1:450
	if abs(precMay(p,q)) > 99
		precMay(p,q) = 0;
	end
	map1(q,p) = precMay(p,q);
end
end
pcolor(lon1,lat1,map1)
shading interp
colorbar
hold on
contour(lon1,lat1,map1,'k-')
