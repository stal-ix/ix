#pragma once

// some helpers
#define DL_CAT(X, Y)  DL_CA_(X, Y)
#define DL_CA_(X, Y)  DL_C__(X, Y)
#define DL_C__(X, Y)  X##Y
#define DL_STR(X)     DL_ST_(X)
#define DL_ST_(X)     #X

#if defined(__COUNTER__)
    #define DL_UID(N) DL_CAT(N, __COUNTER__)
#endif

#if !defined(DL_UID)
    #define DL_UID(N) DL_CAT(N, __LINE__)
#endif

// interface
#define RTLD_LAZY     1
#define RTLD_NOW      2
#define RTLD_GLOBAL   4
#define RTLD_LOCAL    8
#define RTLD_NODELETE 16
#define RTLD_NOLOAD   32
#define RTLD_DEEPBIND 64

#define RTLD_NEXT     RTLD_DEFAULT
#define RTLD_DEFAULT  stub_dlopen(0, 0)

#if !defined(COMPILE_DLOPEN)
#define dlsym         stub_dlsym
#define dlopen        stub_dlopen
#define dlclose       stub_dlclose
#define dlerror       stub_dlerror
#define dladdr        stub_dladdr
#endif

#if defined(__cplusplus)
extern "C" {
#endif

typedef struct {
    const char* dli_fname;
    void*       dli_fbase;
    const char* dli_sname;
    void*       dli_saddr;
} Dl_info;

void* stub_dlsym(void* handle, const char* symbol);
void* stub_dlopen(const char* filename, int flags);
int   stub_dlclose(void* handle);
char* stub_dlerror(void);
void  stub_dlregister(const char* lib, const char* symbol, void* ptr);
int   stub_dladdr(const void* addr, Dl_info* info);

#if defined(__cplusplus)
}
#endif

#define DL_LIB(name)                    \
    namespace { namespace DL_UID(Reg) { \
        static struct Reg {             \
            inline Reg() {              \
                const char* lib = name; \

#define DL_S_2(name, ptr) \
                stub_dlregister(lib, name, (void*)ptr);

#define DL_S_1(name) \
                DL_S_2(DL_STR(name), name)

#define DL_END()           \
            };             \
        } LIB_REG; \
    }}
