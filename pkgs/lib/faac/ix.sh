{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/knik0/faac/archive/refs/tags/faac-1.31.tar.gz
sha:92894e3205ca7fbb0b0d38161ae94c9e884efe5af65886e5ad60eb1a318c78f1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
