function [h] = usefir1(mode,n,fp,fs,window,sample,r)
% mode:ģʽ(1--��ͨ; 2--��ͨ; 3--��ͨ; 4--����)
% n:����, �Ӵ��ĵ���Ϊ������1
% fp:��ͨ�͵�ͨʱָʾ��ֹƵ��, ��ͨ�ʹ���ʱָʾ����Ƶ��
% fs:��ͨ�ʹ���ʱָʾ����Ƶ��
% window:�Ӵ�(1--���δ�; 2--���Ǵ�; 3--�������ش�; 4--������;
%5--������; 6--����������; 7--����; 8--����ѩ��)
% r�����chebyshev����rֵ�ͼ�kaiser��ʱ��betaֵ
% sample:������
% h:������ƺõ�FIR�˲���ϵ��
if window == 1
    w = boxcar(n+1);
end
if window == 2
    w = triang(n+1);
end
if window == 3
    w = bartlett(n+1);
end
if window == 4
    w = hamming(n+1);
end
if window == 5
    w = hanning(n+1);
end
if window == 6
    w = blackman(n+1);
end
if window == 7
    w = kaiser(n+1,r);
end
if window == 8
    w = chebwin(n+1,r);
end
wp = 2*fp/sample;
ws = 2*fs/sample;
if mode == 1
    h = fir1(n,wp,'high',w);
end
if mode == 2
    h = fir1(n,wp,'low',w);
end
if mode == 3
    h = fir1(n,[wp,ws],w);
end
if mode == 4
    h = fir1(n,[wp,ws],'stop',w);
end

%% plot

% m = 0:n;
% subplot(3,1,1);
% plot(m,h);grid on;
% title('�弤��Ӧ');
% axis([0 n 1.1*min(h) 1.1*max(h)]);
% ylabel('h(n)');xlabel('n');
% freq_response = freqz(h,1);
% magnitude = 20*log10(abs(freq_response));
% m = 0:511; f = m*sample/(2*511);
% subplot(3,1,2);
% plot(f,magnitude);grid on;
% title('��Ƶ����');
% axis([0 sample/2 1.1*min(magnitude) 1.1*max(magnitude)]);
% ylabel('f��ֵ');xlabel('Ƶ��');
% phase = angle(freq_response);
% subplot(3,1,3);plot(f,phase);grid on;
% title('��Ƶ����');
% axis([0 sample/2 1.1*min(phase) 1.1*max(phase)]);
% ylabel('��λ');xlabel('Ƶ��');
