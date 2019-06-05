%% MATLAB Fundamentals
%  Review Problem 2: The Price is Right!

clear % clear workspace variables
clc % clear command window

%% Randomly generate price

price = randi(100);

%% Instantiate user guess variable 

guess = 0;

%% Create while loop 

while guess ~= price % while loop will run until guess equals price
    
    % assigns user input to variable guess
    guess = input('what do you guess?: ');
    
    
    % decision tree for which hint to display
    if guess < price
        disp('Too low!')
        
    elseif guess > price
        disp('Too high!')
    
    else
        disp('You win!')
    end
    
    
end % end the while loop