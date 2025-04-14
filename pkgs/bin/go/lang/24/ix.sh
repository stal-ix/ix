{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.24.2
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
sha:aed36493f20f6701b2832ce12b8d531ab36785da2ffb68553badbcdf8212b116
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
