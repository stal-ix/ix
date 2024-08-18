{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v0.3.1.tar.gz
{% endblock %}

{% block cargo_sha %}
2b71bcab5aac4b702a3782037c68b0bdcfaeac8b7d9acf1fdb2861857c4ee181
{% endblock %}

{% block bld_libs %}
lib/oniguruma
{% endblock %}

{% block unpack %}
{{super()}}
cd yazi-fm
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/yazi ${out}/bin/
{% endblock %}
