{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sniffnet
{% endblock %}

{% block version %}
1.6.0
{% endblock %}

{% block cargo_url %}
https://github.com/GyulyVGC/sniffnet/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
f36c6b3573f01e0bf2558991aebf11b6dc28a7696b7e237daeb3c7a8e60ea428
{% endblock %}

{% block configure %}
{{super()}}
patch -p1 <<'EOF'
--- a/src/gui/pages/overview_page.rs
+++ b/src/gui/pages/overview_page.rs
@@ -411,7 +411,7 @@
     let info: Element<Message, StyleType> = if exporters.len() == 1 {
         Text::new(format!(
             "   {}",
-            exporters.iter().next().map_or_default(ToString::to_string)
+            exporters.iter().next().map_or_else(Default::default, ToString::to_string)
         ))
         .into()
     } else {
--- a/src/notifications/notify_and_log.rs
+++ b/src/notifications/notify_and_log.rs
@@ -117,7 +117,7 @@
             let address_to_lookup = &get_address_to_lookup(k, v.traffic_direction);
             let host = addresses_resolved
                 .get(address_to_lookup)
-                .map_or_default(|(_, h)| h.clone());
+                .map_or_else(Default::default, |(_, h)| h.clone());
             let mut data_info_host = info_traffic_msg
                 .hosts
                 .get(&host)
EOF
{% endblock %}

{% block bld_libs %}
lib/alsa
lib/pcap
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}

{% block cargo_bins %}
sniffnet
{% endblock %}

{% block cargo_tool %}
bld/rust/96
{% endblock %}
