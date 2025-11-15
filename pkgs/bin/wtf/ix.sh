{% extends '//die/go/build.sh' %}

{% block pkg_name %}
wtf
{% endblock %}

{% block version %}
0.47.0
{% endblock %}

{% block go_url %}
https://github.com/wtfutil/wtf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9cfa0c25a8cfecda764e1287062255bc9477041d0525c5407a615e7b7816439f
{% endblock %}

{% block go_build_flags %}
-o wtfutil
{% endblock %}

{% block go_bins %}
wtfutil
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
