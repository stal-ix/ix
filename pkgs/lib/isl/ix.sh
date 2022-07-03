{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://libisl.sourceforge.io/isl-0.25.tar.xz
sha:be7b210647ccadf90a2f0b000fca11a4d40546374a850db67adb32fad4b230d9
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
