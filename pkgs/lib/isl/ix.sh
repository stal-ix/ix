{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
isl
{% endblock %}

{% block version %}
0.27
{% endblock %}

{% block fetch %}
https://libisl.sourceforge.io/isl-{{self.version().strip()}}.tar.xz
6d8babb59e7b672e8cb7870e874f3f7b813b6e00e6af3f8b04f7579965643d5c
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
