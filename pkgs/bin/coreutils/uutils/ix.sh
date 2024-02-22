{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/uutils/coreutils/archive/refs/tags/0.0.24.tar.gz
{% endblock %}

{% block cargo_sha %}
da976e18fc9df9de52d3b4eecab31e8e1438bdbcff295e5934492e488c94fbaa
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
