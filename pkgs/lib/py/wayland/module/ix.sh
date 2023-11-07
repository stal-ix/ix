{% extends '//lib/py/wayland/t/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv lib tmp
mkdir lib
mv tmp/pywayland/_ffi.* lib/lib_cffi_wayland.a
rm -rf tmp
{% endblock %}
