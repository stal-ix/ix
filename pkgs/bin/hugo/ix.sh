{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hugo
{% endblock %}

{% block version %}
0.170.0
{% endblock %}

{% block go_url %}
https://github.com/gohugoio/hugo/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d9b10380627f559bdd3d1c4feb48b550dd9454d33337546fbfd1512ece08979e
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
