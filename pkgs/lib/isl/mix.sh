{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://repo.or.cz/isl.git/snapshot/3ea3e8b77475bea49b35b8215d8f66af94121b3c.tar.gz
2f462d0120bfc269b6c59ff67e737296
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/gmp/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1/16/mix.sh
{% endblock %}

{% block setup %}
export ac_cv_have_decl___builtin_ffs=yes
{% endblock %}

{% block env %}
export COFLAGS="--with-isl=${out} \${COFLAGS}"
{% endblock %}
