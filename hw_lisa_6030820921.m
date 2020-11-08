%%Wongsaton Netpuggana 6030820921
clc
clear
format long g
%% import shape file
s = shaperead('elderly_bkk.shp');
%% Contiguity Matrix
%%ทุ่งพญาไท,ถนนพญาไท,ถนนเพชรบุรี,สี่แยกมหานาค,สวนจิตรลดา,ถนนนครไชยศรี,พญาไท,สามเสนใน
w=[0 1 1 1 1 1 1 0  %%ทุ่งพญาไท
    1 0 1 0 0 0 1 1  %%ถนนพญาไท
    1 1 0 1 1 0 0 0  %%ถนนเพชรบุรี
    1 0 1 0 1 0 0 0  %%สี่แยกมหานาค
    1 0 1 1 0 1 1 0  %%สวนจิตรลดา
    1 0 0 0 1 0 1 0   %%ถนนนครไชยศรี
    1 1 0 0 1 1 0 1  %%พญาไท
    0 1 0 0 0 0 1 0]; %%สามเสนใน
%% Sum row Contiguity Matrix
w_sum=sum(w,2);
%% Row Standardized Spatial Weights Matrix
wij=w./w_sum;
%% เก็บแถวข้อมูลที่ต้องการ
a=[s.rate];
c=[s.OBJECTID];
%% object id 
object = [70 71 69 114 115 23 53 174];
%% หา index ของ object id 
index=[];
for i=1:length(object)
    index=[index,find(c==object(i))];
end
%% หา rate จาก index
rate_c=[];
for i=1:length(object)
    rate_c=[rate_c,a(index(i))];
end
%% Z-Scores 
Z0 = zscore(rate_c,0); % sample formula
%% Anselin’s LISA (Local Moran’s I)
I=Z0'.*wij*Z0';


