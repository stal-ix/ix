{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/2.50.0/graphviz-2.50.0.tar.xz
sha:6b16bf990df114195be669773a1dae975dbbffada45e1de2849ddeb5851bb9a8
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gd
lib/expat
lib/freetype
lib/fontconfig
{% endblock %}

{% block touch_yl %}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
mv dot_static dot
rm *_static
{% endblock %}
