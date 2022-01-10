{% extends '//mix/template/c_std.sh' %}

{% block step_unpack %}
: nothing to unpack
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib/networking
{% endblock %}

{% block build %}
clang++ -c -o reg.o -x c++ - << EOF
extern "C" void _g_io_modules_ensure_loaded();
extern "C" void g_tls_backend_gnutls_register(void*);

namespace {
    static struct Reg {
        Reg() {
            _g_io_modules_ensure_loaded();
            g_tls_backend_gnutls_register(nullptr);
        }
    } REG;
}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/lib; cp reg.o ${out}/lib/
{% endblock %}

{% block env %}
export LDFLAGS="${out}/lib/reg.o \${LDFLAGS}"
{% endblock %}
