{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.4.2.tar.xz
sha:c4369b6d9a929cb9e206f0cd65c325e76bbd1e66d49da19da5e7bc0cb8e6841a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
