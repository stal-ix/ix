#include "dlfcn.h"

#include <unistd.h>
#include <string.h>
#include <stdlib.h>

#include <string>
#include <string_view>
#include <unordered_map>

namespace {
    struct Dbg {
        inline void out(const void* buf, size_t len) noexcept {
            write(1, buf, len);
        }

        inline void out(const char* s) noexcept {
            if (!s) {
                s = "(null)";
            }

            out(s, strlen(s));
        }

        inline void out(int i) noexcept {
            out(std::to_string(i));
        }

        inline void out(std::string_view s) noexcept {
            out(s.data(), s.size());
        }

        template <typename T>
        inline auto& operator<<(T s) noexcept {
            out(s);

            return *this;
        }
    };

    static inline bool debugEnabled() {
        static const bool enabled = getenv("DL_STUB_DEBUG");

        return enabled;
    }

#define DBG(X) \
    if (debugEnabled()) { \
        Dbg d;            \
        d << X << "\n";   \
    }

    struct IfaceHandle {
        virtual void* lookup(const std::string_view& s) const noexcept = 0;
    };

    struct Handle: public IfaceHandle, public std::unordered_map<std::string, void*> {
        void* lookup(const std::string_view& s) const noexcept override {
            if (auto it = find(std::string(s)); it != end()) {
                DBG("found " << s);

                return it->second;
            }

            DBG("not found " << s);

            return nullptr;
        }
    };

    struct Handles: public IfaceHandle, public std::unordered_map<std::string, Handle> {
        // default handle lookup
        void* lookup(const std::string_view& s) const noexcept override {
            for (const auto& it : *this) {
                if (auto res = it.second.lookup(s); res) {
                    DBG("found global " << s);

                    return res;
                }
            }

            DBG("not found global " << s);

            return nullptr;
        }

        inline IfaceHandle* findHandle(const std::string& s) {
            DBG("try open handle " << s);

            if (auto it = find(s); it != end()) {
                DBG("found handle " << s);

                return &it->second;
            }

            DBG("not found handle " << s);

            return nullptr;
        }

        inline void registar(const char* lib, const char* symbol, void* ptr) noexcept {
            DBG("register " << lib << ", " << symbol);

            (*this)[lib][symbol] = ptr;
        }

        static inline Handles* instance() noexcept {
            static Handles* h = new Handles();

            return h;
        }
    };

    static thread_local const char* DL_ERROR = nullptr;

    static inline void setLastError(const char* err) {
        DL_ERROR = err;
    }

    static auto lastError() noexcept {
        auto ret = DL_ERROR;

        DL_ERROR = nullptr;

        return ret;
    }

    static std::string baseName(const std::string& s) {
        std::string r;

        for (char ch : s) {
            if (ch == '/') {
                r.clear();
            } else {
                r.push_back(ch);
            }
        }

        return r;
    }

    static inline std::string cutPrefix(const std::string& s, const std::string& prefix) {
        if (s.size() > prefix.size()) {
            if (s.substr(0, prefix.size()) == prefix) {
                return s.substr(prefix.size());
            }
        }

        return s;
    }

    static inline std::string cutExt(const std::string& s) {
        std::string r;

        for (char ch : s) {
            if (ch == '.') {
                break;
            }

            r.push_back(ch);
        }

        return r;
    }

    static std::string calcName(const std::string& s) {
        return cutExt(cutPrefix(baseName(s), "lib"));
    }
}

extern "C" void* stub_dlsym(void* handle, const char* symbol) {
    lastError();

    if (handle) {
        if (auto ret = ((IfaceHandle*)handle)->lookup(symbol); ret) {
            return ret;
        }
    }

    setLastError("symbol not found");

    return 0;
}

extern "C" void* stub_dlopen(const char* filename, int mode) {
    lastError();

    DBG("dlopen " << filename << " " << mode);

    if (!filename) {
        filename = "";
    }

    if (strcmp(filename, "") == 0) {
        return Handles::instance();
    }

    if (auto res = Handles::instance()->findHandle(filename); res) {
        return res;
    }

    if (auto res = Handles::instance()->findHandle(calcName(filename)); res) {
        return res;
    }

    setLastError("library not found");

    return 0;
}

extern "C" int stub_dlclose(void*) {
    lastError();

    return 0;
}

extern "C" char* stub_dlerror(void) {
    return (char*)lastError();
}

extern "C" void stub_dlregister(const char* lib, const char* symbol, void* ptr) {
    Handles::instance()->registar(lib, symbol, ptr);
}

extern "C" int stub_dladdr(const void* /*addr*/, Dl_info* /*info*/) {
    return 0;
}

DL_LIB("dl")
DL_S_2("dlopen", stub_dlopen)
DL_S_2("dlsym", stub_dlsym)
DL_S_2("dlclose", stub_dlclose)
DL_S_2("dlerror", stub_dlerror)
DL_S_2("dladdr", stub_dladdr)
DL_END()

DL_LIB("c")
DL_S_2("dlopen", stub_dlopen)
DL_S_2("dlsym", stub_dlsym)
DL_S_2("dlclose", stub_dlclose)
DL_S_2("dlerror", stub_dlerror)
DL_S_2("dladdr", stub_dladdr)
DL_END()
