{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~emersion/basu/archive/v0.2.1.tar.gz
sha:43b327073d1ac7bc6cbc0d3dfff729348fc970dfff0551ad40e366332e990204
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
