{% extends '//die/c_std.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build %}
cat << EOF > glx.c
#include <dlfcn.h>

void* glXGetProcAddressARB(const char* name) {
    return dlsym(dlopen("GL", RTLD_GLOBAL), name);
}
EOF

cc -c -o glx.o glx.c
ar q libglx.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}
