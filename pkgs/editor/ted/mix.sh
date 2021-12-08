{% extends '//mix/template/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/a0aa84567efb7ac0760fde048dae0acf805fd188.zip
f4971b52c9cdaf0bdce0d97cf4e8d337
{% endblock %}

{% block bld_libs %}
pypi/pygments/mix.sh
lib/python/mix.sh
{% endblock %}

{% block entry_point %}ted{% endblock %}
