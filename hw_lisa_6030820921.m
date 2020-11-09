%%Wongsaton Netpuggana 6030820921
clc
clear
format long g
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
%% ��� rate
rate_c=[13.29,25.59,26.27,26.53,29.61,21.9,21.76,15.91];
%% Z-Scores 
Z0 = zscore(rate_c,1); % population formula
%% Anselin�s LISA (Local Moran�s I)
I=Z0'.*wij*Z0';


