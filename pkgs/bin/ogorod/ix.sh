{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/ogorod/archive/ec846d0beb5a54296e6691a5a97ea3838f9e550b.tar.gz
{% endblock %}

{% block go_sha %}
1f963c2ab1b75581d2d0332afa919037cde2faf04a04e5197d2a3e49be3f54a3
{% endblock %}

{% block go_bins %}
ogorod
{% endblock %}
