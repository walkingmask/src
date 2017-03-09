/* frac.h
 * 2016/05/26(Thu)
 * walkingmask
 * discripthon
 *  Calculating fractional api
 *
 * 2016/05/28 Up to date v1.1
 *  - added some functions
 *  - It outputs the integer value when the denominator is 1
 *  - Complex calculation of an integer value
 *  - add an structure of fraction, but it is not in use now
 * 2016/07/29 Up do date v1.2
 *  - added exception process to divide by 0
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * the structure of the fraction
 * caution: it is not in use yet
 */
typedef struct {
    int top; // top part
    int bot; // bottom part
    int in;  // integer part
} frac_t;

/*
 * the number is a fraction or an integer?
 * caution: another possibility is not taken (like a float...)
 */
int isfrac(char *num) {
    int i;
    for (i=0; i<strlen(num); i++)
        if (num[i] == '/') return 0;
    return 1;
}

/*
 * do convert: an integer -> a fraction
 */
void int2frac(char *i, char *f) {
    strcpy(f, i);
    f[strlen(i)] = '/';
    f[strlen(i)+1] = '1';
    f[strlen(i)+2] = '\0';
}

/*
 * can convert the fraction to an integer?
 */
int canconv2int(char *f) {
    int top, bot;
    sscanf(f, "%d/%d", &top, &bot);
    if (top%bot == 0) return 0;
    return 1;
}

/*
 * do convert: an integer -> a fraction
 */
void frac2int(char *f) {
    int top, bot;
    sscanf(f, "%d/%d", &top, &bot);
    sprintf(f, "%d", top/bot);
}

/*
 * get the greatest common divisor of x and y
 */
int gcd(int x, int y) {
    if (y == 0) return x;
    return gcd(y, x%y);
}

/*
 * get the least common multiple of x and y
 */
int lcm(int x, int y) {
    if ( (0 == x) || (0 == y) ) return 0;
    return ((x/ gcd(x, y)) * y);
}

/*
 * do reduction
 */
void reduc(int *top, int *bot) {
    int comd;
    if ( (comd = abs( gcd(*top, *bot) )) != 1) {
        *top = *top / comd;
        *bot = *bot / comd;
    }
}

/*
 * a simple addition of fraction
 * f1     :  fraction1
 * f2     :  fraction2
 * res    : result
 * return : there is no reason now
 */
int fracadd(const char *f1, const char *f2, char *res) {

    int top1, top2, bot1, bot2, comm, rest, resb;
    sscanf(f1, "%d/%d", &top1, &bot1);
    sscanf(f2, "%d/%d", &top2, &bot2);

    // reducing
    if (bot1 != bot2) {
        comm = abs( lcm(bot1, bot2) );
        top1 = top1 * (comm / bot1);
        top2 = top2 * (comm / bot2);
        bot1 = bot2 = comm;
    }

    rest = top1 + top2;
    resb = bot1;
    reduc(&rest, &resb);

    sprintf(res, "%d/%d", rest, resb);

    return 0;
}

/*
 * a simple subtraction of fraction
 */
int fracsub(const char *f1, const char *f2, char *res) {

    int top1, top2, bot1, bot2, comm, rest, resb;
    sscanf(f1, "%d/%d", &top1, &bot1);
    sscanf(f2, "%d/%d", &top2, &bot2);

    // pre reducing
    if (bot1 != bot2) {
        comm = abs( lcm(bot1, bot2) );
        top1 = top1 * (comm / bot1);
        top2 = top2 * (comm / bot2);
        bot1 = bot2 = comm;
    }

    rest = top1 - top2;
    resb = bot1;
    reduc(&rest, &resb);

    sprintf(res, "%d/%d", rest, resb);

    return 0;
}

/*
 * a simple multiplication of fraction
 */
int fracmult(const char *f1, const char *f2, char *res) {

    int top1, top2, bot1, bot2, rest, resb;
    sscanf(f1, "%d/%d", &top1, &bot1);
    sscanf(f2, "%d/%d", &top2, &bot2);

    // pre reduction
    reduc(&top1, &bot2);
    reduc(&top2, &bot1);

    rest = top1 * top2;
    resb = bot1 * bot2;
    reduc(&rest, &resb);

    sprintf(res, "%d/%d", rest, resb);

    return 0;
}

/*
 * a simple division of fraction
 */
int fracdiv(const char *f1, const char *f2, char *res) {

    int top, bot;
    char tempf[16];

    // reverse the fraction 2
    sscanf(f2, "%d/%d", &top, &bot);
    sprintf(tempf, "%d/%d", bot, top);

    // multiplication
    fracmult(f1, tempf, res);

    return 0;
}

/*
 * fraction calculator
 * f : fomula of fraction
 * fomula must be like this "1/2 * 3/4"
 */
int frac(const char *f, char *res) {

    char tempf[32], *f1, *op, *f2, ft1[16], ft2[16];

    // convert const char* to char*
    strcpy(tempf, f);

    // get the fractions and operator from fomula
    f1 = strtok(tempf, " ");
    op = strtok(NULL, " ");
    f2 = strtok(NULL, " ");

    // exception for divide by 0
    if (*op == '/' && *f2 == '0') {
        sprintf(res, "inf");
        return 1;
    }
    if (strcmp(f1, "inf") == 0 || strcmp(f2, "inf") == 0) {
        sprintf(res, "inf");
        return 1;
    }

    // for convert from an integer to a fraction
    if (isfrac(f1) != 0) {
        int2frac(f1, ft1);
        f1 = ft1;
    }
    if (isfrac(f2) != 0) {
        int2frac(f2, ft2);
        f2 = ft2;
    }

    // branch by the operator
    switch (*op) {
        case '+':
            fracadd(f1, f2, res);
            break;
        case '-':
            fracsub(f1, f2, res);
            break;
        case '*':
            fracmult(f1, f2, res);
            break;
        case '/':
            fracdiv(f1, f2, res);
            break;
        default:
            break;
    }

    // for convert from a fraction to an integer
    if (canconv2int(res) == 0) frac2int(res);

    return 0;
}