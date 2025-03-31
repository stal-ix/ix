{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/1.8.0.tar.gz
sha:b9f565adc6e2c8c813dafd6d5406a71382f7ac6aa3250b19e9d8a68c457fd769
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
