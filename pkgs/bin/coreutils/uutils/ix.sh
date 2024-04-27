{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/uutils/coreutils/archive/refs/tags/0.0.26.tar.gz
{% endblock %}

{% block cargo_sha %}
61dcce22d872dee59aa6d28f47bfa377d0dd72f4a39db5e6d8e927e2ff9b604e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/iconv
lib/oniguruma
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block cargo_features %}
feat_os_unix_musl
{% endblock %}

{% block patch %}
{# tabs!!! #}
cat << EOF >> GNUmakefile
list:
	echo \$(INSTALLEES)
EOF
make list
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/coreutils ${out}/bin/
set -xue
make list | tr ' ' '\n' | grep -v '^$' | sort | uniq | grep -v coreutils | while read l; do
    ln -s coreutils ${out}/bin/${l}
done
{% endblock %}
