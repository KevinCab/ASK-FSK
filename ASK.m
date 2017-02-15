function ASK(g,f) 
%Modulación ASK 
%Función: ASK([Tren de pulsos binarios],Frecuencia)

%Ejemplo: 
%ASK([1 0 1 1 0],2) 

%representa con una frecuencia diferente al '1'

%Solo dos argumentos
%nargin returns the number of input arguments passed 
if nargin > 2     
    error('Demasiados argumentos de entrada')
elseif nargin==1    
    f=1; end   
if f<1;     
    error('Frecuencia debe ser mayor que 1'); 
end


t=0:2*pi/99:2*pi; 
cp=[];
sp=[]; 
mod=[];
mod1=[];
bit=[];   


for n=1:length(g);
    if g(n)==0;   
        die=ones(1,100);  
        se=zeros(1,100); 
    elseif g(n)==1;
        die=2*ones(1,100);     
        se=ones(1,100);     
    end
    
    c=sin(f*t);    
    cp=[cp die];   
    mod=[mod c];   
    bit=[bit se]; 
end

ask=cp.*mod;
subplot(2,1,1);
plot(bit,'LineWidth',1.5);
grid on; title('Señal Binaria'); 
axis([0 100*length(g) -2.5 2.5]);
subplot(2,1,2);
plot(ask,'LineWidth',1.5);
grid on; title('Modulación ASK');
axis([0 100*length(g) -2.5 2.5]);

