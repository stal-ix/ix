{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/mawww/kakoune/archive/refs/tags/v2024.05.09.tar.gz
sha:304d69683c61a4c8557c2e71d1f7c03bd009a67d6b5c3cc20204931cfe59d2b7
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
