{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz
# md5 852bd691d8abc75b52053465846fba34
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}
