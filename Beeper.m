disp('Push the button.') 

while brick.TouchPressed(1) ~= 1    
    brick.playTone(100, 300, 500);    
    pause(0.75); 
end 
 
disp('Done!') 