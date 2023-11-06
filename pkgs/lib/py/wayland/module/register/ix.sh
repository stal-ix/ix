{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/py/wayland
lib/py/wayland/module
lib/cffi/module/register
{% endblock %}

{% block premain_code %}
extern int PyImport_AppendInittab(const char* name, void* (*initfunc)(void));
extern void* PyInit__ffi(void);

__attribute__ ((__constructor__))
void register_cffi_pywayland(void) {
    PyImport_AppendInittab("_pywayland_ffi", PyInit__ffi);
}
{% endblock %}
