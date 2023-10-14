{% extends 't/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/13/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/musl/pure
{% endblock %}

{% block setup %}
export CPPFLAGS="-iquote src -Iinclude -std=c++14 ${CPPFLAGS}"
{% endblock %}

{% block c_compiler %}
bin/gcc(gcc_ver=13,for_target={{host.gnu.three}})
bin/gcc(gcc_ver=13,for_target={{target.gnu.three}})
{% endblock %}
