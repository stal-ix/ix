{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/rrthomas/libpaper/releases/download/v2.1.3/libpaper-2.1.3.tar.gz
sha:b798be7c52036e684a90a68f0be954f173fea87886f8a1d25c6514a279216f4a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
