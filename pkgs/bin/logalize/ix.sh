{% extends '//die/go/build.sh' %}

{% block pkg_name %}
logalize
{% endblock %}

{% block version %}
0.6.1
{% endblock %}

{% block go_url %}
https://github.com/deponian/logalize/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1fd9d0a09bb48b9e3f762fe7ffcc25e7ed0e8827017bdf50594757e55876e5de
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
logalize
{% endblock %}
