{% extends 'freeze.sh' %}

{% block more_deps %}
# bld env/std
{% endblock %}

{% block build %}
>frozen.py

python3 $(dirname $(command -v python3))/freeze/freeze.py -m frozen.py $(cat modules)

python3 << EOF | clang -o frozen.o -c -x c -
{% include 'preprocess.py' %}
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
export LDFLAGS="-L${out}/lib -Wl,--whole-archive -lfrozen -Wl,--no-whole-archive \${LDFLAGS}"
{% endblock %}
