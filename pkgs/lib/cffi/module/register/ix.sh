{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/cffi/module
{% endblock %}

{% block premain_code %}
extern int PyImport_AppendInittab(const char* name, void* (*initfunc)(void));
extern void* PyInit__cffi_backend(void);

__attribute__ ((__constructor__))
void register_cffi_backend(void) {
    PyImport_AppendInittab("_cffi_backend", PyInit__cffi_backend);
}
{% endblock %}
