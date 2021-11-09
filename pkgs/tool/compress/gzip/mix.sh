{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz
691b1221694c3394f1c537df4eee39d3
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}

{% block coflags %}
--disable-gcc-warnings
{% endblock %}
