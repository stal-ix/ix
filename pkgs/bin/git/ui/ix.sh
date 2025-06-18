{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
gitui
{% endblock %}

{% block version %}
0.27.0
{% endblock %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
b8d1a421b4a43c264b94a9958a0fc540e37323f8edc75e9469598aa1e5268e60
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

{% block patch %}
{{super()}}
rust_remove_c vendored/libz-ng-sys
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
