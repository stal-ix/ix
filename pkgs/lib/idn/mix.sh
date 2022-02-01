{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn-1.38.tar.gz
718ff3700dd71f830c592ebe97249193
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% if bin %}
lib/intl
{% endif %}
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libidn=${out} \${COFLAGS}"
{% endblock %}
