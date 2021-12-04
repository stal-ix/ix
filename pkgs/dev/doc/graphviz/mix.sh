{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/2.49.3/graphviz-2.49.3.tar.xz
9b92d271ced2648b9d68c8a32b6a42f9
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/gd/mix.sh
lib/expat/mix.sh
lib/freetype/mix.sh
lib/fontconfig/mix.sh
{% endblock %}

{% block touch_yl %}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin && ln -s dot_static dot
{% endblock %}
