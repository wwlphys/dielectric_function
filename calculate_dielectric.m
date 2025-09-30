clear
%path(path,'/public/home/wangwl/polariton');
dm_preprocess;
read_dm;
phonopy_yaml_preprocess;
read_VnM;
OUTCAR_preprocess;
read_Z;
band_yaml_preprocess;
read_displace
output_dielectric;
disp('Please cite: Yue Fang, Huanjun Chen, Zhibing Li and Weiliang Wang, Hyperbolic phonon polaritons and wave vector direction dependent dielectric tensors in anisotropic crystals, Journal of Physical Chemistry C, 128 (2024) 7359.');
disp('https://doi.org/10.1021/acs.jpcc.4c01183');