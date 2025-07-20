{% extends '//die/go/build.sh' %}

{% block pkg_name %}
superfile
{% endblock %}

{% block version %}
1.3.2
{% endblock %}

{% block go_url %}
https://github.com/yorukot/superfile/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2ac0dcb64aaa0ef032d979bacf3e1083322f526505ecd976820dee9b141f3aee
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
superfile
{% endblock %}
