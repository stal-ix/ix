{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/uutils/coreutils/archive/refs/tags/0.0.24.tar.gz
{% endblock %}

{% block cargo_sha %}
04bb8f70be540a285f66d054be5ce214ed71958285853bf4e4a9d02a82db15e0
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/iconv
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/coreutils ${out}/bin/
{% endblock %}
