{% extends '//die/go/build.sh' %}

{% block pkg_name %}
circumflex
{% endblock %}

{% block version %}
3.9
{% endblock %}

{% block go_url %}
https://github.com/bensadeh/circumflex/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2046184a714853ae7733060f1c2b5669788c11b33a134f9e75a552335236b123
{% endblock %}

{% block go_bins %}
clx
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
