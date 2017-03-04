Install basic packages for Salt:
  pkg.installed:
    - pkgs:
      {% if grains['os'] == 'Ubuntu' %}
      - python-software-properties
      - python-pycurl
      - python-apt
      {% endif %}
