{% extends '//bin/gawk/t/ix.sh' %}

{% block pkg_name %}
gawk
{% endblock %}

{% block version %}
5.1.1
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gawk/gawk-{{self.version().strip()}}.tar.xz
sha:d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2
{% endblock %}

{% block bld_deps %}
bld/boot/5/byacc
bld/boot/5/env
{% endblock %}
