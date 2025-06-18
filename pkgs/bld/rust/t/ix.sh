{% extends '//die/std/ix.sh' %}

{% block bld_tool %}
bld/musl
bin/patch/elf
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
find ${src} -type f -name '*.gz' | sort | while read l; do
    mkdir src
    cd src
    extract 1 ${l}
    cat components | while read x; do
        cp -R ${x}/* ${out}/
    done
    cd ..
    rm -rf src
done
{% endblock %}

{% block postinstall %}
rm -rf ${out}/share
rm -rf ${out}/lib/rustlib/x86_64-unknown-linux-musl/bin
rm -rf ${out}/lib/rustlib/aarch64-unknown-linux-musl/bin
find ${out} -type f -executable | while read l; do
    echo "patch ${l}"
    patchelf --set-interpreter ${LDSO} ${l} || true
done
{% endblock %}

{% block env %}
export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:${out}/lib
{% endblock %}
