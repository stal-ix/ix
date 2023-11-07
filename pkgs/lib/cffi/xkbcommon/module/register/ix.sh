{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/cffi/xkbcommon/module
{% endblock %}

{% block premain_code %}
extern int PyImport_AppendInittab(const char* name, void* (*initfunc)(void));
extern void* PyInit__xkbcommon_ffi(void);

__attribute__ ((__constructor__))
void register_cffi_xkbcommon(void) {
    PyImport_AppendInittab("xkbcommon._ffi", PyInit__xkbcommon_ffi);
}
{% endblock %}
