% brick = ConnectBrick('EB3')
global key
brick.playTone(100, 200, 300)
brick.ResetMotorAngle('ABD') % MAKE SURE TO HAVE LIFT DOWN ALL THE WAY
brickTouchSensor = 0;
brick.SetColorMode(1, 2);
isColorBlue = 0;
isColorRed = 0;
isColorGreen = 0;
while 1
    while (brickTouchSensor == 0 && isColorBlue == 0 && isColorRed == 0 && isColorGreen == 0)
        brick.MoveMotor('AD', -100)
        if (brick.ColorCode(1) == 2)
            isColorBlue = 1;
            InitKeyboard();
        elseif (brick.ColorCode(1) == 3 && brick.GetMotorAngle('B')~= 0)
            InitKeyboard();
            isColorGreen = 1;
        end
        while (brick.UltrasonicDist(4) > 30 && isColorRed == 0) %turns right 90 if 
            brick.MoveMotor('D', -100)
            brick.MoveMotor('A', -25)
            if (brick.ColorCode(1) == 5)
                isColorRed = 1;
            end
        end
        if (brick.TouchPressed(3) == 1 || brick.TouchPressed(2) == 1)
            brickTouchSensor = 1;
        end
        if (brick.ColorCode(1) == 5)
            isColorRed = 1;
        end
    end 
    while (isColorBlue == 1 || isColorGreen == 1)
        pause(0.1);
            switch key
                   case 'uparrow'
                       disp('Up arrow pressed');
                       brick.MoveMotor('AD', -100);
                   case 'downarrow'
                       disp('Down arrow pressed');
                       brick.MoveMotor('AD', 100);
                   case 'leftarrow'
                       disp('Left arrow pressed');
                       brick.MoveMotor('D', 100);
                       brick.MoveMotor('A', -100);
                   case 'rightarrow'
                       disp('Right arrow pressed');
                       brick.MoveMotor('D', -100);
                       brick.MoveMotor('A', 100);
                   case 'w'
                       brick.MoveMotor('B', -35);
                   case 's'
                       brick.MoveMotor('B', 35);                    
                   case 0
                       disp('No Key pressed')
                       brick.StopMotor('ADB');
                   case 'q'
                       brick.StopMotor('ADB');
                       isColorBlue = 0;
                       isColorGreen = 0;
                       close all
                       break;
            end
    end
    while (isColorRed == 1)
        brick.StopMotor('AD');
        pause(4);
        isColorRed = 0;
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
end
