{% extends '//gnu/coreutils/template/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
0009a224d8e288e8ec406e
{% endblock %}

{% block coreutils_deps_extra %}
boot/9/bison/./3.4.1_2.sh
{% endblock %}
