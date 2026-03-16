figure

% Define bar heights (counts)
counts = [30 70 70 30 30 30 30 30 30 0 125 30 0 30 30 0 30 30 30 0 30 0 30 0 30 0 30 0 30];

% Define x positions
x = 1:length(counts);

% Plot bars
bar(x,counts,'FaceColor',[0.2 0.4 0.6],'EdgeColor','black','BarWidth', 1)

title('Distribution of GDP')
xlabel('GDP')
ylabel('count')

% Set vertical scale
ylim([0 160])
yticks([0 50 100 150])

% Set horizontal tick positions
xticks([3 12 19 28])

% Force labels to match your scale
xticklabels({'4.0e+10','8.0e+10','1.2e+11','1.6e+11'})

grid on