{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
smartmontools
{% endblock %}

{% block version %}
7.5
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/sourceforge/smartmontools/smartmontools-{{self.version().strip()}}.tar.gz
690b83ca331378da9ea0d9d61008c4b22dde391387b9bbad7f29387f2595f76e
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/cap/ng
{% endblock %}

{% block configure_flags %}
--with-libcap-ng=yes
{% endblock %}
