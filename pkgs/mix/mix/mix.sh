{% extends '//mix/template/freeze.sh' %}

{% block fetch %}
https://github.com/pg83/mix/archive/{{mix_ver}}.zip
{{mix_md5}}
{% endblock %}

{% block bld_deps %}
lib/python/3/10/mix.sh
pypi/jinja2/mix.sh
pypi/beautysh/mix.sh
pypi/minio/mix.sh
{% endblock %}

{% block extra_modules %}
appdirs

pyparsing

packaging
packaging.version
packaging.specifiers
packaging.requirements

encodings.idna
encodings.ascii
encodings.unicode_escape
{% endblock %}

{% block more_modules %}
for m in core/*.py; do
    echo ${m} | sed -e 's|\.py||' | sed -e 's|/|.|'
done
{% endblock %}

{% block patch %}
cat - mix << EOF > mix_bin
__file__ = "${out}/bin/mix"
EOF

mv mix_bin mix
{% endblock %}

{% block entry_point %}mix{% endblock %}
{% block bin %}mix.bin{% endblock %}

{% block install %}
{{super()}}

cp -R pkgs ${out}/bin/
cd ${out}/bin && mv mix.bin mix
{% endblock %}
