{% extends '//lib/cffi/t/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mkdir lib
mv cffi*/_cffi_backend.*.so lib/lib_cffi_backend.a
rm -rf cffi*
{% endblock %}
