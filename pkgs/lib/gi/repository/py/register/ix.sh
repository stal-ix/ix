{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/python
lib/gi/repository/py
{% endblock %}

{% block premain_code %}
extern int PyImport_AppendInittab(const char* name, void* (*initfunc)(void));
extern void* PyInit__giscanner(void);

__attribute__ ((__constructor__))
void register_giscanner(void) {
    PyImport_AppendInittab("_giscanner", PyInit__giscanner);
}
{% endblock %}
