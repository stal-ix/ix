{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.netfilter.org/pub/libmnl/libmnl-1.0.4.tar.bz2
sha:171f89699f286a5854b72b91d06e8f8e3683064c5901fb09d954a9ab6f551f81
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}
