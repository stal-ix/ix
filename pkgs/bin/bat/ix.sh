{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v0.24.0.tar.gz
{% endblock %}

{% block cargo_sha %}
9d2352d9054cbbcc5829ac8f0f778eb669b23a22c6a3554e46c2a67fb54a7c15
{% endblock %}

{% block bld_libs %}
lib/c
lib/git/2
lib/iconv
lib/oniguruma
{% endblock %}

{% block patch %}
{{super()}}
find vendored -type f -name build.rs | grep 'sys/' | while read l; do
    echo ${l}
    echo 'fn main() {}' > ${l}
done
find vendored -name .cargo-checksum.json -exec sed -i.uncheck -e 's/"files":{[^}]*}/"files":{ }/' '{}' '+'
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/bat ${out}/bin/
{% endblock %}
