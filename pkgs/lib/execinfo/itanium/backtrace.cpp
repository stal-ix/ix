#include <stdlib.h>

extern "C" {
    typedef enum {
        _URC_NO_REASON = 0,
        _URC_FOREIGN_EXCEPTION_CAUGHT = 1,
        _URC_FATAL_PHASE2_ERROR = 2,
        _URC_FATAL_PHASE1_ERROR = 3,
        _URC_NORMAL_STOP = 4,
        _URC_END_OF_STACK = 5,
        _URC_HANDLER_FOUND = 6,
        _URC_INSTALL_CONTEXT = 7,
        _URC_CONTINUE_UNWIND = 8
    } _Unwind_Reason_Code;

    void _Unwind_Backtrace(void*, void*);
    void* _Unwind_GetIP(void*);
}

namespace {
    struct Context {
        void** sym;
        size_t cnt;
        size_t size;
    };

    static _Unwind_Reason_Code helper(struct _Unwind_Context* c, void* h) {
        Context* bt = (Context*)h;

        if (bt->cnt != 0) {
            bt->sym[bt->cnt - 1] = _Unwind_GetIP(c);
        }

        if (bt->cnt == bt->size) {
            return _URC_END_OF_STACK;
        }

        ++bt->cnt;

        return _URC_NO_REASON;
    }

    static inline size_t backTrace(void** p, size_t len) {
        if (len >= 1) {
            Context bt = {p, 0, len};

            _Unwind_Backtrace((void*)&helper, &bt);

            return bt.cnt - 1;
        }

        return 0;
    }
}

extern "C" int backtrace(void** p, int len) {
    return backTrace(p, len);
}
