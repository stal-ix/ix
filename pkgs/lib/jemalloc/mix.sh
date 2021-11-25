{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/jemalloc/jemalloc/archive/refs/tags/5.2.1.tar.gz
0d627898d4aa58d09ef5d3fdde17dacb
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
autoconf
{% endblock %}

{% block coflags %}
--disable-libdl
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libjemalloc_pic.a
{% endblock %}
