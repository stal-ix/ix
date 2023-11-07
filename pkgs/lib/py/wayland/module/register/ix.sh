{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/py/wayland/module
{% endblock %}

{% block premain_code %}
extern int PyImport_AppendInittab(const char* name, void* (*initfunc)(void));
extern void* PyInit__ffi(void);

__attribute__ ((__constructor__))
void register_cffi_pywayland(void) {
    PyImport_AppendInittab("pywayland._ffi", PyInit__ffi);
}
{% endblock %}
