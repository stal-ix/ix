{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/1.5.0.tar.gz
sha:f506140bc3af41d3432a4ce18b3b83b08eaa240e94ef161eb72b2e57cdc94c69
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
