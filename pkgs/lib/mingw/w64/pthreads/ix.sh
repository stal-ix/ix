{% extends '//lib/mingw/w64/t/ix.sh' %}

{% block lib_deps %}
lib/mingw/w64/headers
{% endblock %}

{% block unpack %}
{{super()}}
cd mingw-w64-libraries/winpthreads
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bin/binutils(for_target={{target.gnu.three}})
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|libext=lib|libext=a|' -i libtool
{% endblock %}

{% block install %}
{{super()}}
cp fakelib/libgcc.a ${out}/lib/libfake_gcc.a
{% endblock %}
