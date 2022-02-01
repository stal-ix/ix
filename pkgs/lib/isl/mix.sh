{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://repo.or.cz/isl.git/snapshot/3ea3e8b77475bea49b35b8215d8f66af94121b3c.tar.gz
2f462d0120bfc269b6c59ff67e737296
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

{% block strip_pc %}
echo 'TODO(pg): check it properly'
{% endblock %}
