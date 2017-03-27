Install basic packages for Salt:
  pkg.installed:
    - pkgs:
      {% if grains['os'] == 'Ubuntu' %}
      - python3-software-properties
      - python3-pycurl
      - python3-apt
      {% endif %}
