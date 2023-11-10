{% extends '//bin/kitty/next/t/ix.sh' %}

{% block install %}
mkdir ${out}/lib
cp kitty/fast_data_types.so ${out}/lib/libfast_data_types.a
llvm-objcopy \
    --redefine-sym global_state=fdt_global_state \
    --redefine-sym encode_utf8=fdt_encode_utf8 \
    ${out}/lib/libfast_data_types.a
{% endblock %}
