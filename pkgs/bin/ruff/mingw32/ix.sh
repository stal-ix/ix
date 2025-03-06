{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/mimalloc/1
lib/build/muldefs
lib/shim/dll(dll_name=ole32)
lib/shim/dll(dll_name=netapi32)
lib/shim/dll(dll_name=shell32)
lib/shim/fake(lib_name=unwind)
lib/shim/fake(lib_name=windows.0.52.0)
lib/shim/fake(lib_name=windows.0.48.5)
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

{% block sources %}
fakes.c
{% endblock %}
