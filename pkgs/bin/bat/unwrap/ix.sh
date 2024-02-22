{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v0.24.0.tar.gz
{% endblock %}

{% block cargo_sha %}
d09552c369cf1c5ecbaee7b08c396670949fadf3ae1514ffb9d08758182c8364
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
cp ${tmp}/release/bat ${out}/bin/
{% endblock %}
