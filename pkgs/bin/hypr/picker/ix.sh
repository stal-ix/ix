{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/refs/tags/v0.3.0.tar.gz
sha:a443188ef7619be48c9992ea208121772b7e1da6662d672c650e30e159eeb891
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/xkb/common
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpicker ${out}/bin/
{% endblock %}
