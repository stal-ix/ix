{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/1.6.0.tar.gz
sha:cc6839962144126bc6cc1cde89a50c3bb000b42a93d7e5295b1414d9bdf70c12
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
