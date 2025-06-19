{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
halloy
{% endblock %}

{% block version %}
2025.6
{% endblock %}

{% block cargo_url %}
https://github.com/squidowl/halloy/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
1b1076318b8f10a22f683dc24b65da35ba8330b98747a18ed30d4a851d166c51
{% endblock %}

{% block bld_libs %}
lib/z
lib/xz
lib/zstd
lib/alsa
lib/opengl
lib/openssl
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}

{% block cargo_bins %}
halloy
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
