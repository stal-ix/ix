{% extends '//die/c/make.sh' %}

{% block pkg_name %}
entr
{% endblock %}

{% block version %}
5.8
{% endblock %}

{% block fetch %}
https://github.com/eradman/entr/archive/refs/tags/{{self.version().strip()}}.tar.gz
dc9a2bdc556b2be900c1d8cdf432de26492de5af3ffade000d4bfd97f3122bfb
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE
_LINUX_PORT
{% endblock %}

{% block cpp_flags %}
-Imissing
{% endblock %}

{% block patch %}
cp Makefile.linux Makefile
{% endblock %}
