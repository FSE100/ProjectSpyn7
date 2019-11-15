brick.ResetMotorAngle('AD')
brickTouchSensor=0;
while 1
    
    while (brickTouchSensor == 0)
        brick.MoveMotor('D', -100)
        brick.MoveMotor('A', -100)
        while (brick.UltrasonicDist(4) > 30) %turns right 90 if 
            brick.MoveMotor('D', -100)
            brick.MoveMotor('A', -25)
        end
        if (brick.TouchPressed(3) == 1)
            brickTouchSensor=1;
        end
    end
    while (brickTouchSensor == 1) %turns left 90 if touched
         brick.StopMotor('AD')
         brick.MoveMotorAngleRel('D', 100, 660);
         brick.WaitForMotor('D');
         brick.MoveMotorAngleRel('A', -100, 660);
         brick.WaitForMotor('A');
         brickTouchSensor = 0;
    end
    
end