{% extends '//lib/py/wayland/t/ix.sh' %}

{% block lib_deps %}
lib/wayland
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/cffi
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/pip
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv lib tmp
cd tmp
${NATIVE_PYTHON} ./pywayland/ffi_build.py
cd ..
mkdir lib
cp tmp/pywayland/_ffi.cpython* lib/lib_ffi_pywayland.a
rm -rf tmp
{% endblock %}
