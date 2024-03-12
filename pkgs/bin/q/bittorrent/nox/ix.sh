{% extends '//bin/q/bittorrent/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/qt/6/base/nogui
{% endblock %}

{% block cmake_flags %}
GUI=OFF
{{super()}}
{% endblock %}
