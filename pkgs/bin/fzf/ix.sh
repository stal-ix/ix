{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fzf
{% endblock %}

{% block version %}
0.68.0
{% endblock %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
cc052a63e774bac1362becd42f0cfc14b8c93d6fc5785a52033cec3555f1ff1f
{% endblock %}

{% block go_bins %}
fzf
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
