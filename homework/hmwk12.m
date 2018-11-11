% Kevin Seveur
% CSc 4630 Homework #12
% Account: kseveur1 / 002206515
% Due date: November 13th

function hmwk12()

load('coins.mat', 'Coins');
coinscpy = Coins;
total = 0;

% Print functions left in intentionally to display values of the struct for
% the output file
fprintf('Quarters: %d\n',coinscpy.Quarter_value * coinscpy.Quarter_count);
fprintf('Dimes: %d\n', coinscpy.Dime_value * coinscpy.Dime_count);
fprintf('Nickels: %d\n', coinscpy.Nickel_value * coinscpy.Nickel_count);
fprintf('Pennys: %d\n', coinscpy.Penny_value * coinscpy.Penny_count);

total = total + coinscpy.Quarter_value * coinscpy.Quarter_count;
total = total + coinscpy.Dime_value * coinscpy.Dime_count;
total = total + coinscpy.Nickel_value * coinscpy.Nickel_count;
total = total + coinscpy.Penny_value * coinscpy.Penny_count;

% Semicolon left out intentionally in the below lione to display struct 
% values
coinscpy.total_value = total

save('hmwk12Soln.mat', 'coinscpy');
