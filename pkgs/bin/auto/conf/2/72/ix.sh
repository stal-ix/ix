{% extends '//bin/auto/conf/2/71/ix.sh' %}

{% block version %}
2.72
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/autoconf/autoconf-{{self.version().strip()}}.tar.xz
sha:ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a
{% endblock %}
