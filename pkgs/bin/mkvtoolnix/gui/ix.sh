{% extends '//bin/mkvtoolnix/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/qt/6/deps
lib/qt/6/multimedia
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-gui
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/mkvtoolnix-gui bin/
rm -rf old
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|std::result_of|boost::result_of|' \
    -i src/common/sorting.h
{% endblock %}
