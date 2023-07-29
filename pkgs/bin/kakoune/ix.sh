{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/mawww/kakoune/archive/refs/tags/v2023.07.29.tar.gz
sha:0fbefc81783903b7301359cbc2e0754ba008af6f2f6ef83651a32eec7375497b
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
