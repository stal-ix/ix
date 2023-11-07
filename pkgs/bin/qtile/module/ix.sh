{% extends '//bin/qtile/t/ix.sh' %}

{% block install %}
mkdir ${out}/lib
find . | grep _ffi.abi3 | while read l; do
    cp ${l} ${out}/lib/lib_cffi_qtile.a
done
llvm-objcopy --redefine-sym PyInit__ffi=PyInit__qtile_ffi ${out}/lib/lib_cffi_qtile.a
{% endblock %}
