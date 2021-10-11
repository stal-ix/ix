{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz
# md5 852bd691d8abc75b52053465846fba34
{% endblock %}

{% block deps %}
# bld dev/build/make env/std
{% endblock %}

{% block env %}
export LDFLAGS="-L${out}/lib -lucl \${LDFLAGS}"
{% endblock %}
