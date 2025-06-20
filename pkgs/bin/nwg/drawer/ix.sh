{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nwg-drawer
{% endblock %}

{% block version %}
0.6.1
{% endblock %}

{# hard x11 deps #}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4e893ac3a232290e65c19d48e0f265827e91375f2e39a82d78e131304a0fe968
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block bld_libs %}
lib/atk
lib/glib
lib/gtk/3
lib/gi/repository
lib/gtk/layer/shell/3
{% endblock %}

{% block go_bins %}
nwg-drawer
{% endblock %}
