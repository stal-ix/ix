{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/mix/archive/{{mix.flags.mix_ver}}.zip
# md5 {{mix.flags.mix_md5}}
{% endblock %}

{% block deps %}
# bld dev/lang/python3 dev/lang/python3/libs
# bld pypi/pygments pypi/jinja2 pypi/beautysh pypi/boto3
# bld dev/build/make tool/compress/upx env/std
{% endblock %}

{% block build %}
ls core/*.py | grep -v __ | sed -e 's|\.py||' | sed -e 's|\/|\.|' | sort | uniq > modules

cat << EOF >> modules
appdirs

pyparsing

packaging
packaging.version
packaging.specifiers
packaging.requirements

encodings.idna
encodings.unicode_escape
EOF

cat - mix << EOF > mix_bin
__file__ = "${out}/bin/mix"
EOF

python3 $(dirname $(which python3))/freeze/freeze.py -m ./mix_bin $(cat modules)
make CC=clang -j ${make_thrs}
strip ./mix_bin
upx ./mix_bin
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp -R pkgs ${out}/bin/
cp mix_bin ${out}/bin/mix
{% endblock %}
