{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/1.7.0.tar.gz
sha:59bb6f42ecf1bd136b40eaffe40232fc76488b03954ef25cb588404b8d66a7e0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
