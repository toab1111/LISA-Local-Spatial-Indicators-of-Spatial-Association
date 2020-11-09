%%Wongsaton Netpuggana 6030820921
clc
clear
format long g
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
%% ค่า rate
rate_c=[13.29,25.59,26.27,26.53,29.61,21.9,21.76,15.91];
%% Z-Scores 
Z0 = zscore(rate_c,1); % population formula
%% Anselin’s LISA (Local Moran’s I)
I=Z0'.*wij*Z0';


