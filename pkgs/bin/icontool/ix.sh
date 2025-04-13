{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.1.0
{% endblock %}

{% block fetch %}
https://launchpad.net/icontool/trunk/0.1/+download/icontool-{{self.version().strip()}}.tar.gz
sha:a844a7fd225e4cec54ea544a7a3c50deb8d01e2b57fe38f673c49de2379edc48
{% endblock %}

{% block bld_tool %}
bld/perl/full
{% endblock %}
