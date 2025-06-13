{% extends '//bin/bison/3/7/ix.sh' %}

{% block pkg_name %}
bison
{% endblock %}

{% block version %}
3.8.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-{{self.version().strip()}}.tar.lz
fdf98bfe82abb04a34d4356753f7748dbbd2ef1221b1f202852a2b5ce0f78534
{% endblock %}

{% block bison_bootstrap %}
bin/bison/3/8/0
{% endblock %}
