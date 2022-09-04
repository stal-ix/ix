{% extends '//bin/gawk/t/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gawk/gawk-5.1.1.tar.xz
sha:d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2
{% endblock %}

{% block bld_deps %}
bld/boot/4/byacc
bld/boot/4/env
{% endblock %}
