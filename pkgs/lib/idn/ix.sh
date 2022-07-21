{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn-1.41.tar.gz
sha:884d706364b81abdd17bee9686d8ff2ae7431c5a14651047c68adf8b31fd8945
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libidn=${out} \${COFLAGS}"
{% endblock %}
