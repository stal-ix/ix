{% extends '//bin/gperf/ix.sh' %}

{% block version %}
3.2.1
{% endblock %}

{% block fetch %}
http://ftp.gnu.org/pub/gnu/gperf/gperf-{{self.version().strip()}}.tar.gz
sha:ed5ad317858e0a9badbbada70df40194002e16e8834ac24491307c88f96f9702
{% endblock %}
