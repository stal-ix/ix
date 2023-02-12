#include <stdlib.h>
#include <setjmp.h>
#include <iostream>

struct Runable {
    virtual void run() = 0;
};

static __attribute__((noinline)) void* sp() {
    char ch;
    return &ch;
}

static __attribute__((noinline)) void eat(void*) {
}

struct Ctx {
    void switchTo(Ctx* c) {
        if (setjmp(J) == 0) {
            longjmp(c->J, 1);
        }
    }

    void spawn(Runable* r, void* stack) {
        spawn(this, r, stack);
    }

    __attribute__((noinline))
    void spawn(Ctx* cur, Runable* r, void* stack) {
        if (setjmp(cur->J) == 0){
            eat(alloca((size_t)sp() - (size_t)stack));
            switchTo(cur);
            r->run();
        }
    }

    jmp_buf J;
};

struct C: Ctx, public Runable {
    Ctx* next = nullptr;

    void run() override {
        while (true) {
            std::cerr << 1 << std::endl;
            switchTo(next);
        }
    }
};

struct M: Ctx {
    void run() {
        C c;

        c.next = this;

        spawn(&c, (char*)malloc(2000000) + 1024 * 1024);

        while (true) {
            std::cerr << "0" << std::endl;
            switchTo(&c);
        }
    }
};

int main() {
    M().run();
}
