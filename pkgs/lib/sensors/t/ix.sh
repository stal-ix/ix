{% extends '//die/c/make.sh'  %}

{% block pkg_name %}
lm-sensors
{% endblock %}

{% block version %}
3.6.2
{% endblock %}

{% block fetch %}
https://github.com/hramrach/lm-sensors/archive/refs/tags/V{{self.version().strip().replace('.', '-')}}.tar.gz
sha:c6a0587e565778a40d88891928bf8943f27d353f382d5b745a997d635978a8f0
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
SBINDIR=${out}/bin
ETCDIR=${out}/etc
{% endblock %}
