setup() {
    load '/usr/lib/bats/bats-support/load'
    load '/usr/lib/bats/bats-assert/load'

    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

@test "replace '/home/saad' with '~' when HOME is '/home/saad'" {
    HOME=/home/saad
    run capped_wd.sh '/home/saad'
    assert_output '~'
}

@test "replace '/home/saad/workspace' with '~/workspace' when HOME is '/home/saad'" {
    HOME=/home/saad
    run capped_wd.sh '/home/saad/workspace'
    assert_output '~/workspace'
}

@test "keep '/home/saad/workspace' when HOME is '/home/aahil'" {
    HOME=/home/aahil
    run capped_wd.sh '/home/saad/workspace'
    assert_output '/home/saad/workspace'
}

@test "keep '/bin/home/saad/workspace' when HOME is '/home/saad'" {
    HOME=/home/saad
    run capped_wd.sh '/bin/home/saad/workspace'
    assert_output '/bin/home/saad/workspace'
}


@test "replace '/home/saad/workspace/work/gproms/pse-results' with '~/../work/gproms/pse-results' when HOME is '/home/saad'" {
    HOME=/home/saad
    run capped_wd.sh '/home/saad/workspace/work/gproms/pse-results'
    assert_output '~/../work/gproms/pse-results'
}
