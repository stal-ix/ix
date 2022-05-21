{% extends '//die/cmake.sh' %}

{% block fetch %}
https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
sha:65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block patch %}
>opus_buildtype.cmake
{% endblock %}
