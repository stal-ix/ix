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
{% endblock %}

{% block skip_auto_lib_env %}
:
{% endblock %}

{% block env %}
export LDFLAGS="-L${out}/lib -lmingwcrt -lmingw32 -lmingwex -lmingwthrd -lmsvcrt -lkernel32 \${LDFLAGS}"
{% endblock %}
