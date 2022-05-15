/etc/salt/test_files/test.conf:
  file.managed:
    - source:
      - salt://files/test.conf
    - makedirs: True

/etc/salt/minion.d/beacons.conf:
  file.managed:
    - source:
      - salt://files/beacons.conf
    - makedirs: True

