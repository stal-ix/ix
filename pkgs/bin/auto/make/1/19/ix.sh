{% extends '//bin/auto/make/1/16/3/ix.sh' %}

{% block version %}
1.19
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-{{self.version().strip()}}.tar.xz
e3e2c2e3abf37898138db5b6c1d1dc35c9160c5978be7947d2c741705251d445
{% endblock %}
