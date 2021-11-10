#!/usr/bin/fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_mode_prompt
end

function fish_greeting
end

abbr -a bam bashmount
set -x PATH /home/vcerny/.local/share/gem/ruby/3.0.0/bin:/home/vcerny/.local/bin:/usr/local/sbin:/usr/bin:/usr/local/bin:/bin
