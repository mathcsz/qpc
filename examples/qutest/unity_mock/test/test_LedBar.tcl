# QUTEST test script corresponding to the test_LedBar.c test fixture.
# see https://www.state-machine.com/qtools/qutest.html

# preamble...


# tests...

test "LedBar 0% all off"
command 0 0
expect "@timestamp LED_MOD Led_off 0"
expect "@timestamp LED_MOD Led_off 1"
expect "@timestamp LED_MOD Led_off 2"
expect "@timestamp LED_MOD Led_off 3"
expect "@timestamp LED_MOD Led_off 4"
expect "@timestamp USER+000 LedBar_setPercent 0 0"
expect "@timestamp Trg-Done QS_RX_COMMAND"

test "LedBar 100% all on" -noreset
command 0 100
expect "@timestamp LED_MOD Led_on 10 0"
expect "@timestamp LED_MOD Led_on 20 1"
expect "@timestamp LED_MOD Led_on 10 2"
expect "@timestamp LED_MOD Led_on 20 3"
expect "@timestamp LED_MOD Led_on 10 4"
expect "@timestamp USER+000 LedBar_setPercent 70 100"
expect "@timestamp Trg-Done QS_RX_COMMAND"

test "LedBar 19% all off" -noreset
command 0 19
expect "@timestamp LED_MOD Led_off 0"
expect "@timestamp LED_MOD Led_off 1"
expect "@timestamp LED_MOD Led_off 2"
expect "@timestamp LED_MOD Led_off 3"
expect "@timestamp LED_MOD Led_off 4"
expect "@timestamp USER+000 LedBar_setPercent 0 19"
expect "@timestamp Trg-Done QS_RX_COMMAND"

test "LedBar 20% one on" -noreset
command 0 20
expect "@timestamp LED_MOD Led_on 10 0"
expect "@timestamp LED_MOD Led_off 1"
expect "@timestamp LED_MOD Led_off 2"
expect "@timestamp LED_MOD Led_off 3"
expect "@timestamp LED_MOD Led_off 4"
expect "@timestamp USER+000 LedBar_setPercent 10 20"
expect "@timestamp Trg-Done QS_RX_COMMAND"

test "LedBar 50% two on" -noreset
current_obj AP led_power
poke 0 4 [binary format ii 25 15]
command 0 50
expect "@timestamp LED_MOD Led_on 25 0"
expect "@timestamp LED_MOD Led_on 15 1"
expect "@timestamp LED_MOD Led_off 2"
expect "@timestamp LED_MOD Led_off 3"
expect "@timestamp LED_MOD Led_off 4"
expect "@timestamp USER+000 LedBar_setPercent 40 50"
expect "@timestamp Trg-Done QS_RX_COMMAND"

test "LedBar 99% four on" -noreset
probe Led_on 17
probe Led_on 13
command 0 99
expect "@timestamp TstProbe Fun=Led_on,Data=17"
expect "@timestamp LED_MOD Led_on 17 0"
expect "@timestamp TstProbe Fun=Led_on,Data=13"
expect "@timestamp LED_MOD Led_on 13 1"
expect "@timestamp LED_MOD Led_on 10 2"
expect "@timestamp LED_MOD Led_on 20 3"
expect "@timestamp LED_MOD Led_off 4"
expect "@timestamp USER+000 LedBar_setPercent 60 99"
expect "@timestamp Trg-Done QS_RX_COMMAND"

# the end
end

