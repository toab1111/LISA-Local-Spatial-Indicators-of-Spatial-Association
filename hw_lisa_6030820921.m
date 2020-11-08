%%Wongsaton Netpuggana 6030820921
clc
clear
format long g
%% import shape file
s = shaperead('elderly_bkk.shp');
%% Contiguity Matrix
%%��觾���,�������,���ྪú���,����¡��ҹҤ,�ǹ�Ե�Ŵ�,�����������,����,����ʹ�
w=[0 1 1 1 1 1 1 0  %%��觾���
    1 0 1 0 0 0 1 1  %%�������
    1 1 0 1 1 0 0 0  %%���ྪú���
    1 0 1 0 1 0 0 0  %%����¡��ҹҤ
    1 0 1 1 0 1 1 0  %%�ǹ�Ե�Ŵ�
    1 0 0 0 1 0 1 0   %%�����������
    1 1 0 0 1 1 0 1  %%����
    0 1 0 0 0 0 1 0]; %%����ʹ�
%% Sum row Contiguity Matrix
w_sum=sum(w,2);
%% Row Standardized Spatial Weights Matrix
wij=w./w_sum;
%% ���Ǣ����ŷ���ͧ���
a=[s.rate];
c=[s.OBJECTID];
%% object id 
object = [70 71 69 114 115 23 53 174];
%% �� index �ͧ object id 
index=[];
for i=1:length(object)
    index=[index,find(c==object(i))];
end
%% �� rate �ҡ index
rate_c=[];
for i=1:length(object)
    rate_c=[rate_c,a(index(i))];
end
%% Z-Scores 
Z0 = zscore(rate_c,0); % sample formula
%% Anselin�s LISA (Local Moran�s I)
I=Z0'.*wij*Z0';


