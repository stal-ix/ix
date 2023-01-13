{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ckormanyos/wide-integer/archive/8f65d9deaf580ccb3b8fa76ae261ee3bbbc5aa4d.zip
sha:9efb69fb0ad8b2695c935294b3f1fbd52cf0eb9602757b5e41c60cf040683856
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
