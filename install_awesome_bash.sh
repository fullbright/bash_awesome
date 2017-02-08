cd ~/.bash_awesome

echo "If not there yet, add the code to read the bash_awesome script"

if grep -q bash_awesome ~/.bashrc; then
    echo "bash_awesome is already added to bashrc. Skipping ..."
else
    echo "bash awesome is not installed yet on .bashrc"
    echo "Adding ..."

cat >>~/.bashrc <<EOL
#
# Bash_awesome add some extra commands to your bash console
if [ -f ~/.bash_awesome/bashrcs/bash_awesome ]; then
    . ~/.bash_awesome/bashrcs/bash_awesome
fi
EOL

    echo "Installed the Awesome bash configuration successfully! Enjoy :-)"
    
    echo "Install the history stat cron job for $(whoami) to get the history stats every month"
    crontab -u $(whoami) -l > mycron
    echo "0 0 1 * * bash ~/.bash_awesome/histats.sh" >> mycron
    crontab -u $(whoami) mycron
    rm mycron
    echo "Done. Enjoy :-)"
fi


echo "Done."
