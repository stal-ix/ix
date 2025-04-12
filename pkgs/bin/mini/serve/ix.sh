{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
miniserve
{% endblock %}

{% block version %}
0.29.0
{% endblock %}

{% block cargo_url %}
https://github.com/svenstaro/miniserve/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
c0e2a6db26a4dfa0697efaae02db2dad26d8bf5db074992ac244dbb7ede7d412
{% endblock %}

{% block cargoc_ver %}
bld/cargo/83
{% endblock %}

{% block bld_libs %}
lib/zstd
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/miniserve ${out}/bin/
{% endblock %}
