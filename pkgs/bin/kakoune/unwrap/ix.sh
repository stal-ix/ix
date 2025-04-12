{% extends '//die/c/make.sh' %}

{% block version %}
2024.05.18
{% endblock %}

{% block fetch %}
https://github.com/mawww/kakoune/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:50f2920db8ab8f71556b73dfd6d53fb924f67d1c60b9882050cfecfaa3aed31f
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
