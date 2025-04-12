{% extends '//bin/auto/make/1/16/3/ix.sh' %}

{% block version %}
1.17
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-{{self.version().strip()}}.tar.xz
sha:8920c1fc411e13b90bf704ef9db6f29d540e76d232cb3b2c9f4dc4cc599bd990
{% endblock %}
