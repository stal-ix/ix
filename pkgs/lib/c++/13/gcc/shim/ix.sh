{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
cat << EOF > terminate.cpp
#include <stdlib.h>
extern "C" void __cxa_call_terminate() {
    abort();
}
EOF
{% endblock %}

{% block build %}
c++ -c terminate.cpp
ar qs libcxxshim.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libcxxshim.a ${out}/lib/
{% endblock %}
