{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/releases/download/v4.6.3/ccache-4.6.3.tar.xz
sha:1e3a251bb112632553b8255a78661fe526c3a16598496d51128c32b218fd8b22
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/hiredis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
