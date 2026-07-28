{% extends '//die/go/build.sh' %}

{% block pkg_name %}
thingd
{% endblock %}

{% block version %}
13b058eac374ac9a9d6a9bdf8a40bd4f76ee83af
{% endblock %}

{% block go_url %}
https://github.com/pg83/thingd/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
33e23d6052f7d510e66da40405621539754722f6d85635822da66cd225f8e68c
{% endblock %}

{% block go_tags %}
noassets
noupgrade
{% endblock %}

{% block go_build_flags %}
{{super()}}
-trimpath
-ldflags '-w -buildid='
{% endblock %}

{% block go_bins %}
thingd
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block step_setup %}
{{super()}}
export CGO_ENABLED=0
{% endblock %}
