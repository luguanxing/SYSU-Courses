#include "game.h"

void main() {
    int ch, flag;
    system("title ��̰���� By Lgx & mode con cols=50 lines=18 & color 1f & echo.���������ʼ��Ϸ!& pause>0");
game:;
    system("cls");
    flag = 1;
    init();
    while (flag) {
        Sleep(delay);
        if (_kbhit()) {
            ch = _getch();
            switch (ch) {
            case 72:if (Direct != 2) Direct = 1; break;
            case 80:if (Direct != 1) Direct = 2; break;
            case 75:if (Direct != 4) Direct = 3; break;
            case 77:if (Direct != 3) Direct = 4; break;
            default:;
            }
        }
        if (snakemove())
            flag = 0;
    }
    setcxy(SNAKE.body[0].X, SNAKE.body[0].Y);
    printf(SNAKE_DEAD);
    setcxy(left + 15, bottom - 1);
    printf("��Ϸ����! �����������!");
    _getch();
	delay = 300;
    goto game;
}
