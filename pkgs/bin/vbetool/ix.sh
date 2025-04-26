{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.2.2
{% endblock %}

{% block pkg_name %}
vbetool
{% endblock %}

{% block git_repo %}
git://people.freedesktop.org/~airlied/vbetool
{% endblock %}

{% block git_branch %}
vbetool-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
fd974e4e5e767b3c5ecc9a939b9438dcdc2ead47acfd0699fbd83e9d7fc2fd31
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/x86
lib/kernel
lib/pci/utils
lib/pci/access
{% endblock %}

{% block patch %}
sed -e 's|vbetool_LDADD = .*||' -i Makefile.am
(base64 -d | patch -p1) << EOF
{% include 'no_x86_check.patch/base64' %}
EOF
{% endblock %}
