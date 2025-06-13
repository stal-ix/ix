{% extends '//die/c/make.sh' %}

{% block pkg_name %}
kakoune
{% endblock %}

{% block version %}
2025.06.03
{% endblock %}

{% block fetch %}
https://github.com/mawww/kakoune/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e065dbb715bfe6b0abdaeee775243115748bd540a346d0212fdca6c20c13d340
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
