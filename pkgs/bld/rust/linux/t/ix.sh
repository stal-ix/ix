{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://static.rust-lang.org/dist/rust-1.80.0-x86_64-unknown-linux-musl.tar.gz
sha:16f0f4f2e01f613f7ee44787f64708623d8ef8c65ba37a12a682cd0ffea21fe8
{% endblock %}

{% block bld_tool %}
bld/musl
bin/patch/elf
{% endblock %}

{% block install %}
cat components | while read x; do
    cp -R ${x}/* ${out}/
done
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib/rustlib/x86_64-unknown-linux-musl/bin
find ${out} -type f -executable | while read l; do
    echo "patch ${l}"
    patchelf --set-interpreter ${LDSO} ${l} || true
done
{% endblock %}
