#!/usr/bin/env sh

set -ue

cat << EOF > ${XDG_RUNTIME_DIR}/dbus.cfg
<busconfig>
  <type>session</type>
  <keep_umask/>
  <standard_session_servicedirs/>

  <policy context="default">
    <allow send_destination="*" eavesdrop="true"/>
    <allow eavesdrop="true"/>
    <allow own="*"/>
  </policy>

  <listen>unix:path=${XDG_RUNTIME_DIR}/dbus.sock</listen>

  <limit name="max_incoming_bytes">1000000000</limit>
  <limit name="max_incoming_unix_fds">250000000</limit>
  <limit name="max_outgoing_bytes">1000000000</limit>
  <limit name="max_outgoing_unix_fds">250000000</limit>
  <limit name="max_message_size">1000000000</limit>
  <limit name="service_start_timeout">120000</limit>
  <limit name="auth_timeout">240000</limit>
  <limit name="pending_fd_timeout">150000</limit>
  <limit name="max_completed_connections">100000</limit>
  <limit name="max_incomplete_connections">10000</limit>
  <limit name="max_connections_per_user">100000</limit>
  <limit name="max_pending_service_starts">10000</limit>
  <limit name="max_names_per_connection">50000</limit>
  <limit name="max_match_rules_per_connection">50000</limit>
  <limit name="max_replies_per_connection">50000</limit>
</busconfig>
EOF

exec dbus-run-session --config-file ${XDG_RUNTIME_DIR}/dbus.cfg "${@}"
