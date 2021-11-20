{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v2.6.1.tar.gz
9fe61625c105f911a2c89423f071ef1d
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}
