{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/py/wlroots/module
{% endblock %}

{% block premain_code %}
extern int PyImport_AppendInittab(const char* name, void* (*initfunc)(void));
extern void* PyInit__pywlroots_ffi(void);

__attribute__ ((__constructor__))
void register_cffi_pywlroots(void) {
    PyImport_AppendInittab("wlroots._ffi", PyInit__pywlroots_ffi);
}
{% endblock %}
