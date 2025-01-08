close all;

d=8;
endt=length(out.tout);
skp=1000;
size1=20;
figure(1);
for i=1:d
    subplot(4,2,i);
    hold on;box on;
    for j=1:n
        plot(out.tout(1:skp:endt),out.x(1:skp:endt,d*(j-1)+i),'LineWidth',2);
        if(j==n)
            plot(out.tout(1:skp:endt),out.x_r(1:skp:endt,i),'r','LineWidth',2);
        end
    end
    
    xlabel('${t}(s)$','fontsize',size1,'interpreter','latex');
    if(i==1)
        ylabel('$x_{i1}$','fontsize',size1,'interpreter','latex');
        h=legend('$\textbf{\emph{x}}_1$','$\textbf{\emph{x}}_2$','$\textbf{\emph{x}}_3$','$\textbf{\emph{x}}_4$',...
        '$\textbf{\emph{x}}_5$','$\textbf{\emph{x}}_6$','$\textbf{\emph{x}}^*$','location','southeast','NumColumns',7);
        set(h,'FontSize',size1,'interpreter','latex');
    end
    if(i==2)
        ylabel('$x_{i2}$','fontsize',size1,'interpreter','latex');
    end
    if(i==3)
        axis([ 0 out.tout(endt) 0 1.8]);
        ylabel('$x_{i3}$','fontsize',size1,'interpreter','latex');
    end
    if(i==4)
        ylabel('$x_{i4}$','fontsize',size1,'interpreter','latex');
    end
    if(i==5)
        ylabel('$x_{i5}$','fontsize',size1,'interpreter','latex');
    end
    if(i==6)
        ylabel('$x_{i6}$','fontsize',size1,'interpreter','latex');
    end
    if(i==7)
        ylabel('$x_{i7}$','fontsize',size1,'interpreter','latex');
    end
    if(i==8)
        ylabel('$x_{i8}$','fontsize',size1,'interpreter','latex');
    end
    set(gca,'FontSize',size1);
end


figure(2);
size2=34;
for i=1:n
    for k=1:skp:length(out.tout)
        k/length(out.tout)*100
        enorm(i,k)=norm(out.x_r(k,:)-out.x(k,d*(i-1)+1:d*(i-1)+d));
    end
    hold on;box on;
    plot(out.tout(1:skp:endt),enorm(i,1:skp:endt),'LineWidth',2);

end
axis([ 0 out.tout(endt) 0 2.5]);
xlabel('${t}(s)$','fontsize',size2,'interpreter','latex');
ylabel('$||\textbf{\emph{e}}_{i}||_2$','fontsize',size2,'interpreter','latex');
h=legend('$||\textbf{\emph{e}}_1||_2$','$||\textbf{\emph{e}}_2||_2$','$||\textbf{\emph{e}}_3||_2$','$||\textbf{\emph{e}}_4||_2$',...
    '$||\textbf{\emph{e}}_5||_2$','$||\textbf{\emph{e}}_6||_2$','location','northeast','NumColumns',6);
set(h,'FontSize',size2,'interpreter','latex');
set(gca,'FontSize',size2);


figure(3);
size2=34;
for i=1:n
    hold on;box on;
    out.em(1,i)=out.em(100,i);
    plot(out.tout(1:skp:endt),out.em(1:skp:endt,i),'LineWidth',2);
end
% axis([ 0 out.tout(endt) 0 1.7]);
xlabel('${t}(s)$','fontsize',size2,'interpreter','latex');
ylabel('$||\varepsilon_i||_2$','fontsize',size2,'interpreter','latex');
h=legend('$||\varepsilon_1||_2$','$||\varepsilon_2||_2$','$||\varepsilon_3||_2$','$||\varepsilon_4||_2$',...
    '$||\varepsilon_5||_2$','$||\varepsilon_6||_2$','location','northeast','NumColumns',6);
set(h,'FontSize',size2,'interpreter','latex');
set(gca,'FontSize',size2);

