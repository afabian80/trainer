#!/bin/bash

export WORK_PULSE=135
export REST_PULSE=115

export ACTIVE_LENGTH=3
export PASSIVE_LENGTH=5
export REPETITION=5

export SETUP_LENGTH=1
export WARMUP_LENGTH=2
export COOLDOWN_LENGTH=2
export STRETCH_LENGTH=2
export MINUTE_MULTIPLIER=2 # use 1 for quick debugging

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

sleep_with_announcement () {
    for i in `seq 1 $1`;
    do
        echo "1 perc várakozás. ($i)"
        sleep $(($1 * MINUTE_MULTIPLIER))
        [[ $i -ne $1 ]] && trainer "Még $(($1 - $i)) perc."
    done
}

trainer "Szia, Petra vagyok, a te személyi edződ. Akkor kezdjük is meg. Remélem egy kis tornával már bemelegítettél és a pulzusmérő is rajtad van."

trainer "Pattanj a biciklire, indíts egy legalább $((WARMUP_LENGTH + REPETITION*(ACTIVE_LENGTH+PASSIVE_LENGTH) + COOLDOWN_LENGTH)) perces programot és állítsd kettes szintre."
sleep_with_announcement $SETUP_LENGTH

trainer "$WARMUP_LENGTH perc bemelegítés alacsony intenzitáson."
sleep_with_announcement $WARMUP_LENGTH

for i in `seq 1 $REPETITION`;
do
    trainer "Jön az aktív rész, $ACTIVE_LENGTH perc, a pulzusod legyen $WORK_PULSE körül."
    sleep_with_announcement $ACTIVE_LENGTH

    trainer "És most a pihenő rész, $PASSIVE_LENGTH perc, a pulzusod legyen $REST_PULSE körül."
    sleep_with_announcement $PASSIVE_LENGTH

    trainer "Ez volt $([[ "15" =~ $i ]] && echo "az" || echo "a") $i. széria."
done

trainer "És a végén $COOLDOWN_LENGTH perc levezetés."
sleep_with_announcement $COOLDOWN_LENGTH

trainer "Zsírkiráálysáág. Ügyes vagy. Most pedig szállj le és nyújts egy picit."
sleep_with_announcement $STRETCH_LENGTH

trainer "Ne felejtsd, holnap reggel torna, de utána reggel újra tekerés."
trainer "Irány a tus, szép napot!"
