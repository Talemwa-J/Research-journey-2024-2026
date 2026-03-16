%% Policy Scenarios CO₂ Emissions Visualization
clear; clc; close all;

% Data from table
scenario_names = {
    'Base Scenario';
    'Scenario 1: +10% Urban, +5% GDP';
    'Scenario 2: Cropland-forest+20%';
    'Scenario 3: Tanzania Forestry Strategy';
    'Scenario 4: REDD+ Implementation';
    'Scenario 5: SDG-Aligned Urban Growth'
};

emissions = [24339; 25772; 18041; 19500; 17200; 23100];

% Sort data for better visualization (optional)
% [emissions_sorted, sort_idx] = sort(emissions, 'descend');
% scenario_names_sorted = scenario_names(sort_idx);
% We'll keep original order for comparison to baseline

%% Create bar chart
figure('Position', [100, 100, 900, 600]);
h = bar(emissions, 'FaceColor', [0.2, 0.4, 0.6]);

% Customize bars
h.BarWidth = 0.7;
h.FaceColor = 'flat';
colors = [0.4 0.4 0.4;          % Base scenario - gray
          0.8 0.2 0.2;          % Scenario 1 - red
          0.2 0.6 0.2;          % Scenario 2 - green
          0.2 0.6 0.2;          % Scenario 3 - green
          0.2 0.6 0.2;          % Scenario 4 - green  
          0.2 0.5 0.8];         % Scenario 5 - blue
h.CData = colors;

% Add value labels on top of bars
for i = 1:length(emissions)
    text(i, emissions(i) + max(emissions)*0.01, ...
        num2str(emissions(i)), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom', ...
        'FontWeight', 'bold', ...
        'FontSize', 10);
end

%% Formatting
% X-axis
set(gca, 'XTick', 1:length(scenario_names));
set(gca, 'XTickLabel', scenario_names);
xtickangle(30); % Rotate labels for better readability

% Labels and title
ylabel('Predicted CO₂ Emissions (Metric Tons)', 'FontSize', 12, 'FontWeight', 'bold');
title('Policy Scenarios: Predicted CO₂ Emissions', 'FontSize', 14, 'FontWeight', 'bold');

% Grid
grid on;
grid minor;

% Add baseline reference line
hold on;
yline(emissions(1), '--r', 'Base Scenario', ...
      'LineWidth', 1.5, ...
      'LabelHorizontalAlignment', 'left', ...
      'FontWeight', 'bold');

% Set y-axis to start from 0
ylim([0, max(emissions) * 1.15]);

% Adjust figure aesthetics
set(gca, 'FontSize', 11);
set(gca, 'YGrid', 'on');
set(gca, 'XGrid', 'off');

% Add legend
legend_colors = [0.4 0.4 0.4; 0.8 0.2 0.2; 0.2 0.6 0.2; 0.2 0.5 0.8];
legend_labels = {'Base/Reference', 'Economic Growth', 'Forestry Strategies', 'Sustainable Urban'};
hold on;
for i = 1:4
    plot([NaN NaN], [NaN NaN], 's', 'MarkerSize', 10, ...
        'MarkerFaceColor', legend_colors(i,:), ...
        'MarkerEdgeColor', 'k');
end
legend(legend_labels, 'Location', 'northeast');

% Adjust layout
set(gcf, 'Color', 'w');
tightfig;

%% Optional: Save figure
% saveas(gcf, 'policy_scenarios_co2_emissions.png');