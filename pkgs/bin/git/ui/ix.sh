{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v0.26.1.tar.gz
{% endblock %}

{% block cargo_sha %}
96255737c2134c4fb686fe85809063aa5b74ba4077807f791fdd5976c9fe4338
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/git/2
lib/openssl
lib/oniguruma
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/fakegit
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/gitui ${out}/bin/
{% endblock %}
