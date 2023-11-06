{% extends '//lib/cffi/xkbcommon/t/ix.sh' %}

{% block install %}
mkdir ${out}/lib
find . | grep _ffi.abi3 | while read l; do
    cp ${l} ${out}/lib/lib_cffi_xkbcommon.a
done
llvm-objcopy --redefine-sym PyInit__ffi=PyInit__xkbcommon_ffi ${out}/lib/lib_cffi_xkbcommon.a
{% endblock %}
