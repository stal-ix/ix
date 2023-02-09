#include <stdlib.h>
#include <setjmp.h>
#include <iostream>

struct ICtx {
    virtual void run() = 0;
    virtual void* stack() const = 0;

    __attribute__((force_align_arg_pointer))
    void dorun() {
        run();
    }

    void execute() {
        jmp_buf j;

        J = &j;

        if (setjmp(*J) == 0) {
            alloca((char*)&j - (char*)stack());
            dorun();
            longjmp(*J, 1);
        }
    }

    void switchTo(ICtx* c) {
        auto o = J;
        jmp_buf j;

        J = &j;

        if (setjmp(*J) == 0) {
            if (c->J) {
                longjmp(*c->J, 1);
            } else {
                c->execute();
            }
        } else {
            J = o;
        }
    }

    jmp_buf* J = nullptr;
};

struct C: public ICtx {
    void* P = (char*)malloc(2000000) + 1024*1024;
    C* next = nullptr;

    virtual void* stack() const override {
        return P;
    }

    virtual void run() override {
        while (true) {
            std::cerr << "+ " << (size_t)this << " " << (size_t)next << std::endl;
            switchTo(next);
            std::cerr << "- " << (size_t)this << " " << (size_t)next << std::endl;
        }
    }
};

int main() {
    C c1;
    C c2;

    c1.next = &c2;
    c2.next = &c1;

    c1.execute();
}
