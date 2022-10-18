{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/releases/download/v4.7/ccache-4.7.tar.xz
sha:d9283bbe22085268f52d309b91adb81a77a7abe10867eb6852057910ffac736a
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/hiredis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
