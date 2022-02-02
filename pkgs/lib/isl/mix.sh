{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
#https://repo.or.cz/isl.git/snapshot/3ea3e8b77475bea49b35b8215d8f66af94121b3c.tar.gz
#2f462d0120bfc269b6c59ff67e737296
#http://isl.gforge.inria.fr/isl-0.18.tar.bz2
#sha:
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

{% block strip_pc %}
echo 'TODO(pg): check it properly'
{% endblock %}
