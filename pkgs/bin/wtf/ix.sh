{% extends '//die/go/build.sh' %}

{% block pkg_name %}
wtf
{% endblock %}

{% block version %}
0.51.0
{% endblock %}

{% block go_url %}
https://github.com/wtfutil/wtf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d3204a9ed5826b676f3c462b5710425f7ea7a55d488bdfcbd38ad6f35824d36f
{% endblock %}

{% block go_build_flags %}
-o wtfutil
{% endblock %}

{% block go_bins %}
wtfutil
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
