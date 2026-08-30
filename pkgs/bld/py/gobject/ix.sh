{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
PyGObject
{% endblock %}

{% block version %}
3.50.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/pygobject/archive/refs/tags/{{self.version().strip()}}.tar.gz
9029636c6ba1c66735a46315348bb478450893f8cd508c7d82f7148fd899e276
{% endblock %}

{% block lib_deps %}
lib/c
lib/ffi
lib/glib
lib/glib/dl
lib/gi/repository/core
lib/gi/repository/bootstrap/dl
lib/gi/repository/bootstrap/shim
lib/python/3/13
{% endblock %}

{% block bld_tool %}
bld/python/13
bld/pip/scripts
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_flags %}
{{super()}}
python=${NATIVE_PYTHON}
pycairo=disabled
tests=false
{% endblock %}

{% block install %}
{{super()}}

site_packages=${out}/share/python3.13/site-packages
mkdir -p ${out}/lib
mv ${site_packages}/gi/_gi*.so ${out}/lib/libpygobject.a

cat << EOF > reg.c
extern int PyImport_AppendInittab(const char*, void* (*)(void));
extern void* PyInit__gi(void);

__attribute__ ((__constructor__))
void register_pygobject(void) {
    PyImport_AppendInittab("gi._gi", PyInit__gi);
}
EOF
cc -c -o ${out}/lib/reg.o reg.c

cd ${site_packages}
py_exports > exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/share/python3.13/site-packages:\${PYTHONPATH}"
export CTRFLAGS="${out}/lib/reg.o \${CTRFLAGS}"
{% endblock %}

{% block postinstall %}
test -f ${out}/lib/libpygobject.a
test -f ${out}/lib/reg.o
{% endblock %}
