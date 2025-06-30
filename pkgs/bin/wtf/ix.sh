{% extends '//die/go/build.sh' %}

{% block pkg_name %}
wtf
{% endblock %}

{% block version %}
0.44.1
{% endblock %}

{% block go_url %}
https://github.com/wtfutil/wtf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
22b2b812fc4fbb9313a375cdf670c9883a779351303dcc736a1fad3589b6852f
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
