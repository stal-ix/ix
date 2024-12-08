{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v0.4.0.tar.gz
{% endblock %}

{% block cargo_sha %}
2e989f9420394392bca84d0db98dc922f8bb0a161939a9f04cd70c6b0b9cf169
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
cp ${tmp}/out/yazi ${out}/bin/
{% endblock %}
