{% extends '//bin/go/t/ix.sh' %}

{% block fetch %}
https://golang.org/dl/go1.16.5.src.tar.gz
md5:f3c06704e536dcca1814b16dbcdc4a36
{% endblock %}

{% block bld_tool %}
{% block go_boot %}
bin/go/1/4
{% endblock %}
bld/tar
bld/perl
bld/python
{{super()}}
{% endblock %}

{% block setup_tools %}
cat << EOF > xcrun
#!$(which python3)
{% include 'xcrun.py' %}
EOF

chmod +x xcrun
{% endblock %}

{% block build %}
cp -R ${GOROOT_BOOTSTRAP} ${tmp}/boot

find ${tmp}/boot | while read l; do
    chmod +rwx ${l}
done

export GOROOT=${tmp}/boot
export GOROOT_BOOTSTRAP=${tmp}/boot

{{super()}}
{% endblock %}
