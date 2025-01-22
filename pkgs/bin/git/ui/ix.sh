{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v0.27.0.tar.gz
{% endblock %}

{% block cargo_sha %}
58ec4734de029cf31ada0cc9bb41fba20d294471f45ecce40bdbb8e58cd7bf5f
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/git/2
lib/openssl
lib/oniguruma
lib/z/ng/native
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/make
bld/cmake
bld/fakegit
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/gitui ${out}/bin/
{% endblock %}

{% block rustc_ver %}
83
{% endblock %}
