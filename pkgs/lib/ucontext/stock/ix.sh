{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/kaniini/libucontext/archive/refs/tags/libucontext-1.3.1.tar.gz
sha:1243ee9f03ad38e624f6844427b7bc1f0a05aa5de70f15f3b03805a364b971d6
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}
