#include "stdlib.h"

#include <vector>
#include <functional>

using Func = void (*)(int, void*);

namespace {
    struct Reg {
        static Reg* instance() {
            static Reg* reg = new Reg();
            return reg;
        }

        static void atExit() {
            instance()->callAtExit();
        }

        void callAtExit() noexcept {
            auto f = R.back();
            R.pop_back();
            f();
        }

        int onExit(Func f, void* arg) {
            if (auto res = atexit(atExit); res) {
                return res;
            }

            R.push_back([f, arg](){
                f(0, arg);
            });

            return 0;
        }

        std::vector<std::function<void()>> R;
    };
}

extern "C" int on_exit(Func func, void* arg) {
    return Reg::instance()->onExit(func, arg);
}
