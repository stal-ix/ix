{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/dandavison/delta/archive/refs/tags/0.18.1.tar.gz
{% endblock %}

{% block cargo_sha %}
ac263aad9108362372a67199649db644148ff57cee90474a4094a117dca91d09
{% endblock %}

{% block bld_libs %}
lib/git/2
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/delta ${out}/bin/
{% endblock %}
