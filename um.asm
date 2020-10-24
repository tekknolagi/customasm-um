#bits 32

#subruledef register {
    r{num} => num`3
}

#subruledef threereg_instruction {
    cmov => 0
    load => 1
    store => 2
    add => 3
    mul => 4
    div => 5
    nand => 6
}

#subruledef tworeg_instruction {
    map => 8
    loadp => 12
}

#subruledef onereg_instruction {
    unmap => 9
    out => 10
    in => 11
}

#subruledef noreg_instruction {
    halt => 7
}

#ruledef um {
    {i:threereg_instruction} {a:register}, {b:register}, {c:register} => i`4 @ 0`19 @ a`3 @ b`3 @ c`3
    {i:tworeg_instruction} {b:register}, {c:register} => i`4 @ 0`22 @ b`3 @ c`3
    {i:onereg_instruction} {c:register} => i`4 @ 0`25 @ c`3
    {i:noreg_instruction} => i`4 @ 0`28
    loadi {a:register}, {val:u25} => 13`4 @ a`3 @ val
}