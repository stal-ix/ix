#include "ix.h"

#include <string>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

namespace {
    static inline const char* sessionDir() {
        if (auto env = getenv("XDG_RUNTIME_DIR"); env) {
            return env;
        }

        if (auto env = getenv("TMPDIR"); env) {
            return env;
        }

        abort();
    }

    static inline const char* userDir() {
        if (auto env = getenv("IX_SDIR"); env) {
            return env;
        }

        return sessionDir();
    }

    static inline std::string uniqSocket() {
        return std::string(sessionDir()) + std::string("/socket.") + std::to_string(getpid());
    }
}

extern "C" const char* ix_temp_session_dir() {
    return sessionDir();
}

extern "C" const char* ix_temp_user_dir() {
    return userDir();
}

extern "C" const char* ix_uniq_socket() {
    static std::string* s = new std::string(uniqSocket());

    return s->c_str();
}
