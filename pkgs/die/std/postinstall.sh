# empty folders will be removed later
mkdir -p ${out}/share ${out}/doc ${out}/lib ${out}/include ${out}/bin

if test -d ${out}/man; then
    mv ${out}/man ${out}/share/
fi

for x in man doc info gtk-doc; do
    if test -d ${out}/share/${x}; then
        mv ${out}/share/${x} ${out}/doc/
    fi
done

{% if   aux %}
rm -rf ${out}/bin ${out}/libexec ${out}/lib ${out}/include ${out}/doc
{% elif lib %}
if test -f ${out}/bin/*-config; then
    mkdir -p ${out}/lib/bin
    mv ${out}/bin/*-config ${out}/lib/bin/
fi

if test -d ${out}/share/cmake; then
    mv ${out}/share/cmake ${out}/lib/
fi

# TODO(pg): fine-grained cherry-pick
mv ${out}/share ${out}/lib/aux

rm -rf ${out}/bin ${out}/libexec ${out}/etc
{% elif bin %}
rm -rf ${out}/lib ${out}/include

{% block strip_bin %}
{% if nostrip %}
echo 'skip strip'
{% else %}
find ${out}/bin/ -type f | while read l; do
    if test -h ${l}; then
        echo "skip symlink ${l}"
    else
        llvm-strip -S ${l} || true
    fi
done
{% endif %}
{% endblock %}
{% endif %}

{% if not lib %}
find ${out}/ -type f | grep '\.[ao]$' | while read l; do
    rm ${l}
done
{% endif %}

{% block strip_pc %}
warn_rm() {
    echo "BAD PKG ${1}, add strip_pc block if OK, or remove manually"
    exit 1
}

find ${out}/ -type f | grep '\.pc$' | while read l; do
    if grep '/bin' ${l}; then
{% if bin %}
        echo "STAY ${l}"; else warn_rm ${l}
{% else %}
        warn_rm ${l}; else echo "STAY ${l}"
{% endif %}
    fi
done

find ${out}/ -type f -name '*.pc' | while read l; do
    echo "apply fixes to ${l}"
    sed -e 's|.*Requires.*private.*||' \
        -e 's|.*Libs.*private.*||' \
        -i "${l}"
done
{% endblock %}

{% block purge_dynlib %}
(find ${out} -name '*.la'; find ${out} -name '*.so'; find ${out} -name '*.so.*') | sort | uniq | while read l; do
    rm ${l}
done
{% endblock %}

{% block purge_broken_links %}
find ${out} -xtype l -delete
find ${out} -xtype l -delete
find ${out} -xtype l -delete
{% endblock %}

{% block purge_empty_dirs %}
# fast GNU or slow POSIX
(find ${out} -type d -empty -delete) || (find ${out} -depth -type d -exec rmdir {} +) || true
{% endblock %}

{% if not doc %}
rm -rf ${out}/doc
{% endif %}
