{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazygit
{% endblock %}

{% block version %}
0.65.1
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
95908e0e9dfde0060454a3ff7920c6897772897c19aa5a069f1b180552df1335
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_bins %}
lazygit
{% endblock %}
