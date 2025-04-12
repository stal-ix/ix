{% extends '//die/python/bin.sh' %}

{% block version %}
2.1.3
{% endblock %}

{% block fetch %}
https://github.com/sivel/speedtest-cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:45e3ca21c3ce3c339646100de18db8a26a27d240c29f1c9e07b6c13995a969be
{% endblock %}

{% block bld_libs %}
lib/c
lib/python
{% endblock %}

{% block entry_point %}speedtest{% endblock %}

{% block unpack %}
{{super()}}
mv speedtest.py speedtest
{% endblock %}
