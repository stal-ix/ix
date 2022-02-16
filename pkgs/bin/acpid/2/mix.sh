{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/acpid2/acpid-2.0.33.tar.xz
sha:0856f71b3eb34a1b663d0a8e6363dfcbc519e63d847330498898658e2972dbe8
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}
