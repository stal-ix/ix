{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cisco/openh264/archive/refs/tags/v2.3.1.tar.gz
sha:453afa66dacb560bc5fd0468aabee90c483741571bca820a39a1c07f0362dc32
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}
