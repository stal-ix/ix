{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/knik0/faad2/archive/refs/tags/2.11.0.tar.gz
sha:720c1dc404439e0a9117aa144dc7ead56f1658adf4badbb39f959d6ad8eed489
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
