STRUCT = '''
struct _frozen {
    const char* name;
    const unsigned char* code;
    int size;
};
'''

FUNC = '''
extern void* PyImport_FrozenModules;

void registerFrozenModules() {
    PyImport_FrozenModules = _PyImport_FrozenModules;
}
'''

for l in open('frozen.c').read().split('\n'):
    if 'Python.h' in l:
        print(STRUCT)
    elif l == '};':
        print(l)
        print(FUNC)
        break
    else:
        print(l)
