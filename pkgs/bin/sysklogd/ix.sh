{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v2.5.2.tar.gz
sha:f23950e671bf1c76ee06ce2cb7d343e644dd4d08e4ea4323f37644286dadd801
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
