{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v0.24.3.tar.gz
{% endblock %}

{% block cargo_sha %}
7ec15f58c1ae42a465f8f554eb0475e6b94b195c89e31315550d77ef660bc7c3
{% endblock %}

{% block cargo_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/git/2
lib/openssl
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/gitui ${out}/bin/
{% endblock %}
