GNU Stow Template
=================

Ever wanted all your dotfiles in one folder, with version control and an easy way to deploy it on new machines? If yes, then this template is for you.


Template Installation
---------------------

To setup **and install** this GNU Stow template execute:

    git clone https://github.com/Paradiesstaub/gnu_stow_template.git ~/.dotfiles
    cd ~/.dotfiles
    ./INSTALL


What is GNU Stow?
-----------------

GNU Stow is a program, which allows you to create symbolic links out of one base directory. The Stow base directory of this template is named `.dotfiles` and should be saved in the home folder `~/.dotfiles`. To use Stow the base directory sould follow a certain structure:

`~/[stow dir]/[random name]/[content]`  
`~/.dotfiles/git/.gitconfig`

When executing `stow git`, Stow makes symblolic links from the content of the git folder to `~/.gitconfig`.

This also works for home sub-folders like `~/.config`:
`~/.dotfiles/config/.config/`


Stow Setup Script
-----------------

GNU Stow allows us to easily have something like profiles for different working enviroments e.g. `git` and `git_work`, both could contain a `.gitconfig`, but a slightly different one.

For a really lazy installation, we would need a script that downloads needed packages, configures your local enviroment and runs GNU Stow. Luckily, there is already one!
Have a look at the `INSTALL` script, edit it to fit your needs & have fun.
