{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/jemalloc/jemalloc/archive/refs/tags/5.2.1.tar.gz
0d627898d4aa58d09ef5d3fdde17dacb
{% endblock %}

{% block autoreconf %}
autoconf
{% endblock %}

{% block configure_flags %}
--disable-cxx
--disable-libdl
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libjemalloc_pic.a
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
lib/c++
lib/mimalloc/2
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
JEMALLOC_BACKGROUND_THREAD=1
{% endblock %}
