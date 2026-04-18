{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
088c4d3643fb994a31b2fef981ed6a1dde41139a026fec42e1d75890fb145316
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
