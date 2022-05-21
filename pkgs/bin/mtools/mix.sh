{% extends '//die/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-4.0.39.tar.lz
sha:fb89bc2be8408f4875121fa7d584ab91ea5a34b5cbdb736ff2e015e03a4241b3
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}
