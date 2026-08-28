{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
isl
{% endblock %}

{% block version %}
0.28
{% endblock %}

{% block fetch %}
https://libisl.sourceforge.io/isl-{{self.version().strip()}}.tar.xz
3dc31b8e1b18329e42d5dfbf84dd55e15c59b61569a2ab246f61497d9592f727
{% endblock %}

{% block lib_deps %}
lib/c
lib/gmp
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block setup_target_flags %}
export ac_cv_have_decl___builtin_ffs=yes
{% endblock %}

{% block env %}
export COFLAGS="--with-isl=${out} \${COFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/isl.pc
{% endblock %}
