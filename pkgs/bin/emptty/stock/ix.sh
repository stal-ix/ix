{% extends '//die/go/c.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block bld_tool %}
bin/emptty/src
{% endblock %}

{% block go_tags %}
nopam
noxlib
noutmp
{% endblock %}

{% block go_build_flags %}
-mod=readonly
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp emptty ${out}/bin/
{% endblock %}
