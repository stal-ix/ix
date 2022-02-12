{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/releases/download/1.1.3/exfatprogs-1.1.3.tar.xz
sha:3dbd74b60eec18d2c68d57be4a872d7baa4f7d848e669e31159452ef5245b809
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}
