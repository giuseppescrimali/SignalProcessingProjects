% Complex Exponential method
% The impulse response is loaded and then
% the number of modes of interest is selected 


clear all

% measure
[File, Path]=uigetfile('*.dat','Data file');

if File~=0

  %loading
  nome=[Path File];
  load(nome);

  % extension
  nome=abs(File);
  ln=length(nome);
  for i=1:ln
    if nome(i)==46
      np=i-1;
    end
  end
  nome=setstr(nome(1:np));
  y=eval(nome);

  s=size(y);
  if s(2)>s(1)
    y=y';
  end
  l=length(y);

  % Sampling period
  deltat=input(' Sampling period [s]: ');
  fc=1/deltat;      % Sampling frequency[Hz]

  % time
  t=[0:deltat:deltat*(l-1)];

  % Impulse response
  plot(t,y,'r')
  grid on

  % Continua=1   => change the number of modes
  % Continua=0   => stop
  continua=1;

  while continua==1

    % number of modes
    str4=[' number of modes [<=' int2str(l/4) ']: '];
    n=input(str4);

    % dimension of HH
    m=2*n;

    % Matrix containing the response
    H=zeros(2*m,2*n+1);
    for i=1:2*m
      H(i,:)=y(i:2*n+i)';
    end

    % Solution of the system(Ewins: 4.46a)
    HH=H(:,(1:2*n));
    Beta=-pinv(HH)*H(:,2*n+1);
    Beta(2*n+1)=1;

    % Inversion of the order (this is needed by ROOTS)
    Beta1=flipud(Beta);

    % Compute the roots of the polynomial, whose coefficients are Beta1
    % (Ewins: 4.40)
    UR=roots(Beta1)';

    % Roots (Ewins: 4.35)
    SR=log(UR);
    omega=abs(SR)/deltat;
    zeta=-real(SR)./abs(SR);

    % Modal amplitudes (Ewins: 4.47)
    U=zeros(length(UR),length(UR));
    for j=1:length(UR)
      U(j,:)=UR.^(j-1);
    end
    AA=inv(U)*y(1:length(UR));

    i=1;
    k=1;
    while k<=length(omega)
      if imag(SR(k))<0 & zeta(k)>=0
        caratt(i,1)=100*zeta(k);
        caratt(i,2)=omega(k)/(2*pi);
        caratt(i,3)=1*abs(AA(k));
        caratt(i,4)=180/pi*angle(AA(k));
        i=i+1;
      end
      k=k+1;
    end

    disp('damping.[%] - freq.[Hz] - modal constant - phase[°]')
    disp(caratt)
    if exist('freqtot')
       freqtot=[freqtot caratt(:,2)'];
    else 
       freqtot=caratt(:,2)';
    end
    % Continue?
    continua=menu('Continue?','Yes','NO');

end

else
  disp(' ')
  disp(' where is the file?')
  disp(' ')
end