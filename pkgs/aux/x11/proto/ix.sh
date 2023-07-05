{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.x.org/releases/individual/proto/xorgproto-2023.2.tar.xz
sha:b61fbc7db82b14ce2dc705ab590efc32b9ad800037113d1973811781d5118c2c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block postinstall %}
:
{% endblock %}
