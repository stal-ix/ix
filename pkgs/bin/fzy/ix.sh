{% extends '//die/c/make.sh' %}

{% block pkg_name %}
fzy
{% endblock %}

{% block version %}
1.0
{% endblock %}

{% block fetch %}
https://github.com/jhawthorn/fzy/archive/refs/tags/{{self.version().strip()}}.tar.gz
80257fd74579e13438b05edf50dcdc8cf0cdb1870b4a2bc5967bd1fdbed1facf
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
