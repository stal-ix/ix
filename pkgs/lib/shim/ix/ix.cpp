#include "ix.h"

#include <set>
#include <mutex>
#include <string>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/mman.h>

namespace {
    __attribute__((__noreturn__))
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

    static auto tmpDir() {
        if (auto env = getenv("TMPDIR"); env) {
            return std::string(env);
        }

        die("no TMPDIR in environment");
    }

    static auto uniqSocket() {
        return tmpDir() + "/socket." + std::to_string(getpid());
    }

    static auto mkstempTemplate() {
        return tmpDir() + "/" + std::to_string(getpid()) + ".XXXXXX";
    }
}

extern "C" const char* ix_temp_dir() {
    return intern(tmpDir());
}

extern "C" const char* ix_uniq_socket() {
    return intern(uniqSocket());
}

extern "C" char* ix_mkstemp_template() {
    return strdup(mkstempTemplate().c_str());
}

extern "C" int ix_mkstemp() {
#if defined(__linux__)
    {
        if (auto fd = memfd_create("mkstemp", 0); fd >= 0) {
            return fd;
        }
    }
#endif

    {
        auto name = mkstempTemplate();

        if (auto fd = mkstemp(name.data()); fd >= 0) {
            unlink(name.data());

            return fd;
        }
    }

    return -1;
}
