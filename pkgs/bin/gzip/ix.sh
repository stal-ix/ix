{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gzip/gzip-1.12.tar.xz
sha:ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}
