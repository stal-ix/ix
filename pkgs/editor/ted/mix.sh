{% extends '//mix/template/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/0d363137ed88d7cd8267308671a1e69e04223629.zip
c244e526beb323d32e25b73d02b905b8
{% endblock %}

{% block bld_libs %}
pypi/pygments/mix.sh
lib/python/mix.sh
{% endblock %}

{% block entry_point %}ted{% endblock %}
