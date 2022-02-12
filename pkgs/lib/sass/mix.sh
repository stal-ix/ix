{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/sass/libsass/archive/refs/tags/3.6.5.tar.gz
c49765b9b3824dcd4a7423225ca28bad
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
