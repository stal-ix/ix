{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://static.rust-lang.org/dist/rust-1.75.0-x86_64-unknown-linux-musl.tar.gz
sha:cc6ef41aa811ab34f946fe2b4338d1107daf08642125fd566386bf45563597de
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
find ${out} -type f -executable | while read l; do
    echo "patch ${l}"
    patchelf --set-interpreter ${LDSO} ${l} || true
done
{% endblock %}
