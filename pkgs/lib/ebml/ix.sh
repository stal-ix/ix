{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Matroska-Org/libebml/archive/refs/tags/release-1.4.4.tar.gz
sha:3b30d89a5699fef4bdf5b4d7de7a1c94d9be47fababf9caca59250282f051283
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
