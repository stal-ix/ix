{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v2.6.1.tar.gz
sha:304c76a11703b525879c8423e3816c14f49e94d6e5b1839225245986400d3399
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
