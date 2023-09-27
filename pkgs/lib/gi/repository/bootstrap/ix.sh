{% extends '//lib/gi/repository/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/fake/er(tool_name=g-ir-scanner)
{% endblock %}

{% block meson_flags %}
{{super()}}
gi_cross_use_prebuilt_gi=true
gi_cross_binary_wrapper=g-ir-scanner
{% endblock %}

{% block build %}
{{super()}}
>${tmp}/obj/gir/GLib-2.0.gir
>${tmp}/obj/gir/GObject-2.0.gir
>${tmp}/obj/gir/GModule-2.0.gir
>${tmp}/obj/gir/Gio-2.0.gir
>${tmp}/obj/gir/GIRepository-2.0.gir
{% endblock %}
