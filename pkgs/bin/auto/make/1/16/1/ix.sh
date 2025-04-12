{% extends '//bin/auto/make/1/16/3/ix.sh' %}

{% block pkg_name %}
automake
{% endblock %}

{% block version %}
1.16.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-{{self.version().strip()}}.tar.xz
sha:5d05bb38a23fd3312b10aea93840feec685bdf4a41146e78882848165d3ae921
{% endblock %}
