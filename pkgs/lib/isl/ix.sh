{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://libisl.sourceforge.io/isl-0.24.tar.xz
sha:043105cc544f416b48736fff8caf077fb0663a717d06b1113f16e391ac99ebad
{% endblock %}

{% block lib_deps %}
lib/c
lib/gmp
{% endblock %}

{% block setup %}
export ac_cv_have_decl___builtin_ffs=yes
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-isl=${out} \${COFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/isl.pc
{% endblock %}
