{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fzf
{% endblock %}

{% block version %}
0.66.1
{% endblock %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c2e2391bbc9234c6a47368f38140ce6762427be933d624fb18a6d43484beb149
{% endblock %}

{% block go_bins %}
fzf
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
