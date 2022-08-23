{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/releases/download/v4.6.2/ccache-4.6.2.tar.xz
sha:789a2435d7fde2eaef5ec7b3ecf2366e546f764253e9999fdf008d2dd7f3b10c
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/hiredis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
