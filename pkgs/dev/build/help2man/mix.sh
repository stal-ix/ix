{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/help2man/help2man-1.48.3.tar.xz
b51001b5d6c9fc929291d5ae8e6caafc
{% endblock %}

{% block run_deps %}
dev/lang/perl5/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/perl5/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}
