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
807bb867a23ad84d5328f30d43135bc24bc0ef934a5452a3a960bcc09fa46a47
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}

{% block bld_libs %}
lib/zstd
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/miniserve ${out}/bin/
{% endblock %}
