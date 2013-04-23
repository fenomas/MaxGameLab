#include <stdio.h> 
#include "pathfinder.h"
int main()
{
    Pather *p = new Pather();
    p->x = 10;
    p->y = 15;
    printf("Pather x/y: %d/%d\n", p->x, p->y);
    p->move(5, 10);
    printf("Pather x/y: %d/%d\n", p->x, p->y);
}
