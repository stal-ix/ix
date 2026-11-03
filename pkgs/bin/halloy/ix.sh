{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
halloy
{% endblock %}

{% block version %}
2026.9
{% endblock %}

{% block cargo_url %}
https://github.com/squidowl/halloy/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
a709be93a981f19face683eccb4148be999bd14db9c8b3b796a05017e6e181e4
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
lib/shim/fake(lib_name=dl)
lib/shim/fake(lib_name=xcb)
lib/shim/fake/symbol(symbol_name=xcb_connect)
lib/shim/fake/symbol(symbol_name=xcb_disconnect)
lib/shim/fake/symbol(symbol_name=xcb_connection_has_error)
lib/shim/fake/symbol(symbol_name=xcb_get_extension_data)
lib/shim/fake/symbol(symbol_name=xcb_get_setup)
lib/shim/fake/symbol(symbol_name=xcb_prefetch_extension_data)
lib/shim/fake/symbol(symbol_name=xcb_send_request64)
lib/shim/fake/symbol(symbol_name=xcb_wait_for_reply64)
{% endblock %}

{% block cargo_bins %}
halloy
{% endblock %}

{% block cargo_tool %}
bld/rust/96
{% endblock %}
