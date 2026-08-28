{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libucl
{% endblock %}

{% block version %}
0.9.4
{% endblock %}

{% block fetch %}
https://github.com/vstakhov/libucl/archive/refs/tags/{{self.version().strip()}}.tar.gz
319d8ff13441f55d91cd7f3708a54bd03779733e26958c2346c5109014520aaf
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
