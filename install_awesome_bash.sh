cd ~/.bash_awesome

echo "Copy the bash awesome aliases to the user's folder"
cp ./bashrcs/bash_awesome ~/.bash_awesome

echo "If not there yet, add the code to read the bash_awesome script"

cat >~/.bashrctest <<EOL
if [ -f ~/.bash_awesome ]; then
    . ~/.bash_awesome
fi
EOL

echo "Installed the Awesome bash configuration successfully! Enjoy :-)"
