{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/zed-industries/zed/archive/refs/tags/v0.123.2.tar.gz
{% endblock %}

{% block cargo_sha %}
d71133e166c0bca8b5ba471609024c3b96a23a7867edc96c73143001cbec0036
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

{% block cargo_ver %}
v3
{% endblock %}
