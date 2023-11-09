{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
bin/kitty/next/modules/fdt
{% endblock %}

{% block premain_code %}
extern int PyImport_AppendInittab(const char* name, void* (*initfunc)(void));
extern void* PyInit_fast_data_types(void);

__attribute__ ((__constructor__))
void register_fast_data_types(void) {
    PyImport_AppendInittab("kitty.fast_data_types", PyInit_fast_data_types);
}
{% endblock %}
