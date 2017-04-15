###########################################################################
# There is a bug in the GlobaLeaks installer, that sets the wrong
# permissions in apparmor for the Tor server
# Careful: apparmor does not work by default with OpenVZ virtualization
###########################################################################
{% if not grains['virtual'] == 'openvzve' %}

Include local system_tor apparmor profile:
  file.managed:
    - name: /etc/apparmor.d/system_tor
    - source: salt://files/etc/apparmor.d/system_tor
    - user: root
    - group: root
    - makedirs: False

Correct Tor permissions in apparmor:
  file.managed:
    - name: /etc/apparmor.d/local/system_tor
    - source: salt://files/etc/apparmor.d/local/system_tor
    - user: root
    - group: root
    - makedirs: False

apparmor:
  service.running:
    - watch:
      - file: /etc/apparmor.d/local/system_tor

tor:
  service.running:
    - watch:
      - file: /etc/apparmor.d/local/system_tor
    - require:
      - apparmor

{% endif %}
