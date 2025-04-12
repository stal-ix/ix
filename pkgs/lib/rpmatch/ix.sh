{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.0
{% endblock %}

{% block fetch %}
https://github.com/pullmoll/musl-rpmatch/archive/refs/tags/v{{self.version().strip()}}.tar.gz
md5:8f5a5022fa66d94b7b0934618dfa6350
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
