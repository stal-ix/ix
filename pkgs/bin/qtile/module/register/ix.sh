{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
bin/qtile/py
bin/qtile/deps
bin/qtile/module
{% endblock %}

{% block premain_code %}
extern int PyImport_AppendInittab(const char* name, void* (*initfunc)(void));
extern void* PyInit__qtile_ffi(void);

__attribute__ ((__constructor__))
void register_cffi_qtile(void) {
    PyImport_AppendInittab("libqtile.backend.wayland._ffi", PyInit__qtile_ffi);
}
{% endblock %}
