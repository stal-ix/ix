{% extends '//lib/py/wlroots/t/ix.sh' %}

{% block install %}
mkdir ${out}/lib
find . | grep _ffi.abi3 | while read l; do
    cp ${l} ${out}/lib/lib_cffi_pywlroots.a
done
llvm-objcopy --redefine-sym PyInit__ffi=PyInit__pywlroots_ffi ${out}/lib/lib_cffi_pywlroots.a
{% endblock %}
