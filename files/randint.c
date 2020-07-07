#include <stdlib.h>
#include <time.h>

int randint(int min, int max)
{
    srand(time(NULL));
    int random = (rand() % (max - min + 1)) + min;
    return random;
}