{% extends '//die/c/make.sh' %}

{% block version %}
0.2.8
{% endblock %}

{% block fetch %}
https://github.com/thkala/actkbd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:072d94990fb81932476cf35d028ed10b216145cb9b23e81cc86a5d6b4d0deab0
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block make_flags %}
sysconfdir=${out}/etc
sbindir=${out}/bin
{% endblock %}
