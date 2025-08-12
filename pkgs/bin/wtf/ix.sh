{% extends '//die/go/build.sh' %}

{% block pkg_name %}
wtf
{% endblock %}

{% block version %}
0.46.0
{% endblock %}

{% block go_url %}
https://github.com/wtfutil/wtf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4ad0313ac6401bf2c687e27300d685261f726cff50d477a53d527d53d31815bc
{% endblock %}

{% block go_build_flags %}
-o wtfutil
{% endblock %}

{% block go_bins %}
wtfutil
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
