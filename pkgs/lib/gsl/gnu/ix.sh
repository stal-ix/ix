{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gsl
{% endblock %}

{% block version %}
2.8
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gsl/gsl-{{self.version().strip()}}.tar.gz
sha:6a99eeed15632c6354895b1dd542ed5a855c0f15d9ad1326c6fe2b2c9e423190
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
