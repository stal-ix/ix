{% extends 'freeze.sh' %}

{% block more_deps %}
# bld env/std
{% endblock %}

{% block build %}
>frozen.py

python3 $(dirname $(which python3))/freeze/freeze.py -m frozen.py $(cat modules)

python3 << EOF | clang -o frozen.o -c -x c -
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
EOF

clang -c M_*

clang -c -o register.o -x c++ - << EOF
extern "C" void registerFrozenModules();

namespace {
    static struct RegisterFrozen {
        RegisterFrozen() {
            registerFrozenModules();
        }
    } REG;
}
EOF

ar q libfrozen.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp libfrozen.a ${out}/lib/
{% endblock %}

{% block env %}
export LDFLAGS="-L$(python3 -c 'import sys; print(sys.prefix)')/lib -lpython3.10 -L${out}/lib -Wl,--whole-archive -lfrozen -Wl,--no-whole-archive \${LDFLAGS}"
{% endblock %}
