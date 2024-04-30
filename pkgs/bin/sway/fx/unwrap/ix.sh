{% extends '//bin/sway/compositor/ix.sh' %}

{% block fetch %}
https://github.com/WillPower3309/swayfx/archive/refs/tags/0.4.tar.gz
sha:fa164734a7b32fd82f31e54c407b147e92247ef275de9df4a87b6198a36f20e2
{% endblock %}

{% block bld_libs %}
lib/scene/fx
{{super()}}
{% endblock %}
