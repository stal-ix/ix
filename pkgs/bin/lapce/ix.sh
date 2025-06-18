{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
lapce
{% endblock %}

{% block version %}
0.4.2
{% endblock %}

{% block cargo_url %}
https://github.com/lapce/lapce/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
60dd59e4c3c9bfe60f148683c9e21af1a5227949d3de36c4903fda36bba74e10
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

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/lapce ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
