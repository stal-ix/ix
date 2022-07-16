{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/jhawthorn/fzy/archive/refs/tags/1.0.tar.gz
sha:80257fd74579e13438b05edf50dcdc8cf0cdb1870b4a2bc5967bd1fdbed1facf
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
