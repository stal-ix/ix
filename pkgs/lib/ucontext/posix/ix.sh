{% extends '//lib/ucontext/stock/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/pkgconfig ${out}/include
llvm-objcopy \
    --preserve-dates \
    --redefine-sym "libucontext_makecontext=makecontext" \
    --redefine-sym "libucontext_swapcontext=swapcontext" \
    --redefine-sym "libucontext_setcontext=setcontext" \
    --redefine-sym "libucontext_getcontext=getcontext" \
    ${out}/lib/libucontext.a
{% endblock %}
