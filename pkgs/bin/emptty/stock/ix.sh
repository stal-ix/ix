{% extends '//die/go/build.sh' %}

{% block pkg_name %}
emptty
{% endblock %}

{% block version %}
0.15.0
{% endblock %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5d9f9cea797c200c41c49fcba36da09179f70c2cedbddbaa06ccf5290f3d11ec
{% endblock %}

{% block go_tags %}
nopam
noxlib
noutmp
{% endblock %}

{% block go_bins %}
emptty
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
