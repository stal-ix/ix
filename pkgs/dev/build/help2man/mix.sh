{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://mirror.tochlab.net/pub/gnu/help2man/help2man-1.48.3.tar.xz
# md5 b51001b5d6c9fc929291d5ae8e6caafc
{% endblock %}

{% block lib_deps %}
dev/lang/perl5/mix.sh
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}
