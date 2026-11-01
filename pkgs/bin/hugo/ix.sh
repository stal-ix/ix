{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hugo
{% endblock %}

{% block version %}
0.169.0
{% endblock %}

{% block go_url %}
https://github.com/gohugoio/hugo/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7c4aa7ae5682dcc58a5fd6893b54a850e64d24c04b1b426a1c7ad45b6ae5c81a
{% endblock %}

{% block go_refine %}
# internal/warpc/genwebp carries an empty go.mod to keep its C sources out
# of the main module; aux/go/v3 runs go mod tidy on every go.mod and an
# empty one has no module declaration. The directory holds no Go code.
find . -name go.mod -empty -delete
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_bins %}
hugo
{% endblock %}
