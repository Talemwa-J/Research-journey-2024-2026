clc
clear

% Read Excel file as table
T = readtable('LUC and Emissios data in Tanzania.xlsx');
% First column = land use categories
categories = T{:,1};

% Remaining columns = emissions data
emissions = T{:,2:end};

% Convert to numeric if needed
emissions = double(emissions);
years = 1990:2021;
nCat = length(categories);
nYear = length(years);

Year = repmat(years,nCat,1);
Year = Year(:);

CO2 = emissions(:);

Category = repelem(categories,nYear);

data = table(Category,Year,CO2);
mdl = fitlm(data,'CO2 ~ Year');
fitted = mdl.Fitted;
residuals = mdl.Residuals.Raw;
figure
scatter(fitted,residuals,40,'filled')
hold on
yline(0,'r--','LineWidth',1.5)

xlabel('Fitted Values')
ylabel('Residuals')
title('Residual vs Fitted Plot')
grid on
figure
scatter(fitted,residuals,40,'filled')
hold on
yline(0,'r--','LineWidth',1.5)

xlabel('Fitted Values','FontSize',14)
ylabel('Residuals','FontSize',14)
title('Residual vs Fitted Plot','FontSize',16)
grid on

set(gcf,'Units','Inches','Position',[0 0 8 5])
exportgraphics(gcf,'residual_plot.pdf','ContentType','vector')

figure
qqplot(residuals)
title('Normal Q-Q Plot of Residuals')
grid on
figure
qqplot(residuals)

title('Normal Q-Q Plot of Residuals','FontSize',16)
grid on

set(gcf,'Units','Inches','Position',[0 0 8 5])
exportgraphics(gcf,'qq_plot.pdf','ContentType','vector')