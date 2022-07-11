#include "ix.h"

#include <set>
#include <mutex>
#include <string>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

namespace {
    static void die(const std::string& msg) {
        fprintf(stderr, "shit happen: %s, abort now\n", msg.c_str());
        abort();
    }

    struct Holder {
        auto intern(const std::string& s) {
            std::lock_guard<std::mutex> guard(L);

            S.insert(s);

            return S.find(s)->c_str();
        }

        std::set<std::string> S;
        std::mutex L;
    };

    static auto intern(const std::string& s) {
        static Holder* h = new Holder();

        return h->intern(s);
    }

    static auto sessionDir() {
        if (auto env = getenv("XDG_RUNTIME_DIR"); env) {
            return env;
        }

        die("no XDG_RUNTIME_DIR in environment");
    }

    static auto tmpDir() {
        if (auto env = getenv("TMPDIR"); env) {
            return env;
        }

        die("no TMPDIR in environment");
    }

    static auto uniqSocket() {
        return sessionDir() + std::string("/socket.") + std::to_string(getpid());
    }
}

extern "C" const char* ix_temp_session_dir() {
    return intern(sessionDir());
}

extern "C" const char* ix_temp_dir() {
    return intern(tmpDir());
}

extern "C" const char* ix_uniq_socket() {
    return intern(uniqSocket());
}
