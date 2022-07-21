{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vstakhov/libucl/archive/refs/tags/0.8.1.tar.gz
sha:a6397e179672f0e8171a0f9a2cfc37e01432b357fd748b13f4394436689d24ef
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
