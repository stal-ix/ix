{% extends '//die/go/build.sh' %}

{% block pkg_name %}
carapace-bin
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block go_url %}
https://github.com/carapace-sh/carapace-bin/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4267320f167138e764505e245d350c415502991b036f1bb57edb99ae15574346
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
