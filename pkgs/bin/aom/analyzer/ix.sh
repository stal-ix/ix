{% extends '//bin/aom/ix.sh' %}

{#
/home/pg/ix_root/build/dhFdC4FiNZYRD0GL/src/examples/analyzer.cc:74:33: error: member initializer 'decoder' does not name a non-static data member or base class
   74 |     : reader(NULL), info(NULL), decoder(NULL), show_padding(false), image(NULL),
      |                                 ^~~~~~~~~~~~~
/home/pg/ix_root/build/dhFdC4FiNZYRD0GL/src/examples/analyzer.cc:81:39: warning: declaration shadows a field of 'AV1Decoder' [-Wshadow]
   81 | bool AV1Decoder::open(const wxString &path) {
      |                                       ^
/home/pg/ix_root/build/dhFdC4FiNZYRD0GL/src/examples/analyzer.cc:38:12: note: previous declaration is here
   38 |   wxString path;

#}

{% block cmake_flags %}
CONFIG_ANALYZER=1
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/wx/widgets
{{super()}}
{% endblock %}
