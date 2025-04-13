{% extends '//die/c/autohell.sh' %}

{% block version %}
2023.2
{% endblock %}

{% block fetch %}
https://www.x.org/releases/individual/proto/xorgproto-{{self.version().strip()}}.tar.xz
sha:b61fbc7db82b14ce2dc705ab590efc32b9ad800037113d1973811781d5118c2c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block postinstall %}
:
{% endblock %}
