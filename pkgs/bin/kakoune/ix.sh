{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/mawww/kakoune/archive/refs/tags/v2022.10.31.tar.gz
sha:f3eab1e663763c62881d553ad6263526940fa3ca357e0183767885415fc80b03
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block c_compiler %}
bin/gcc(for_target={{target.gnu.three}},gcc_ver=12)
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block make_flags %}
libexecdir=${out}/bin/bin_kakoune
{% endblock %}
