{% extends '//die/go/build.sh' %}

{% block pkg_name %}
u-root
{% endblock %}

{% block version %}
0.16.0
{% endblock %}

{% block go_url %}
https://github.com/u-root/u-root/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e5061e6005ca0ac1ffab8304b4693d956225a0cbcb2cfbf080a140c7de8019ab
{% endblock %}

{% block go_refine %}
# cmd2pkg test fixtures are modules of their own whose replace-less
# pseudo-version requirements make go mod tidy shell out to git; aux/go/v3
# tidies every go.mod, so drop the fixtures.
rm -rf cmds/exp/cmd2pkg/test
{% endblock %}

{% block go_bins %}
u-root
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
