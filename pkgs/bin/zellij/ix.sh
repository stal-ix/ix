{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v0.39.2.tar.gz
{% endblock %}

{% block cargo_sha %}
c9762f0356a732f09ebb6eea6784c497039bc79d4badf05f53aa3e86ea860ecf
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block setup %}
{{super()}}
export OPENSSL_NO_VENDOR=yes
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp target/release/zellij ${out}/bin/
{% endblock %}
