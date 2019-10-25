global key
InitKeyboard();

while 1
        pause(0.1);
        switch key
            case 'uparrow'
                disp('Up arrow pressed');
                brick.MoveMotor('D', -100);
                brick.MoveMotor('A', -100);
            case 'downarrow'
                disp('Down arrow pressed');
                brick.MoveMotor('D', 100);
                brick.MoveMotor('A', 100);
            case 'leftarrow'
                disp('Left arrow pressed');
                brick.MoveMotor('D', 100);
                brick.MoveMotor('A', -100);
            case 'rightarrow'
                disp('Right arrow pressed');
                brick.MoveMotor('D', -100);
                brick.MoveMotor('A', 100);
            case 'w'
                brick.MoveMotor('B', -25);
            case 's'
                brick.MoveMotor('B', 25);
            case 0
                disp('No Key pressed');
                brick.StopMotor('A');
                brick.StopMotor('D');
                brick.StopMotor('B');
            case 'q'
                brick.StopMotor('A');
                brick.StopMotor('D');
                brick.StopMotor('B');
                break;
        end
end

brick.playTone(100, 2000, 1000);   

CloseKeyBoard;