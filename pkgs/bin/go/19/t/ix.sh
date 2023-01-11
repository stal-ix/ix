{% extends '//bin/go/4/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.19.5.tar.gz
sha:1c24a6a2bf71d64d0ca8e228028d6108521f06b6edc7bf6b34ed6d767a795809
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_tool %}
bld/tar
bld/perl
bld/python
{{super()}}
{% endblock %}

{% block use_data %}
aux/ca-bundle
{% endblock %}

{% block setup_tools %}
cat << EOF > xcrun
#!$(which python3)
import sys
import subprocess

subprocess.check_call(sys.argv[1:])
EOF

chmod +x xcrun
{% endblock %}

{% block patch %}
{{super()}}
find . -type f -name '*.go' | while read l; do
    sed -e "s|/etc/.*/ca-bundle.crt|${CA_BUNDLE}|" -i ${l}
done
{% endblock %}

{% block build %}
cp -R ${GOROOT_BOOTSTRAP} ${tmp}/boot

find ${tmp}/boot | while read l; do
    chmod +rwx ${l}
done

export GOCACHE=${tmp}
export GOROOT=${tmp}/boot
export GOROOT_BOOTSTRAP=${tmp}/boot

{{super()}}
{% endblock %}
