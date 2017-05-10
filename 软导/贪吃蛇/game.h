#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

#define SNAKE_HEAD "H"
#define SNAKE_BODY "x"
#define WALL_CELL "*"
#define SNAKE_FOOD "$"
#define BLANK_CELL "  "
#define SNAKE_DEAD "\2"
#define SNAKE_LENGTH 400

char setcxy(int, int);//设置光标位置
void rfood(int, int, int, int);//生成随机食物
void init();//初始化一切
char snakemove();//蛇的行为

int Direct, score, delay = 300, god = 0;
int X = 20, Y = 7, Stepx = 2, Stepy = 1;
int fleft = 2, fright = 48, ftop = 1, fbottom = 15;
int left = 0, right = 48, top = 0, bottom = 17;

struct Snake{
    COORD body[SNAKE_LENGTH];
    int tail;
} SNAKE;
COORD food;

char setcxy(int x, int y) {
    HANDLE Hd;
    CONSOLE_SCREEN_BUFFER_INFO CSBI;
    Hd = GetStdHandle(STD_OUTPUT_HANDLE);
    GetConsoleScreenBufferInfo(Hd, &CSBI);
    if (0 <= x && x <= CSBI.srWindow.Right && 0 <= y && y <= CSBI.srWindow.Bottom) {
        COORD Csxy = { x, y };
        SetConsoleCursorPosition(Hd, Csxy);
        return 0;
    }
    return 1;
}

void rfood(int left, int right, int top, int bottom) {
    int n = 0;
	st:;
    food.X = 2 * (rand() % (right / 2) + left / 2 - 1);
    food.Y = rand() % bottom + top - 1;
	if (food.X == left || food.X == right || food.Y == bottom || food.Y == top)
		goto st;
    for (n = 0; n <= SNAKE.tail; n++)
        if (food.X == SNAKE.body[n].X && food.Y == SNAKE.body[n].Y)
            goto st;
    setcxy(food.X, food.Y);
    printf(SNAKE_FOOD);
    return;
}

void init() {
    int n;
    Direct = 0;
    setcxy(left, top);
    for (n = left; n <= right * 2; n += 2)
	  printf(WALL_CELL);
    setcxy(left, bottom - 2);
    for (n = left; n <= right * 2; n += 2)
      printf(WALL_CELL);
    setcxy(left, bottom);
    for (n = left; n <= right * 2; n += 2)
	  printf(WALL_CELL);
    for (n = top; n <= bottom; n += 1) {
        setcxy(left, n);
        printf(WALL_CELL);
    }
    for (n = top; n <= bottom; n += 1) {
        setcxy(right, n);
        printf(WALL_CELL);
    }
    score = 0;
    setcxy(left + 17, bottom - 1);
    printf("当前长度：%04d", score);
    setcxy(left + 30, bottom - 1);
    SNAKE.body[0].X = X;
    SNAKE.body[0].Y = Y;
    SNAKE.tail = 0;
    setcxy(SNAKE.body[0].X, SNAKE.body[0].Y);
    printf(SNAKE_HEAD);
    rfood(fleft, fright, ftop, fbottom);
}

char snakemove() {
    int n, tmpx, tmpy;
    if (Direct) {
        tmpx = SNAKE.body[SNAKE.tail].X;
        tmpy = SNAKE.body[SNAKE.tail].Y;
        for (n = SNAKE.tail; n > 0; n--) {
            SNAKE.body[n] = SNAKE.body[n - 1];
            setcxy(SNAKE.body[n].X, SNAKE.body[n].Y);
            printf(SNAKE_BODY);
        }
        switch (Direct) {
        case 1:SNAKE.body[0].Y -= Stepy; break;
        case 2:SNAKE.body[0].Y += Stepy; break;
        case 3:SNAKE.body[0].X -= Stepx; break;
        case 4:SNAKE.body[0].X += Stepx; break;
        }
            if (SNAKE.body[0].X == left || SNAKE.body[0].Y == top || SNAKE.body[0].X == right || SNAKE.body[0].Y == bottom - 2)
                return 1;
            for (n = 3; n <= SNAKE.tail; n++)
                if (SNAKE.body[0].X == SNAKE.body[n].X && SNAKE.body[0].Y == SNAKE.body[n].Y)
                    return 1;
        else{
            if (SNAKE.body[0].X == left) SNAKE.body[0].X = right - 2;
            if (SNAKE.body[0].X == right) SNAKE.body[0].X = left + 2;
            if (SNAKE.body[0].Y == top) SNAKE.body[0].Y = bottom - 3;
            if (SNAKE.body[0].Y == bottom - 2) SNAKE.body[0].Y = top + 1;
        }
        setcxy(SNAKE.body[0].X, SNAKE.body[0].Y);
        printf(SNAKE_HEAD);
        setcxy(tmpx, tmpy);
        if (SNAKE.body[0].X == food.X && SNAKE.body[0].Y == food.Y) {
            printf(SNAKE_BODY);
            rfood(fleft, fright, ftop, fbottom);
            SNAKE.tail += 1;
            SNAKE.body[SNAKE.tail].X = tmpx;
            SNAKE.body[SNAKE.tail].Y = tmpy;
            setcxy(left + 17, bottom - 1);
            printf("当前长度：%04d", ++score);
			if (delay >= 100) delay -= 25;
        }
        else
            printf(BLANK_CELL);
    }
    return 0;
}
