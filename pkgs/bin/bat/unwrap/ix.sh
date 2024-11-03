{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v0.24.0.tar.gz
{% endblock %}

{% block cargo_sha %}
b293e75bda506764b3c85e468c7f25b339bcf15c52dc66db2cc53d41a7129d0f
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/iconv
lib/git/2
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bat ${out}/bin/
{% endblock %}
