foo:
  reg.list:
    - add: val  
    - match: my/custom/event

  check.contains:
    - value:
       val: data

my/custom/event:
  check.event

myregister:
  file.save

shell_test:
  local.cmd:
    - tgt: '*'
    - func: cmd.run
    - arg:
      - echo "Thorium ran at $(date)" >> /tmp/thorium.log
    - require:
      - check: foo
      - check: my/custom/event
