
%brick = ConnectBrick('EB3')
brick.playTone(100, 200, 300)

while 1  
     if (brick.TouchPressed(3)==1) %turns left 90 if touched 
         brick.MoveMotorAngleAbs('D', 100, 600, 'Brake');
         brick.MoveMotorAngleAbs('A', -100, 600, 'Brake');
         brick.ResetMotorAngle('AD');
         brick.MoveMotor('D', -100)
         brick.MoveMotor('A', -100)
     elseif (brick.UltrasonicDist(4) > 30) %turns right 90 if 
         brick.MoveMotor('D', -100)
         brick.MoveMotor('A', -25)
     else
         brick.MoveMotor('D', -100)
         brick.MoveMotor('A', -100)
     end  
            
end