{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vstakhov/libucl/archive/refs/tags/0.9.0.tar.gz
sha:87b233048bca7d307b14cffb882d3c198dc3fff96b19e0c3515428f027b3ebfe
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
