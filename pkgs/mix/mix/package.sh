{% extends '//mix/template/freeze.sh' %}

{% block fetch %}
# url https://github.com/pg83/mix/archive/{{mix.flags.mix_ver}}.zip
# md5 {{mix.flags.mix_md5}}
{% endblock %}

{% block deps %}
# bld dev/lang/python/3/10 pypi/jinja2 pypi/beautysh pypi/minio
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

{% block postinstall %}
cp -R pkgs ${out}/bin/
cd ${out}/bin && mv mix.bin mix
{% endblock %}
