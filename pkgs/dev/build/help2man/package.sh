{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://mirror.tochlab.net/pub/gnu/help2man/help2man-1.48.3.tar.xz
# md5 b51001b5d6c9fc929291d5ae8e6caafc
{% endblock %}

{% block deps %}
# lib dev/lang/perl5/package.sh
# bld dev/build/make/package.sh
# bld env/std/package.sh
{% endblock %}
