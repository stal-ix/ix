{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/1.5.4.tar.gz
sha:ddd24f26a31d23373e63d9be2e723263ac46c8b6d49902ab08024b573fd2a416
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
