
%brick = ConnectBrick('EB3')
brick.playTone(100, 200, 300)
global key
InitKeyboard()
while 1  
    
     if (brick.TouchPressed(3)==1) %turns left 90 if touched 
         brick.StopMotor('A')
         brick.StopMotor('D')
         brick.MoveMotorAngleRel('D', -100, 200)
         brick.MoveMotorAngleRel('A', -100, 200)
         brick.MoveMotorAngleRel('D', 100, 690, 'Brake')
         brick.MoveMotorAngleRel('A', -100, 690, 'Brake')
     elseif (brick.UltrasonicDist(4) > 25) %turns right 90 if 
         brick.StopMotor('A')
         brick.StopMotor('D')
         brick.MoveMotorAngleRel('D', -100, 200)
         brick.MoveMotorAngleRel('A', -100, 200)
         brick.MoveMotorAngleRel('D', -100, 690, 'Brake')
         brick.MoveMotorAngleRel('A', 100, 690, 'Brake')
     elseif (brick.ColorCode(1)==5) %red
         pause(4)
     elseif (brick.ColorCode(1)==3) %green
         brick.StopMotor('A')
         brick.StopMotor('D')
         brick.StopMotor('B')
         switch key
           case 'uparrow'
               disp('Up arrow pressed')
               brick.MoveMotor('D', -100)
               brick.MoveMotor('A', -100)
           case 'downarrow'
               disp('Down arrow pressed')
               brick.MoveMotor('D', 100)
               brick.MoveMotor('A', 100)
           case 'leftarrow'
               disp('Left arrow pressed')
               brick.MoveMotor('D', 100)
               brick.MoveMotor('A', -100)
           case 'rightarrow'
               disp('Right arrow pressed')
               brick.MoveMotor('D', -100)
               brick.MoveMotor('A', 100)
           case 'w'
               brick.MoveMotor('B', -25)
           case 's'
               brick.MoveMotor('B', 25)
           case 0
               disp('No Key pressed')
               brick.StopMotor('A')
               brick.StopMotor('D')
               brick.StopMotor('B')
           case 'q'
               brick.StopMotor('A')
               brick.StopMotor('D')
               brick.StopMotor('B')
               break
          end
     elseif (brick.ColorCode(1)==2) %blue
     else
          brick.MoveMotor('D', -100)
          brick.MoveMotor('A', -100)
     end  
            
end