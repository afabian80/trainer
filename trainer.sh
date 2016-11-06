#!/bin/bash

export WORK_PULSE=135
export REST_PULSE=115

export ACTIVE_LENGTH=3
export PASSIVE_LENGTH=5
export REPETITION=5

export SETUP_LENGTH=1
export WARMUP_LENGTH=5
export COOLDOWN_LENGTH=2
export STRETCH_LENGTH=2
export MINUTE_MULTIPLIER=60 # use 1 for quick debugging

volume_down () {
    sleep 2
    open ~/Documents/Programming/AppleScript/deezer_volume_down.app
    sleep 1
}

volume_up () {
    open ~/Documents/Programming/AppleScript/deezer_volume_up.app
    sleep 2
}

trainer () {
    volume_down
    echo $1
    say -v Eszter $1
    volume_up
}

trainer "Szia, Petra vagyok, a te személyi edződ. Akkor kezdjük is meg. Remélem egy kis tornával már bemelegítettél és a pulzusmérő is rajtad van."

trainer "Pattanj a biciklire, indíts egy legalább $((WARMUP_LENGTH + REPETITION*(ACTIVE_LENGTH+PASSIVE_LENGTH) + COOLDOWN_LENGTH)) perces programot és állítsd kettes szintre."
sleep $((SETUP_LENGTH * MINUTE_MULTIPLIER))

trainer "$WARMUP_LENGTH perc bemelegítés alacsony intenzitáson."
sleep $((WARMUP_LENGTH * MINUTE_MULTIPLIER))

for i in `seq 1 $REPETITION`;
do
    trainer "Jön az aktív rész, $ACTIVE_LENGTH perc, a pulzusod legyen $WORK_PULSE körül."
    sleep $((ACTIVE_LENGTH * MINUTE_MULTIPLIER))

    trainer "És most a pihenő rész, $PASSIVE_LENGTH perc, a pulzusod legyen $REST_PULSE körül."
    sleep $((PASSIVE_LENGTH * MINUTE_MULTIPLIER))

    trainer "Ez volt $([[ "15" =~ $i ]] && echo "az" || echo "a") $i. széria."
done

trainer "És a végén $COOLDOWN_LENGTH perc levezetés."
sleep $((COOLDOWN_LENGTH * MINUTE_MULTIPLIER))

trainer "Zsírkiráálysáág. Ügyes vagy. Most pedig szállj le és nyújts egy picit."
sleep $((STRETCH_LENGTH * MINUTE_MULTIPLIER))

trainer "Ne felejtsd, holnap reggel torna, de utána reggel újra tekerés."
trainer "Irány a tus, szép napot!"
