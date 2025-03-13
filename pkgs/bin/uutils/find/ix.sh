{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/uutils/findutils/archive/refs/tags/0.7.0.tar.gz
{% endblock %}

{% block cargo_sha %}
d387e3a3e0677362bde5a4c1bc15cc10c85942af66b12c57456cf91750f4a721
{% endblock %}

{% block bld_libs %}
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/find ${out}/bin/
cp ${tmp}/out/xargs ${out}/bin/
{% endblock %}
