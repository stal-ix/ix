{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
lapce
{% endblock %}

{% block version %}
0.4.6
{% endblock %}

{% block cargo_url %}
https://github.com/lapce/lapce/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
4b16152564e4dd679fbe4ce598425b0a24eab6a90814a57bc132bb0d8138c578
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/ssh/2
lib/git/2
lib/openssl
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
lib/tree/sitter/plugins
{% endblock %}

{% block cargo_bins %}
lapce
{% endblock %}

{% block cargo_tool %}
bld/rust/91
{% endblock %}
