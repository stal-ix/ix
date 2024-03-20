{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vstakhov/libucl/archive/refs/tags/0.9.1.tar.gz
sha:e3efc73db5dfbfd4866bbff46f73efbecdb6b8f851e604d3a22ea65d5ede7b98
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
