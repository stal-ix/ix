{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
0.0.30
{% endblock %}

{% block cargo_url %}
https://github.com/uutils/coreutils/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
94f7c4d5eeea76da0e00c1c48c0ab0e0619108429648261efd55f95d4d25eda3
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

{% block makefile %}
list:
    echo \$(INSTALLEES)
{% endblock %}

{% block patch %}
cat << EOF >> GNUmakefile
{{self.makefile().replace('    ', '\t')}}
EOF
make list
{% endblock %}

{% block install %}
set -xue
mkdir ${out}/bin
cp ${tmp}/out/coreutils ${out}/bin/
make list | tr ' ' '\n' | grep -v '^$' | sort | uniq | grep -v coreutils | while read l; do
    ln -s coreutils ${out}/bin/${l}
done
rm ${out}/bin/uptime
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
