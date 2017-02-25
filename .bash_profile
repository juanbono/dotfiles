###-tns-completion-start-###
if [ -f /home/juan/.tnsrc ]; then 
    source /home/juan/.tnsrc 
fi
###-tns-completion-end-###

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# OPAM configuration
. /home/juan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

###-tns-completion-start-###
if [ -f /home/juan/.tnsrc ]; then 
    source /home/juan/.tnsrc 
fi
###-tns-completion-end-###
