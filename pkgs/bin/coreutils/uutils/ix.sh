{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/uutils/coreutils/archive/refs/tags/0.0.30.tar.gz
{% endblock %}

{% block cargo_sha %}
a2c5e3263eda10a8df24efa24de948ad668c82d36ff3a32585089d673acd32c3
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
cp ${tmp}/out/coreutils ${out}/bin/
set -xue
make list | tr ' ' '\n' | grep -v '^$' | sort | uniq | grep -v coreutils | while read l; do
    ln -s coreutils ${out}/bin/${l}
done
rm ${out}/bin/uptime
{% endblock %}
