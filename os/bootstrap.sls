Install python2:
  cmd.run:
    {% if grains['os'] == 'Ubuntu' %}
    - name: apt-get install python-all
    {% endif %}
