{% extends '//die/c/make.sh' %}

{% block version %}
0.6.23d
{% endblock %}

{% block pkg_name %}
empty
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/empty/empty/empty-{{self.version().strip()}}/empty-{{self.version().strip()}}.tgz
9ad495d52b942e3fd858643536d8d12e282568214300954d4518d8c22b893585
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
