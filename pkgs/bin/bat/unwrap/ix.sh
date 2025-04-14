{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bat
{% endblock %}

{% block version %}
0.25.0
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
0acc97b885c7fe9d00c63d6744f07353d72fc563c3772148fbb83f084a39a690
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
