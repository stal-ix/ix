#include <stdlib.h>
#include <setjmp.h>
#include <iostream>

struct Ctx {
    void switchTo(Ctx* c) {
        if (setjmp(J) == 0) {
            longjmp(c->J, 1);
        }
    }

    jmp_buf J;
};

struct C: public Ctx {
    void* P = (char*)malloc(2000000) + 1024*1024;
    Ctx* main = nullptr;

    __attribute__((force_align_arg_pointer))
    void dorun() {
        run();
    }

    void spawn() {
        fprintf(stderr, "1\n");
        char ch;
        alloca(&ch - (char*)P);
        fprintf(stderr, "2\n");
        switchTo(main);
        fprintf(stderr, "3\n");
        dorun();
    }

    void run() {
        std::cerr << "spawn " << (size_t)this << std::endl;

        while (true) {
            std::cerr << (size_t)P << std::endl;
            switchTo(main);
        }
    }
};

struct M: Ctx {
    C c;

    void run() {
        c.main = this;

        if (setjmp(J) == 0) {
            c.spawn();
        }

        while (true) {
            std::cerr << "c1" << std::endl;
            switchTo(&c);
        }
    }
};

int main() {
    std::cerr << "start" << std::endl;

    M m;
    m.run();
}
