{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
protobuf-c
{% endblock %}

{% block version %}
1.5.2
{% endblock %}

{% block fetch %}
https://github.com/protobuf-c/protobuf-c/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cea46eeaa19c52924938b582c5d128a6ed3b6fb5b3f4677476a1781cc06e03f3
{% endblock %}
