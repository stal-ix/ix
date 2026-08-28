{% extends '//die/c/make.sh' %}

{% block pkg_name %}
kakoune
{% endblock %}

{% block version %}
2026.05.21
{% endblock %}

{% block fetch %}
https://github.com/mawww/kakoune/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7ef778bd199e05977841e6f69aad2bee6cd58fb23b0e4bc265d012d42de17580
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
