{% extends '//lib/mingw/w64/t/ix.sh' %}

{% block bld_libs %}
lib/mingw/w64/pthreads
lib/mingw/w64/headers
{% endblock %}

{% block unpack %}
{{super()}}
cd mingw-w64-crt
{% endblock %}

{% block configure_flags %}
{{super()}}
{% if x86_64 %}
--disable-lib32
--enable-lib64
{% else %}
--disable-lib64
--enable-lib32
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
llvm-ar q libmingwcrt.a *.o
for x in atexit strtold; do
    llvm-objcopy --redefine-sym ${x}=${x}_1 libmsvcr120.a
    llvm-objcopy --redefine-sym ${x}=${x}_2 libmsvcr120_app.a
    llvm-objcopy --redefine-sym ${x}=${x}_3 libmsvcr120d.a
done
rm libmsvcr120d.a libvcruntime140_app.a
{% endblock %}
