{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-2.9.1.tar.gz
e340f1b247ff512119a2db98c1538dc1
{% endblock %}

{% block lib_deps %}
lib/c++
{% endblock %}

{% block bld_libs %}
lib/c++
lib/mimalloc/2
{% endblock %}

{% block patch %}
sed -e 's|-lstdc++||g' -i Makefile.am
{% endblock %}

{% block configure_flags %}
--enable-minimal
--enable-sized-delete
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libtcmalloc_minimal_debug.a
{% endblock %}
