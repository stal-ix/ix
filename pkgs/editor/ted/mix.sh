{% extends '//mix/template/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/dcac5515dcc337f8652fddf0fae125d3262346c9.zip
911d71b3f33bc1b27aa3dfbe76756de2
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/python/mix.sh
pypi/pygments/mix.sh
{% endblock %}

{% block entry_point %}ted{% endblock %}
