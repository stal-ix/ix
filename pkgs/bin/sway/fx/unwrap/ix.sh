{% extends '//bin/sway/compositor/ix.sh' %}

{% block version %}
0.4
{% endblock %}

{% block fetch %}
https://github.com/WillPower3309/swayfx/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:fa164734a7b32fd82f31e54c407b147e92247ef275de9df4a87b6198a36f20e2
{% endblock %}

{% block bld_libs %}
lib/scene/fx
{{super()}}
{% endblock %}
