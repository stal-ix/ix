{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
miniupnpd
{% endblock %}

{% block version %}
2.3.8
{% endblock %}

{% block fetch %}
https://github.com/miniupnp/miniupnp/archive/refs/tags/miniupnpd_{{self.version().strip().replace('.', '_')}}.tar.gz
sha:154aa4349453a566b1b36573af0ece5f28a7b2368aec7dd8243cb35416fdf449
{% endblock %}
