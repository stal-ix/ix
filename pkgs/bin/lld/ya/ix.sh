{% extends '//bin/lld/16/ix.sh' %}

{% block patches %}
ctors-in-init-array.patch
prefer-static.patch.raw
revert-25da87-fix-cuda10.patch
{% endblock %}

{% block patch %}
{{super()}}
cd lld
{% for x in ix.parse_list(self.patches()) %}
echo 'apply {{x}}'
base64 -d << EOF | patch -p1
{{ix.load_file('patches/' + x) | b64e}}
EOF
{% endfor %}
{% endblock %}
