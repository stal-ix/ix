{% extends '//die/go/build.sh' %}

{% block pkg_name %}
git-lfs
{% endblock %}

{% block version %}
3.6.1
{% endblock %}

{% block go_url %}
https://github.com/git-lfs/git-lfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2a1f031b45960621119c571c4e82b2418567e7ebdd45514f6dded55e615312b3
{% endblock %}

{% block go_bins %}
git-lfs
{% endblock %}
