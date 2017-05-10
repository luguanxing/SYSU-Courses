#include "game.h"

void main() {
    int ch, flag;
    system("title 软导贪吃蛇 By Lgx & mode con cols=50 lines=18 & color 1f & echo.按任意键开始游戏!& pause>0");
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
    printf("游戏结束! 按任意键继续!");
    _getch();
	delay = 300;
    goto game;
}
