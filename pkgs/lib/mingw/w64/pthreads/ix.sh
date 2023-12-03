{% extends '//lib/mingw/w64/t/ix.sh' %}

{% block bld_libs %}
lib/mingw/w64/headers
{% endblock %}

{% block unpack %}
{{super()}}
cd mingw-w64-libraries/winpthreads
{% endblock %}

{% block install %}
{{super()}}
cp fakelib/libgcc.a ${out}/lib/libfake_gcc.a
{% endblock %}

{% block env %}
export CPPFLAGS="-isystem${out}/include \${CPPFLAGS}"
{% endblock %}
