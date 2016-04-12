cd ~/.bash_awesome

echo "Copy the bash awesome aliases to the user's folder"
cp ./bashrcs/bash_awesome ~/.bash_awesome

echo "If not there yet, add the code to read the bash_awesome script"

if grep -q "bash_awesome" ~/.bashrc; then
cat >~/.bashrc <<EOL
if [ -f ~/.bash_awesome/bashrcs/bash_awesome ]; then
    . ~/.bash_awesome/bashrcs/bash_awesome
fi
EOL
fi

echo "Installed the Awesome bash configuration successfully! Enjoy :-)"
