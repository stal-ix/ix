{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v0.2.5.tar.gz
{% endblock %}

{% block cargo_sha %}
5eff3a8625641587967ddf771dfd13e8e2c24c5b158fa0721ddb9af69b062a0a
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
