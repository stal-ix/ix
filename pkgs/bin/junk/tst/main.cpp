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

static __attribute__((noinline)) void* sp() {
    char ch;
    return &ch;
}

struct C: public Ctx {
    void* P = (char*)malloc(2000000) + 1024*1024;
    Ctx* main = nullptr;

    __attribute__((force_align_arg_pointer))
    __attribute__((noinline))
    void dorun() {
        //fprintf(stderr, "%zu %zu\n", (size_t)sp(), (size_t)P);
        switchTo(main);
        run();
    }

    __attribute__((noinline))
    void spawn() {
        fprintf(stderr, "%zu\n", (size_t)alloca((size_t)sp() - (size_t)P));
        dorun();
    }

    void run() {
        while (true) {
            std::cerr << "func " << (size_t)P << std::endl;
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
