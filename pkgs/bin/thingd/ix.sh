{% extends '//die/go/build.sh' %}

{% block pkg_name %}
thingd
{% endblock %}

{% block version %}
70d8c2424ade4c328da74ba9278158354feb6ef6
{% endblock %}

{% block go_url %}
https://github.com/pg83/thingd/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
19ff58208efdb0217a5ce6130f59a6669b57c2eae842173895a87914018cbfa0
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
