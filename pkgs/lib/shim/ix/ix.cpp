#include "ix.h"

#include <string>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/mman.h>

namespace {
    static void log(const std::string& s) {
        write(2, s.c_str(), s.length());
    }

    static void die(const std::string& msg) {
        log("shit happen: " + msg + ", abort now\n");
        abort();
    }

    static const char* tmpDirBase() {
        if (auto env = getenv("TMPDIR"); env) {
            return env;
        }

        die("no TMPDIR in environment");
    }

    static std::string tmpDir() {
        return tmpDirBase();
    }

    static auto mkstempTemplate() {
        return tmpDir() + "/" + std::to_string(getpid()) + ".XXXXXX";
    }
}

extern "C" const char* ix_temp_dir() {
    return tmpDirBase();
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
