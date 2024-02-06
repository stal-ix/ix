{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://libisl.sourceforge.io/isl-0.26.tar.xz
sha:a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504
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
