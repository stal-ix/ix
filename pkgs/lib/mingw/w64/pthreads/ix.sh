{% extends '//lib/mingw/w64/t/ix.sh' %}

{% block lib_deps %}
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
