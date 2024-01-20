{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v0.24.3.tar.gz
{% endblock %}

{% block cargo_sha %}
7afcfec4bccbf12be4cde9da7ae5993e7eef6ad7e31f26114bac3e1d12c8c04f
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/openssl
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/pkg/config
{% endblock %}

{% block setup %}
{{super()}}
export OPENSSL_NO_VENDOR=yes
{% endblock %}
