{% extends '//die/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~emersion/basu/archive/v0.2.0.tar.gz
sha:673006f9ded754963249024b30319d7179665fde5a685d4b3b1a98d1a209a951
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/gperf
{% endblock %}

{% block c_rename_symbol %}
parse_boolean
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include
ln -s basu systemd
{% endblock %}
