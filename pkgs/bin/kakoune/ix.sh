{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/mawww/kakoune/archive/refs/tags/v2023.08.05.tar.gz
sha:1ad7bfe9e1d861115cd418cb500990ea5fa63726e998df13702e5caa8fc84356
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
