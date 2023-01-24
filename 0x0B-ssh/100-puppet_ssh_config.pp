#!/usr/bin/env/bash
# using puppet to make changes to the default ssh config file
# so that one can conect to a server without typing a password
#
# Regex match explanation
#
# ^       beginning of the line
# [#]*  atleast one hash character
# [\s]*  zero or more white space characters
# (?i)IdentityFile case insensitive "IdentityFile"
# [\s]+ at least one whitespace character
# ~/.ssh/id_rsa The ssh private key file path we want to replace
# $      end of the line

exec { 'echo "PasswordAuthentication no\nIdentityFile ~/.ssh/school" >> /etc/ssh/ssh_config':
        path    => '/bin/'
}
# Regex match explanation
#
# ^       beginning of the line
# [#]*  atleast one hash character
# [\s]*  zero or mmore white space characters
# (?i)PasswordAuthentication case insensititve "PasswordAuthentication"
# [\s]+ at least one whitespace character
# (yes|no) with the value "yes" or the value "no"
# $      end of the line
