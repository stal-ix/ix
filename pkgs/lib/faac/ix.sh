{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
faac
{% endblock %}

{% block version %}
2.1
{% endblock %}

{% block fetch %}
https://github.com/knik0/faac/archive/refs/tags/faac-{{self.version().strip()}}.tar.gz
1d4b890c7d767361987d80afdacdd654d23a748b4a273d743c174c2d57e9bce5
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
