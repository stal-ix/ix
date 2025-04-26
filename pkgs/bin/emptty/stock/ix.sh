{% extends '//die/go/build.sh' %}

{% block pkg_name %}
emptty
{% endblock %}

{% block version %}
0.14.0
{% endblock %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4bef5a0367a86c8e00bdd0c807e617d88caeea8f3ef589aff2f12c421cfadf14
{% endblock %}

{% block go_tags %}
nopam
noxlib
noutmp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp emptty ${out}/bin/
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
