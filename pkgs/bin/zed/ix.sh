{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/zed-industries/zed/archive/refs/tags/v0.123.2.tar.gz
{% endblock %}

{% block cargo_sha %}
0dfa74ee1a06d22879b078638cef6a4940c504c73247e47e729875859ae83184
{% endblock %}

{% block bld_libs %}
lib/z
lib/zstd
lib/curl
lib/alsa
lib/opengl
lib/openssl
lib/sqlite/3
lib/fontconfig
lib/xkb/common
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
