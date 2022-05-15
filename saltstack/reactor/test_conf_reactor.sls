/etc/salt/test_files/test.conf:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - arg:
      - files.file_manager
