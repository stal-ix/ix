{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/bsd
{% endblock %}

{% block env %}
export CPPFLAGS="-I${BSD_HEADERS} -DLIBBSD_OVERLAY=1 \${CPPFLAGS}"
export ac_cv_func_arc4random=yes
export ac_cv_func_getprogname=yes
export ac_cv_func_arc4random_buf=yes
export ac_cv_func_arc4random_uniform=yes
export ac_cv_func_arc4random_addrandom=yes
{% endblock %}
