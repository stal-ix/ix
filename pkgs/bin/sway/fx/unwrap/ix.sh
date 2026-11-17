{% extends '//bin/sway/compositor/ix.sh' %}

{% block pkg_name %}
swayfx
{% endblock %}

{% block version %}
0.6.1
{% endblock %}

{% block fetch %}
https://github.com/WillPower3309/swayfx/archive/refs/tags/{{self.version().strip()}}.tar.gz
7afe1e29a3508d3ab724d5ef029df48fcbf770c4af48c294e3051571aa835dcb
{% endblock %}

{% block bld_libs %}
lib/scene/fx
{{super()}}
{% endblock %}
