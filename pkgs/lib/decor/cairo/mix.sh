{% extends '//lib/decor/t/mix.sh' %}

{% block install %}
{{super()}}

cd ${out}

mv lib old
mkdir lib
mv old/libdecor/plugins-1/libdecor-cairo.a lib/
rm -rf old

cd lib

llvm-objcopy --globalize-symbol=libdecor_plugin_new *.a
llvm-objcopy --redefine-sym=libdecor_plugin_new=libdecor_fallback_plugin_new *.a
{% endblock %}
