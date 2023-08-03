{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://github.com/limine-bootloader/limine
{% endblock %}

{% block git_branch %}
v5.20230801.0
{% endblock %}

{% block git_sha %}
fd17e8a72b5ec79cc6bbff8fcb46dd5b55377b869e8311be2d5d2238c0691bd4
{% endblock %}

{% block git_refine_tools %}
bin/curl
{% endblock %}

{% block git_refine %}
sed -e 's|mkdir -p build-aux|exit 0|' -i bootstrap
sh ./bootstrap
find . -type d -name '.git' | while read l; do
    rm -rf ${l}
done
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block c_compiler %}
bld/compiler/unwrap
{% endblock %}

{% block functions %}
{{super()}}
setup_compiler() {
    export CC="clang -fuse-ld=lld"
    export CXX="clang++ -fuse-ld=lld"
}
setup_ar() (
:
)
{% endblock %}

{% block bld_tool %}
bin/nasm
bin/mtools
{% endblock %}

{% block configure_flags %}
--enable-all 
TOOLCHAIN_FOR_TARGET=llvm
{% endblock %}
