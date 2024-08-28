{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v0.3.2.tar.gz
{% endblock %}

{% block cargo_sha %}
5833661443e482ae852c49ffae3e3ebce1872b8fc6b53b9315aa22d772485903
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
