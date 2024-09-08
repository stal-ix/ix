{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v2.6.2.tar.gz
sha:3aa2710f37ac286a83fa646b260742d1ad7d9024419946393392a5a604091b82
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
